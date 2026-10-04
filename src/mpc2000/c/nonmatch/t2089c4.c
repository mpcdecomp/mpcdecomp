/* differs: 150 size 306, image 210; +1 image `enter 8, 0` CL `enter 0x1e, 0`; 172 size 306, image 210; +1 image `enter 8, 0` CL `enter 0x1e, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_SND_CURRENT {
    long f_0;
};
extern int G_EDIT_FIELD_VAL;
extern int G_EDIT_FIELD_VAL_HI;
extern struct g_SND_CURRENT SND_CURRENT;
extern long __far addr_calc_segment(int, int, int);

void __far sample_data_far_3(void)
{
	int loc_6;
	int loc_4;
	unsigned loc_2;
	unsigned int ax;
	unsigned int ax2;
	int ax3;
	unsigned int ax4;
	int bx;
	int bx2;
	int bx3;
	int dx;
	int dx2;
	int dx3;
	int es;
	int es2;
	int es3;
	int flags;
	long t1;

	bx = (int)SND_CURRENT.f_0;
	es = (int)(SND_CURRENT.f_0 >> 16);
	ax = *(int far *)MK_FP(es, bx + 32) - *(int far *)MK_FP(es, bx + 24);
	ax2 = ax + G_EDIT_FIELD_VAL;
	dx = (int)(*(long far *)MK_FP(es, bx + 32) - *(long far *)MK_FP(es, bx + 24) >> 16) + G_EDIT_FIELD_VAL_HI + (ax2 < ax);
	loc_4 = ax2;
	loc_2 = dx;
	if (loc_2 >= 0) {
		goto L1;
	}
	ax2 = 0;
	loc_2 = ax2;
	loc_4 = ax2;
L1:
	*(int far *)MK_FP(es, bx + 32) = ax2;
	*(int far *)MK_FP(es, bx + 34) = loc_2;
	ax3 = *(int *)((char *)&SND_CURRENT + 0);
	loc_6 = *(int *)((char *)&SND_CURRENT + 2);
	t1 = addr_calc_segment(loc_4, loc_2, 0);
	*(int far *)MK_FP(loc_6, ax3 + 50) = (int)t1;
	*(int far *)MK_FP(loc_6, ax3 + 52) = (int)(t1 >> 16);
	ax4 = G_EDIT_FIELD_VAL;
	dx2 = G_EDIT_FIELD_VAL_HI;
	bx2 = (int)SND_CURRENT.f_0;
	es2 = (int)(SND_CURRENT.f_0 >> 16);
	flags = *(int far *)MK_FP(es2, bx2 + 22) - dx2;
	if (CC("<", flags)) {
		goto L2;
	}
	if (CC(">", flags)) {
		goto L3;
	}
	if ((unsigned int)*(int far *)MK_FP(es2, bx2 + 20) <= ax4) {
		goto L2;
	}
L3:
	*(int far *)MK_FP(es2, bx2 + 20) = ax4;
	*(int far *)MK_FP(es2, bx2 + 22) = dx2;
L2:
	dx3 = G_EDIT_FIELD_VAL_HI;
	bx3 = (int)SND_CURRENT.f_0;
	es3 = (int)(SND_CURRENT.f_0 >> 16);
	*(int far *)MK_FP(es3, bx3 + 24) = G_EDIT_FIELD_VAL;
	*(int far *)MK_FP(es3, bx3 + 26) = dx3;
	return;
}
