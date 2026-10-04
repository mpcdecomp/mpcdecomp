#include "mpc2k.h"

void __near midi_txrx_arm_field(void)
{
	if (SDS_STATE & 7) goto L_0AE57;
	switch (G_ASSIGN_VIEW_FIELD) { case 0: goto X_0AE3C; case 1: goto X_0ADD6; case 2: goto X_0ADF4; case 3: goto X_0AE04; case 4: goto X_0AE1A; case 5: goto X_0AE2A; default: goto br_0ADCE; }
br_0ADCE:
	G_ASSIGN_VIEW_FIELD = 0;
	goto X_0AE3C;
X_0ADD6:
	status_read_6A_3(((char *)&SDS_REQUEST_NUM), 0, 0xff, 3, 0x4b, 0x25, 0L, 0L);
	return;
X_0ADF4:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int))timer_dma_ch2)(((char *)SDS_TX_PORT), 0, 1, 1, 0xe6, 2, 0, 0, 0, 0);
	goto L_0AE57;
X_0AE04:
	((void (__far __pascal *)(char __far *, int, int, int, long))far_035F2)(PTR_LCD_STATE, 0, 0x80, 0x17, 0L);
	return;
X_0AE1A:
	status_read_6A_3(((char *)&SDS_EXCL_CH), 0, 0x7f, 3, 0xce, 0x25, 0L, 0L);
	return;
X_0AE2A:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int))timer_dma_ch2)(((char *)&SDS_STEREO_SIDE), 0, 1, 1, 0xe6, 0x17, 0, 0, 0, 0);
	goto L_0AE57;
X_0AE3C:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int))timer_dma_ch2)(((char *)SDS_RX_PORT), 0, 1, 1, 0x69, 2, 0, 0, 0, 0);
L_0AE57:
	;
}
