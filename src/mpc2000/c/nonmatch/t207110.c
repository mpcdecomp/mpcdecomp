/* differs: 150 size 186, image 120; +0 image `push di` CL `enter 0xa, 0`; 172 size 186, image 120; +0 image `push di` CL `enter 0xa, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
};
struct g_PTR_SAMPLE_DATA {
    long f_0;
};
struct g_PTR_DMA_STATE {
    long f_0;
};
struct g_PTR_SAMPLE_BUF {
    int f_0;
    int f_2;
};
struct g_TBL_6CA4 {
    char pad_0[6858];
    int f_1aca;
};
struct g_TBL_6CA2 {
    char pad_0[6858];
    int f_1aca;
};
extern struct g_PTR_DMA_STATE PTR_DMA_STATE;
extern struct g_PTR_SAMPLE_BUF PTR_SAMPLE_BUF;
extern struct g_PTR_SAMPLE_DATA PTR_SAMPLE_DATA;
extern struct g_TBL_6CA2 TBL_6CA2;
extern struct g_TBL_6CA4 TBL_6CA4;
extern int W_87A2;
extern int W_87A4;

void __far far_074EE(void)
{
	struct s1 __near *bx;
	int bx2;
	int bx3;
	int bx4;
	int cx;
	int dx;
	int es;
	int es2;
	int es3;

	PTR_SAMPLE_BUF.f_0 = 0x6a3a;
	PTR_SAMPLE_BUF.f_2 = SEG_DATA;
	bx = (struct s1 __near *)&TBL_6CA2;
	cx = 127;
L1:
	bx->f_0 = (int)(unsigned)(struct s1 __near *)((char __near *)bx + 14);
	bx->f_2 = SEG_DATA;
	bx = (struct s1 __near *)((char __near *)bx + 54);
	cx = cx - 1;
	if (cx != 0) {
		goto L1;
	}
	TBL_6CA4.f_1aca = 0;
	TBL_6CA2.f_1aca = 0;
	*(int *)((char *)&PTR_SAMPLE_DATA + 0) = -0x7ac6;
	*(int *)((char *)&PTR_SAMPLE_DATA + 2) = SEG_DATA;
	*(int *)((char *)&PTR_DMA_STATE + 0) = -0x7a90;
	*(int *)((char *)&PTR_DMA_STATE + 2) = SEG_DATA;
	W_87A2 = -0x7a90;
	W_87A4 = SEG_DATA;
	bx2 = (int)PTR_SAMPLE_DATA.f_0;
	es = (int)(PTR_SAMPLE_DATA.f_0 >> 16);
	*(int far *)MK_FP(es, bx2 + 46) = 0;
	*(int far *)MK_FP(es, bx2 + 44) = 0;
	bx3 = (int)PTR_DMA_STATE.f_0;
	es2 = (int)(PTR_DMA_STATE.f_0 >> 16);
	*(int far *)MK_FP(es2, bx3 + 42) = 0;
	*(int far *)MK_FP(es2, bx3 + 40) = 0;
	dx = *(int *)((char *)&PTR_SAMPLE_DATA + 2);
	bx4 = (int)PTR_DMA_STATE.f_0;
	es3 = (int)(PTR_DMA_STATE.f_0 >> 16);
	*(int far *)MK_FP(es3, bx4 + 44) = *(int *)((char *)&PTR_SAMPLE_DATA + 0);
	*(int far *)MK_FP(es3, bx4 + 46) = dx;
	return;
}
