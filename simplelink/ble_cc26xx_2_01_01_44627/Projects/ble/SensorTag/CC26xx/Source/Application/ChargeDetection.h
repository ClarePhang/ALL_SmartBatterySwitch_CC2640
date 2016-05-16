#ifndef __CHARGEDETECTION_H
	#define __CHARGEDETECTION_H

typedef enum
{
	CHARGENONE = 0,
	CHARGING,
	CHARGED
	
}STR_CHARGESTATE;	

//״̬���I/O��ʼ��
extern void chargeDetection_Init(void);
extern STR_CHARGESTATE chargeStateRead(void);
extern uint8_t isChargePowerUp(void);
extern void chargedLedState(void);

#endif	
