#include "includes.h"
//===============================================================
//==============��س��״̬���ģ��=============================

static PIN_Handle chargeGpioPin;
static PIN_State chargeGpioState;
static uint8_t chargingFlag = 0;
// Pins that are actively used by the application
static PIN_Config chargePinTable[] =
{
    Board_Charge_RedLED   | PIN_GPIO_OUTPUT_EN | PIN_GPIO_HIGH | PIN_PUSHPULL | PIN_DRVSTR_MAX,     
    Board_Charge_GreenLED | PIN_GPIO_OUTPUT_EN | PIN_GPIO_HIGH | PIN_PUSHPULL | PIN_DRVSTR_MAX,

	Board_Charge_Stat1 	  | PIN_INPUT_EN       | PIN_PULLUP    | PIN_IRQ_DIS,  
	Board_Charge_Stat2    | PIN_INPUT_EN       | PIN_PULLUP    | PIN_IRQ_DIS,	
    Board_Charge_PG       | PIN_INPUT_EN       | PIN_PULLUP    | PIN_IRQ_BOTHEDGES, 
	
    PIN_TERMINATE
};

static void chargeState_Callback(PIN_Handle handle, PIN_Id pinId)
{
	switch (pinId) 
	{

		case Board_Charge_PG:	// ��ŵ�״ָ̬ʾ 0 Ϊ���ϵ�Դ�� 1 Ϊ�ε���Դ
			if (PIN_getInputValue(pinId))
			{
				// �ε���Դ		
				//uartWriteDebug("�ϵ�", 4);
				chargingFlag = 0;
				//OLED_ShowString(0, 48, "rh");
			}
			else
			{
				// ���ϵ�Դ���
				//uartWriteDebug("���", 4);
				userStartClock10ms();
				//OLED_ShowString(0, 48, "ch");
				chargingFlag = 1;
			}
			break;
		default:
			/* Do nothing */
			break;
	}
}

void chargeDetection_Init(void)
{
	chargeGpioPin = PIN_open(&chargeGpioState, chargePinTable);
	// ע��charge �жϺ���
	PIN_registerIntCb(chargeGpioPin, chargeState_Callback );

	PIN_setOutputValue(chargeGpioPin, Board_Charge_RedLED, 0);
	PIN_setOutputValue(chargeGpioPin, Board_Charge_GreenLED, 0);
	
}


//=============================CHARGE STATE ==========================STAT1==STAT2
//Charge in progress                                                    ON    OFF
//Charge complete                                                       OFF   ON
//Charge suspend, timer fault, overvoltage, sleep mode, battery absent  OFF   OFF
// ��ȡ���״̬
STR_CHARGESTATE chargeStateRead(void)
{
	uint8_t stat1;
	uint8_t stat2;
	uint8_t charge = 0;
	
	STR_CHARGESTATE chargeState = CHARGENONE;
	
	stat1 = PIN_getInputValue(Board_Charge_Stat1);
	stat2 = PIN_getInputValue(Board_Charge_Stat2);

	SMB_Read(RELATIVE_SOC, &charge, 1);
	//bspUartWrite(&charge, 1);

	if (1==stat1 && 0==stat2 && charge<100)
	{
		chargeState = CHARGING;
		PIN_setOutputValue(chargeGpioPin, Board_Charge_RedLED, 1);
		PIN_setOutputValue(chargeGpioPin, Board_Charge_GreenLED, 0);
	}
	else if (0==stat1 && 1==stat2 || 100==charge)
	{
		chargeState = CHARGED;
		PIN_setOutputValue(chargeGpioPin, Board_Charge_RedLED, 0);
		PIN_setOutputValue(chargeGpioPin, Board_Charge_GreenLED, 1);
	}
	else if (0==stat1 && 0==stat2)
	{
		chargeState = CHARGENONE;
		PIN_setOutputValue(chargeGpioPin, Board_Charge_RedLED, 0);
		PIN_setOutputValue(chargeGpioPin, Board_Charge_GreenLED, 0);
	}
	else
	{
		PIN_setOutputValue(chargeGpioPin, Board_Charge_RedLED, 0);
		PIN_setOutputValue(chargeGpioPin, Board_Charge_GreenLED, 0);
		//����״̬
	}
		
	return chargeState;
}

uint8_t isChargePowerUp(void)
{
	return chargingFlag;
}

void chargedLedState(void)
{
	PIN_setOutputValue(chargeGpioPin, Board_Charge_RedLED, 0);
	PIN_setOutputValue(chargeGpioPin, Board_Charge_GreenLED, 1);
}
