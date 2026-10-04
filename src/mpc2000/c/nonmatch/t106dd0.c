/* differs: 150 size 320, image 330; +1 image `enter 0x2c, 0` CL `enter 0x24, 0`; 172 size 320, image 330; +1 image `enter 0x2c, 0` CL `enter 0x24, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char G_REC_MODE;
extern char P_03C7;
extern unsigned char P_2DDC[1];
extern char SAMPLE_MONITOR;
extern char TBL_0C38[1];
extern char TBL_0C39[1];
extern long __far __pascal dma_field_write(int, char far *, int);

long __near dac_out_program(void)
{
	char loc_2c[2];
	char loc_2a[6];
	int loc_24;
	char loc_22[22];
	int loc_c;
	int loc_a;
	int ax;
	int ax2;
	int ax3;
	int dx;
	int si;
	int si2;
	int si3;

	if (SAMPLE_MONITOR != 0) {
		goto L1;
	}
	goto L2;
L1:
	__movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2c), (unsigned char far *)P_2DDC, 44);
	*(int *)((char *)&loc_2a + 0) = 0x1000;
	loc_24 = 0x1114;
	*(int *)((char *)&loc_22 + 0) = 16;
	if (G_REC_MODE == 2) {
		goto L3;
	}
	goto L4;
L3:
	loc_a = 0;
	loc_c = -0x8000;
	ax = (int)dma_field_write(21, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2c), 0x1ffe);
	if (P_03C7 == 0) {
		goto L5;
	}
	loc_a = 0x4000;
	si2 = 1;
L6:
	loc_c = 0;
	*(char *)((char *)&loc_a + 0) = (char)(*(char *)((char *)&loc_a + 0) & -16);
	loc_a = loc_a | TBL_0C38[si2];
	ax2 = (int)dma_field_write(si2, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2c), 0x1ffe);
	si2 = si2 + 2;
	if (si2 <= 7) {
		goto L6;
	}
L5:
	*(int *)((char *)&loc_2a + 0) = 0x1114;
	loc_24 = 0x1228;
	*(int *)((char *)&loc_22 + 0) = 16;
	loc_a = 0;
	loc_c = 128;
	dx = (int)(dma_field_write(23, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2c), 0x1ffe) >> 16);
	if (P_03C7 != 0) {
		goto L7;
	}
	goto L8;
L7:
	loc_c = 0;
	loc_a = 0x4000;
	si3 = 2;
L9:
	*(char *)((char *)&loc_a + 0) = (char)(*(char *)((char *)&loc_a + 0) & -16);
	loc_a = loc_a | TBL_0C38[si3];
	dx = (int)(dma_field_write(si3, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2c), 0x1ffe) >> 16);
	si3 = si3 + 2;
	if (si3 <= 8) {
		goto L9;
	}
	goto L8;
L4:
	loc_a = 0;
	loc_c = -0x7f80;
	dx = (int)(dma_field_write(21, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2c), 0x1ffe) >> 16);
	if (P_03C7 == 0) {
		goto L8;
	}
	loc_c = 0;
	loc_a = 0x4000;
	si = 0;
L10:
	*(char *)((char *)&loc_a + 0) = (char)(*(char *)((char *)&loc_a + 0) & -16);
	loc_a = loc_a | TBL_0C39[si];
	dx = (int)(dma_field_write(si + 1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2c), 0x1ffe) >> 16);
	si = si + 1;
	if (si < 8) {
		goto L10;
	}
L8:
	ax3 = (1 << 8 | (unsigned char)(inp(136) & 127));
	outpw(136, ax3);
L2:
	return ((long)dx << 16 | (unsigned)ax3);
}
