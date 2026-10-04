#include <conio.h>
void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(memset)
extern char BUF_XFER[1];
extern char G_REC_MODE;
long __far __pascal dma_field_write(char, char far *, int);
void __far __pascal mpc_poll_data2(int);
void __far __pascal smem_poll_ready(char far *);

void __near smem_audio_init(void)
{
	char l44[44];
	int ax_;

	memset(l44, 0, 0x2c);
	*(int *)(l44 + 4) = 0x100;
	*(int *)(l44 + 6) = 0x1000;
	*(int *)(l44 + 14) = 0x1140;
	*(int *)(l44 + 12) = -0x1000;
	*(int *)(l44 + 2) = 0x1000;
	*(int *)(l44 + 8) = 0x1114;
	*(int *)(l44 + 10) = 0x10;
	dma_field_write(0, l44, 0x1e06);
	if (G_REC_MODE != 2) goto dma_06B19;
	*(int *)(l44 + 2) = 0x1114;
	*(int *)(l44 + 8) = 0x1228;
	*(int *)(l44 + 10) = 0x10;
	dma_field_write(0x10, l44, 0x1e06);
dma_06B19:
	outp(0xc031, 3);
	smem_poll_ready(BUF_XFER);
	outpw(0xc032, 0x3ff);
	outp(0xc03a, 0x59);
	mpc_poll_data2(8);
	outpw(0x88, G_REC_MODE == 2 ? 0x58 : 0x40);
dma_06B4F:
	if (inp(0x88) & 0x80) goto dma_06B4F;
}
