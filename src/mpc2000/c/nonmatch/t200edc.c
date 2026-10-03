/* differs: 150 size 316, image 218; +1 image `enter 0x8a, 0` CL `enter 0x96, 0`; 172 size 316, image 218; +1 image `enter 0x8a, 0` CL `enter 0x96, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_SMEM_POOL_BASE_HI {
    int f_0;
};
struct g_SMEM_POOL_NEXT {
    int f_0;
};
struct g_SMEM_POOL_LEN {
    int f_0;
};
struct g_SMEM_POOL {
    int f_0;
};
struct g_SMEM_POOL_LEN_HI {
    int f_0;
};
extern struct g_SMEM_POOL SMEM_POOL;
extern struct g_SMEM_POOL_BASE_HI SMEM_POOL_BASE_HI;
extern struct g_SMEM_POOL_LEN SMEM_POOL_LEN;
extern struct g_SMEM_POOL_LEN_HI SMEM_POOL_LEN_HI;
extern struct g_SMEM_POOL_NEXT SMEM_POOL_NEXT;
extern int SMEM_POOL_USED;
extern long __far __pascal input_handler(long, long, long);

long __far smem_compact(void)
{
	int loc_8a;
	int loc_88;
	char loc_86[130];
	long loc_4;
	int loc_2;
	unsigned int ax;
	unsigned int ax2;
	int ax3;
	int bx;
	int bx2;
	int bx3;
	int bx4;
	int bx5;
	int di;
	int dx;
	int dx2;
	int dx3;
	int es;
	int p146;
	int p148;
	int p150;
	int p152;
	int p154;
	int p156;
	int p158;
	int si;
	int si2;
	int si3;
	long t1;

	bx = SMEM_POOL_USED;
	di = 0;
	if (bx == 130) {
		goto L1;
	}
L2:
	si = ((bx << 2) + bx) * 2;
	loc_88 = si;
	if ((*(int *)((char *)&SMEM_POOL_BASE_HI + 0 + si) & 0x100) != 0) {
		goto L3;
	}
	di = di + 1;
	*(char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(long __near *)((char __near *)&loc_4 - di)) = (char)bx;
L3:
	bx = *(int *)((char *)&SMEM_POOL_NEXT + 0 + loc_88);
	if (bx != 130) {
		goto L2;
	}
L1:
	si2 = 130 - di;
	bx2 = ((char)(bx >> 8) << 8 | (unsigned char)loc_86[si2]);
	bx3 = (((unsigned char)(char)bx2 << 2) + (unsigned char)(char)bx2) * 2;
	ax = *(int *)((char *)&SMEM_POOL_LEN + 0 + bx3);
	ax2 = ax + *(int *)((char *)&SMEM_POOL + 0 + bx3);
	dx = *(int *)((char *)&SMEM_POOL_LEN_HI + 0 + bx3) + *(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx3) + (ax2 < ax);
	*(int *)((char *)&loc_4 + 0) = ax2;
	loc_2 = dx;
	si3 = si2 + 1;
	if (si3 >= 130) {
		goto L4;
	}
L5:
	ax3 = *(int *)((char *)&loc_4 + 0);
	dx2 = loc_2;
	bx4 = ((char)(bx3 >> 8) << 8 | (unsigned char)loc_86[si3]);
	bx5 = (((unsigned char)(char)bx4 << 2) + (unsigned char)(char)bx4) * 2;
	loc_8a = bx5;
	if (*(int *)((char *)&SMEM_POOL + 0 + bx5) != ax3) {
		goto L6;
	}
	if (*(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx5) == dx2) {
		goto L7;
	}
L6:
	p146 = *(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx5);
	p148 = *(int *)((char *)&SMEM_POOL + 0 + bx5);
	p150 = dx2;
	p152 = ax3;
	p154 = *(int *)((char *)&SMEM_POOL_LEN_HI + 0 + bx5);
	p156 = *(int *)((char *)&SMEM_POOL_LEN + 0 + bx5);
	p158 = 0x0b50;
	t1 = input_handler(((long)p146 << 16 | (unsigned)p148), ((long)p150 << 16 | (unsigned)p152), ((long)p154 << 16 | (unsigned)p156));
	es = UNDEF;
	dx3 = loc_2;
	*(int *)((char *)&SMEM_POOL + 0 + loc_8a) = *(int *)((char *)&loc_4 + 0);
	*(int *)((char *)&SMEM_POOL_BASE_HI + 0 + loc_8a) = dx3;
L7:
	bx3 = loc_8a;
	ax2 = *(int *)((char *)&SMEM_POOL_LEN + 0 + bx3);
	dx = *(int *)((char *)&SMEM_POOL_LEN_HI + 0 + bx3);
	*(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + ax2;
	loc_2 = (int)(loc_4 + ((long)dx << 16 | (unsigned)ax2) >> 16);
	si3 = si3 + 1;
	if (si3 < 130) {
		goto L5;
	}
L4:
	return ((long)dx << 16 | (unsigned)ax2);
}
