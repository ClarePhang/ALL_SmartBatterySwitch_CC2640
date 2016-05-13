#include "includes.h"

/**
��Ҫ�Ƕ� ������OLED�͵�ؼ�صĴ���
***/

// Task configuration
#define USER_TASK_PRIORITY                      2
#define USER_TASK_STACK_SIZE                    700
// ��ʱ�¼�
#define USER_10MS_EVT							0x0010
#define USER_100MS_EVT							0x0020

// Task configuration
static Task_Struct userAppTask;

// Clock instances for internal periodic events.
static Clock_Struct periodicClock_10ms;
static Clock_Struct periodicClock_100ms;

static uint16_t userEvents = 0;

extern ICall_Semaphore sem;

//===========================================================

typedef struct
{
    uint32_t             _10msCount;
    uint32_t             _50msCount;
    uint32_t             _100msCount;
    uint32_t             _500msCount;
    uint32_t             Pollintack;
} STR_POLLINT;

static STR_POLLINT r_pollint;

typedef struct
{
	uint16_t delayPowerOffTime;
	uint8_t  powerOffFlag;
	uint8_t  keyUpFlag;
	uint8_t  keyShortFlag;
	uint8_t  lowBatteryFlag;
	uint8_t  chargingFlag;
	uint8_t  chargeState;
	uint8_t  delayCnt;
} STR_USERAPP;

static STR_USERAPP systemState;

uint8_t userAppShowCharge(void);

/*******************************************************************************
 * PUBLIC FUNCTIONS
 */
/*******************************************************************************
 * @fn		SensorTag_clockHandler
 *
 * @brief	Handler function for clock time-outs.
 *
 * @param	arg - event type
 *
 * @return	none
 */
static void userApp_clockHandler(UArg arg)
{
	// Store the event.
	userEvents |= arg;

	// Wake up the application.
	//Semaphore_post(userSem);
	Semaphore_post(sem);
}

// ����1-9ÿ1��ִ��һ��
static void Pollint1Sec(void)
{
    switch(r_pollint._100msCount)
    {
        case 1:
			if (0)
			{
				uint8_t smbBuf[3];
				bspUartWrite("Test=", 5);
				SMB_Read(RELATIVE_SOC, smbBuf, 1);
				bspUartWrite(smbBuf, 1);
				SMB_Read(ABSOLUTE_SOC, smbBuf, 1);
				bspUartWrite(smbBuf, 1);
				SMB_Read(CYCLE_COUNT, smbBuf, 2);
				bspUartWrite(smbBuf, 2);
				SMB_Read(DESIGN_CAPACITY, smbBuf, 2);
				bspUartWrite(smbBuf, 2);
			}
            break;
        case 2:
			if (systemState.delayPowerOffTime)
			{
				if (--systemState.delayPowerOffTime == 0)
				{
					systemState.powerOffFlag = 0;
					//�����ⲿ�ж�
					KEY_EnableIRQ();

					//�ص�ʱ��
					bspUartWrite("tmout", 5);
					Util_stopClock(&periodicClock_10ms);
				}
			}
			else if (systemState.powerOffFlag!=1 && systemState.keyUpFlag==0)
			{
				/* 
				�ڳ����ػ�ʱ����û�ɿ�ǰĬ���ǹػ������Բ�����ʾͼ��
				
				�ڳ�������ʱ����Ϊ�̰������ж�ϵͳ����������ʱ���ǿ����¼���
				����Ҳ������ʾͼ��
				*/
				
				systemState.lowBatteryFlag = userAppShowCharge();

				if (2 == systemState.lowBatteryFlag)
				{
					OLED_ShowString(40, 0, "           ");
					OLED_ShowString(40, 0, "No battery ");  
				}
				else if (1 == systemState.lowBatteryFlag)
				{
					// û�� ͼ����˸����
				}
				else
				{
					//������ʾ
				}
				//OLED_testShowGengeeRoll(3);
			}
            break;
        case 3:
			chargeStateRead();
            break;
        default:
            break;
    }
}

// ����1-9ÿ100����ִ��һ��
static void Pollint100mSec(void)
{
    switch(r_pollint._10msCount)
    {
		case 0:
			Pollint1Sec();
			break;
        case 1:
			
            break;
		case 2:
            if ((r_pollint._500msCount++) >= 5)
            {
                r_pollint._500msCount = 0;
				if (1 == systemState.lowBatteryFlag)
				{
					static uint8_t bmpFlash = 0;
					if (bmpFlash)
					{
						bmpFlash = 0;
						OLED_showBatteryBmp(0, 88, 8);
					}
					else
					{						
						bmpFlash = 1;
						OLED_showBatteryBmp(0, 88, 6);
					}
				}
                OLED_Refresh_Gram();//������ʾ
            }
			break;
        case 3:
			//OLED_Refresh_Gram();//������ʾ
            break;
        case 4:
			if (3 == systemState.keyUpFlag)
			{
				if (systemState.delayCnt-- == 0)
				{
					systemState.keyUpFlag = 0;
					{							
						// �رչ㲥
						uint8_t initialAdvertEnable = FALSE;
						GAPRole_SetParameter(GAPROLE_ADVERT_ENABLED, sizeof(uint8_t), &initialAdvertEnable);
					}
					Util_stopClock(&periodicClock_10ms);
				}
					
			}
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            break;
        case 8:
            break;
        default:
            break;
    }
}

// ÿ10�������������ʱ��
static void ChangeTime10mSec(void)
{
    r_pollint._10msCount = (r_pollint._10msCount + 1) % 10;
    if(r_pollint._10msCount == 0)
    {
        r_pollint._100msCount = (r_pollint._100msCount + 1) % 10;
    }
    
}

/*******************************************************************************
 * @fn      userAppInit
 *
 * @brief   user Application init
 *
 * @param   void
 *
 * @return  none
 */
void userAppInit(void)
{
	OLED_Init();
// ���״̬����ʼ��I2C	
    SMB_Init(); 
// ���ڳ�ʼ��	
	bspUartInit();  
	
// ������ʼ��Ҫ��ϵͳ�ȶ��󣬷�ֹ�ⲿ�ж�����ϵͳ����
	KEY_Init();

//���״̬����ʼ��
	chargeDetection_Init();
	
	// Create one-shot clocks for internal periodic events.
	Util_constructClock(&periodicClock_10ms, userApp_clockHandler,
	                  10, 0, false, USER_10MS_EVT);
	Util_startClock(&periodicClock_10ms);

	OLED_ShowString(40,32, "WiCore"); 

	Task_sleep(300);
}

/*******************************************************************************
 * @fn      userAppPro
 *
 * @brief   user Application event process
 *
 * @param   evnet
 *
 * @return  none
 */
void userAppPro(void)
{
	if (userEvents & USER_10MS_EVT)
	{
		userEvents &= ~USER_10MS_EVT;
		
		Util_startClock(&periodicClock_10ms);
		
		KEY_Scan_10ms();
		
		ChangeTime10mSec();

		Pollint100mSec();
	}

#if 1
	while (!Queue_empty(keyMsgQueue))
	{
		KEY_stEvt_t *pMsg = (KEY_stEvt_t *)Util_dequeueMsg(keyMsgQueue);
		if (pMsg)
		{
			// Process message.
			switch(pMsg->GPIOName)
			{
				case KEY_NAME_3V3:
					if (KEY_HIGH == pMsg->GPIOStatus)
					{
						wifiPowerOn();
						bspUartWrite("poweron3v3", 10);
						OLED_ShowString(40,32, "WiCore"); 
						
						userAppShowCharge();
						// �����㲥
						{
							uint8_t initialAdvertEnable = TRUE;
							GAPRole_SetParameter(GAPROLE_ADVERT_ENABLED, sizeof(uint8_t), &initialAdvertEnable);
						}
						Util_startClock(&periodicClock_10ms);
					}
					else
					{
						wifiPowerDown();
						bspUartWrite("powerdown3v3", 12);
						// ��͵���˸
						systemState.lowBatteryFlag = 0;
						OLED_Clear(); // ���ִ��ʱ��ϳ� �����˶�ʱ���ڣ�����stopClock��û���õ�
						//Util_stopClock(&periodicClock_10ms);
					
						// �������İ������ػ� ����һ�������ſ���־λ���ȴ�1s��û�зſ�
						// �����־λ���ر�ʱ��	
						systemState.keyUpFlag = 3;	     // 2 Ϊ��Դ���� �ȴ������ſ���־��3Ϊ ����������
						systemState.delayCnt = 10;
						// �����ӣ��ر�	
						GAPRole_TerminateConnection();
						
					}
					break;
				case KEY_POWER:
					if (KEY_IQR == pMsg->GPIOStatus)
					{
						KEY_DisableIRQ();
						bspUartWrite("tttt", 4);
						systemState.powerOffFlag = 1;
						systemState.delayPowerOffTime = 5; // ��ʱ5s �ж��Ƿ��ǰ�������
						Util_startClock(&periodicClock_10ms);
					}
					else if (KEY_LONG == pMsg->GPIOStatus)
					{
						if (1 == systemState.powerOffFlag)
						{
							systemState.powerOffFlag = 0;
							systemState.delayPowerOffTime = 0;
							wifiPowerOn();
							
							userAppShowCharge();
							OLED_ShowString(40,32, "WiCore");
							
							// �����㲥
							{
								uint8_t initialAdvertEnable = TRUE;
								GAPRole_SetParameter(GAPROLE_ADVERT_ENABLED, sizeof(uint8_t), &initialAdvertEnable);
							}

							bspUartWrite("poweron", 7);
						}
						else
						{
							//ϵͳ�ϵ�
							
							wifiPowerDown();
							bspUartWrite("powerdown", 9);
							
							OLED_Clear();
													
							systemState.lowBatteryFlag = 0;  // ��͵���˸ 
							systemState.keyUpFlag = 2;	     // 2 Ϊ��Դ���� �ȴ������ſ���־��3Ϊ ����������
							// �����ӣ��ر�	
							GAPRole_TerminateConnection();
						}
						systemState.keyShortFlag = 0;   // ���Զ̰��¼� 
						
					}
					else if (KEY_LOW == pMsg->GPIOStatus)// �ɿ�
					{
						if (2 == systemState.keyUpFlag)	// �����ɿ����ػ� 
						{
							systemState.keyUpFlag = 0;
							//�����ⲿ�ж�
							KEY_EnableIRQ();
							{		
								// �رչ㲥
								uint8_t initialAdvertEnable = FALSE;
								GAPRole_SetParameter(GAPROLE_ADVERT_ENABLED, sizeof(uint8_t), &initialAdvertEnable);
							}
							Util_stopClock(&periodicClock_10ms);
						}
						else if (1 == systemState.keyShortFlag)// �̰��ɿ� ����һ�ζ̰������¼�
						{
							//�̰��¼�����
							bspUartWrite("�̰�", 4);
						}
					}
					else if (KEY_HIGH == pMsg->GPIOStatus) // �̰�
					{
						if (1 == systemState.powerOffFlag) // �ȴ������¼� ���Դ�ʱ�Ķ̰��¼�
						{
							systemState.delayPowerOffTime = 5;	// ��ֹtimout ʣ2sʱ�ֲ��������¼�					
						}
						else
						{
							systemState.keyShortFlag = 1;
						}
						
					}
					break;
				default:
					break;
			}
	
			// Free the space from the message.
			ICall_free(pMsg);
		}
	}
#endif
}

/*******************************************************************************
 * @fn      userAppClockStop
 *
 * @brief   stop task clock
 *
 * @param   evnet
 *
 * @return  none
 */
void userAppClockStop(void)
{
	Util_stopClock(&periodicClock_10ms);
}

/*******************************************************************************
 * @fn      userAppShowCharge
 *
 * @brief   ���ͼ��Ͱٷֱȵ���ʾ
 *
 * @param   void
 *
 * @return  0 �е磬1 û��
 */
uint8_t userAppShowCharge(void)
{
	uint8_t smbBuf[4];
	uint8_t charge;
	uint8_t chargeState = 6;
	uint8_t bmpMov = 0;
	
	SMB_Read(RELATIVE_SOC, &charge, 1);
	//bspUartWrite(&charge, 1);

	OLED_ShowString(40,0, "          ");	// ������ʾ����
	
	if (charge >100)
	{
		return 2;
	}
	if (100 == charge)
	{
		bmpMov = 8;
		chargeState = 0;
	}
	else if (charge > 90)
	{
		chargeState = 0;
	}
	else if(charge > 76)
	{
		chargeState = 1;
	}
	else if(charge > 62)
	{
		chargeState = 2;
	}
	else if(charge > 48)
	{
		chargeState = 3;
	}
	else if(charge > 34)
	{
		chargeState = 4;
	}
	else if(charge > 10)
	{
		chargeState = 5;
	}
	else
	{
		sprintf((char *)smbBuf, "%02d%", charge);
		OLED_ShowString(104,0, smbBuf);	
		return 1;
	}
	
	sprintf((char *)smbBuf, "%02d%", charge);
	if (0==isChargePowerUp() || 100==charge)
	{
		
		OLED_showBatteryBmp(0, 88-bmpMov, chargeState);

	}
	else
	{
		OLED_showBatteryBmp(0, 88, 7);	// ��ʾ���ͼ��
	}
	OLED_ShowString(104-bmpMov, 0, smbBuf);	
	return 0;
}
