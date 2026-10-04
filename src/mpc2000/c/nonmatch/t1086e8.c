/* differs: 150 size 576, image 400; +1 image `enter 0x14, 0` CL `enter 0x22, 0`; 172 size 576, image 400; +1 image `enter 0x14, 0` CL `enter 0x22, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_SMEM_POOL {
    int f_0;
};
struct g_SMEM_POOL_BASE_HI {
    int f_0;
};
extern unsigned char BUF_XFER[1];
extern struct g_SMEM_POOL SMEM_POOL;
extern struct g_SMEM_POOL_BASE_HI SMEM_POOL_BASE_HI;
extern long __far __pascal flash_write_words();
extern long __far __pascal smem_dma_copy(int, int, unsigned char far *, int, int);

void __near __pascal zone_action_reverse(int arg_10, int arg_8, int arg_6, long arg_4, int arg_2, long arg_0)
{
	long t6;
	long t5;
	long t4;
	long t3;
	long t2;
	long t1;
	int p38;
	int p36;
	int p34;
	int p32;
	int p30;
	int p28;
	int dx6;
	int dx5;
	int dx4;
	int dx3;
	int dx2;
	int dx;
	int di;
	unsigned int cx;
	int bx2;
	int bx;
	int ax3;
	unsigned int ax2;
	unsigned int ax;
	int loc_2;
	long loc_4;
	int loc_6;
	long loc_8;
	char loc_c[4];
	int loc_e;
	int loc_10;
	int loc_12;
	int loc_14;

	di = *(char far *)MK_FP(arg_10, arg_8 + 19) + 1;
	if (di != 0) {
		goto L1;
	}
	goto L2;
L1:
	bx = ((*(int far *)MK_FP(arg_10, arg_8 + 48) << 2) + *(int far *)MK_FP(arg_10, arg_8 + 48)) * 2;
	ax = *(int *)((char *)&SMEM_POOL + 0 + bx);
	dx = *(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx);
	ax2 = ax + *(int *)((char *)&arg_4 + 0);
	dx2 = dx + arg_6 + (ax2 < ax);
	*(int *)((char *)&loc_4 + 0) = ax2;
	loc_2 = dx2;
	cx = ax + *(int *)((char *)&arg_0 + 0);
	bx2 = dx + arg_2 + (cx < ax);
	*(int *)((char *)&loc_8 + 0) = cx;
	loc_6 = bx2;
	if (cx != ax2) {
		goto L3;
	}
	if (bx2 != dx2) {
		goto L3;
	}
	goto L4;
L3:
	dx3 = (int)(((long)bx2 << 16 | (unsigned)cx) - loc_4 >> 16);
	if (cx - *(int *)((char *)&loc_4 + 0) != 1) {
		goto L5;
	}
	if (dx3 != 0) {
		goto L5;
	}
	goto L4;
L5:
	dx4 = (int)(loc_8 - loc_4 >> 16);
	if (dx4 >= 0) {
		goto L6;
	}
	goto L7;
L6:
	if (dx4 > 0) {
		goto L8;
	}
	if ((unsigned int)(*(int *)((char *)&loc_8 + 0) - *(int *)((char *)&loc_4 + 0)) > 0x400) {
		goto L8;
	}
	goto L7;
L8:
	loc_e = ((char)(*(int *)((char *)&loc_4 + 0) >> 8) + 2 << 8 | (unsigned char)(char)*(int *)((char *)&loc_4 + 0));
	*(int *)((char *)&loc_c + 0) = loc_2 + ((unsigned char)(char)(loc_e >> 8) < (unsigned char)(char)(*(int *)((char *)&loc_4 + 0) >> 8));
	t3 = smem_dma_copy(*(int *)((char *)&loc_c + 0) - (loc_e == 0), loc_e - 1, (unsigned char far *)BUF_XFER, 0x200, -0x1000);
	p38 = -0x1000;
	t4 = smem_dma_copy(loc_6 - (*(int *)((char *)&loc_8 + 0) == 0), *(int *)((char *)&loc_8 + 0) - 1, MK_FP(SEG_DATA, -0x5f20), 0x200, p38);
	t5 = flash_write_words(loc_2, *(int *)((char *)&loc_4 + 0), MK_FP(SEG_DATA, -0x5f20), 0x200);
	dx5 = (int)(loc_8 - 0x200L >> 16);
	p28 = dx5;
	p30 = *(int *)((char *)&loc_8 + 0) - 0x200;
	p32 = SEG_DATA;
	p34 = (int)(unsigned)BUF_XFER;
	p36 = 0x200;
	loc_12 = *(int *)((char *)&loc_8 + 0) - 0x200;
	loc_10 = dx5;
	t6 = flash_write_words(p28, p30, p32, p34, p36);
	*(int *)((char *)&loc_4 + 0) = loc_e;
	loc_2 = *(int *)((char *)&loc_c + 0);
	cx = loc_12;
	bx2 = loc_10;
	*(int *)((char *)&loc_8 + 0) = cx;
	loc_6 = bx2;
	if (cx == *(int *)((char *)&loc_4 + 0)) {
		goto L9;
	}
	goto L3;
L9:
	if (bx2 == *(int *)((char *)&loc_c + 0)) {
		goto L10;
	}
	goto L3;
L10:
	goto L4;
L7:
	p38 = -0x1000;
	loc_14 = *(int *)((char *)&loc_8 + 0) - *(int *)((char *)&loc_4 + 0);
	t1 = smem_dma_copy(loc_6 - (*(int *)((char *)&loc_8 + 0) == 0), *(int *)((char *)&loc_8 + 0) - 1, (unsigned char far *)BUF_XFER, loc_14, p38);
	p28 = loc_2;
	p30 = *(int *)((char *)&loc_4 + 0);
	p32 = SEG_DATA;
	p34 = (int)(unsigned)BUF_XFER;
	p36 = loc_14;
	t2 = flash_write_words(p28, p30, p32, p34, p36);
L4:
	arg_10 = arg_10;
	dx6 = (int)(*(long far *)MK_FP(arg_10, arg_8 + 28) + 15L >> 16);
	ax3 = ((char)(*(int far *)MK_FP(arg_10, arg_8 + 28) + 15 >> 8) << 8 | (unsigned char)((char)*(int far *)MK_FP(arg_10, arg_8 + 28) + 15 & -16));
	*(int *)((char *)&arg_4 + 0) = *(int *)((char *)&arg_4 + 0) + ax3;
	arg_6 = (int)(arg_4 + ((long)dx6 << 16 | (unsigned)ax3) >> 16);
	*(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + ax3;
	arg_2 = (int)(arg_0 + ((long)dx6 << 16 | (unsigned)ax3) >> 16);
	di = di - 1;
	if (di == 0) {
		goto L2;
	}
	goto L1;
L2:
	return;
}
