#include "mpc2k.h"

void __far L_043EE(void)
{
	((void (__far __pascal *)(char __far *, int, int, char, void (__far *)(void), void (__far *)(void)))seq_write_data)(((char *)&PGM_SLOT), 1, (*(unsigned char *)TBL_1360), TBL_1361[0], L_043E2, G_STATE_9D8B >= FX_MULTI_COUNT ? (void (far *)(void))L_04588 : (void (far *)(void))X_04888);
}
