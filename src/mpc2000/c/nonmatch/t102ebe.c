/* differs: 150 size 254, image 148; +0 image `push bp` CL `enter 0xe, 0`; 172 size 254, image 148; +0 image `push bp` CL `enter 0xe, 0` */
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
extern struct g_SMEM_POOL SMEM_POOL;
extern struct g_SMEM_POOL_BASE_HI SMEM_POOL_BASE_HI;

void __near __pascal mpc_ctrl_init(int arg_6, int arg_4, int arg_2, int arg_0)
{
	int dx3;
	int dx2;
	int dx;
	int bx2;
	int bx;
	int ax3;
	unsigned int ax2;
	unsigned int ax;

	bx = *(int far *)MK_FP(arg_2, arg_0 + 48);
	bx2 = ((bx << 2) + bx) * 2;
	ax = *(int *)((char *)&SMEM_POOL + 0 + bx2);
	ax2 = ax + *(int far *)MK_FP(arg_2, arg_0 + 24);
	dx = *(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx2) + *(int far *)MK_FP(arg_2, arg_0 + 26) + (ax2 < ax);
	*(int far *)MK_FP(arg_6, arg_4 + 26) = ax2;
	*(int far *)MK_FP(arg_6, arg_4 + 28) = dx;
	ax3 = *(int far *)MK_FP(arg_6, arg_4 + 26);
	dx2 = (int)(((long)dx << 16 | (unsigned)ax3) - *(long far *)MK_FP(arg_2, arg_0 + 32) >> 16);
	*(int far *)MK_FP(arg_6, arg_4 + 30) = ax3 - *(int far *)MK_FP(arg_2, arg_0 + 32);
	*(int far *)MK_FP(arg_6, arg_4 + 32) = dx2;
	dx3 = *(int far *)MK_FP(arg_2, arg_0 + 52);
	*(int far *)MK_FP(arg_6, arg_4 + 34) = *(int far *)MK_FP(arg_2, arg_0 + 50);
	*(int far *)MK_FP(arg_6, arg_4 + 36) = dx3;
	if ((*(int far *)MK_FP(arg_2, arg_0 + 34) | *(int far *)MK_FP(arg_2, arg_0 + 32)) != 0) {
		goto L1;
	}
	*(char far *)MK_FP(arg_6, arg_4 + 4) = (char)0;
	return;
L1:
	*(char far *)MK_FP(arg_6, arg_4 + 4) = *(char far *)MK_FP(arg_2, arg_0 + 36);
	return;
}
