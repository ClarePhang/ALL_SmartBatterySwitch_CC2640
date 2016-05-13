#include "includes.h"

extern ICall_Semaphore sem;

#ifdef INCLUDE_KEY

static PIN_Handle KEYGpioPin;
static PIN_State keyPinGpioState;

// Queue object used for app messages
Queue_Struct keyMsg;
Queue_Handle keyMsgQueue;

// Pins that are actively used by the application
static PIN_Config KEYPinTable[] =
{
    Board_KEY_3V3   | PIN_INPUT_EN | PIN_IRQ_BOTHEDGES,     
    Board_POWER     | PIN_INPUT_EN | PIN_IRQ_BOTHEDGES, 
    Board_KEY_STATE | PIN_GPIO_OUTPUT_EN | PIN_GPIO_HIGH | PIN_PUSHPULL | PIN_DRVSTR_MAX,

	PIN_TERMINATE
};

static void KEY_Callback(PIN_Handle handle, PIN_Id pinId)
{
	KEY_stEvt_t *tempMsg;

  // Create dynamic pointer to message.
	if (tempMsg = ICall_malloc(sizeof(KEY_stEvt_t)))
	{
		switch (pinId) {

			case Board_KEY_3V3:
				tempMsg->GPIOName = KEY_NAME_3V3;
				if (PIN_getInputValue(Board_KEY_3V3))
				{
					tempMsg->GPIOStatus = KEY_HIGH;
				}	
				else
				{	
					tempMsg->GPIOStatus = KEY_LOW;
				}
				break;
			case Board_POWER:

				break;
			default:
				/* Do nothing */
				break;
		}
		Util_enqueueMsg(keyMsgQueue, sem, (uint8_t *)tempMsg);
	}	 	
}

/*****************wifi ģ���Դ���� *************/

//����Դ
void wifiPowerOn(void)
{
  PIN_setOutputValue(KEYGpioPin, Board_KEY_STATE,1);
}

// �ص�Դ
void wifiPowerDown(void)
{
  PIN_setOutputValue(KEYGpioPin, Board_KEY_STATE,0);
}


void KEY_Init(void)
{
	KEYGpioPin = PIN_open(&keyPinGpioState, KEYPinTable);
	// ע��key �жϺ���
	PIN_registerIntCb(KEYGpioPin, KEY_Callback );
	
	// �ϵ�Ĭ�Ϲ�wifi��Դ
    PIN_setOutputValue(KEYGpioPin, Board_KEY_STATE, 0);

	// Create an RTOS queue for message from profile to be sent to app.
	keyMsgQueue = Util_constructQueue(&keyMsg);
}

#endif
