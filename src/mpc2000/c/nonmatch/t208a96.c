/* differs: 150 size 294, image 174; +1 image `enter 8, 0` CL `enter 0x24, 0`; 172 size 294, image 174; +1 image `enter 8, 0` CL `enter 0x24, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int G_EDIT_FIELD_VAL;
extern int G_EDIT_FIELD_VAL_HI;
extern char far *SND_CURRENT;
extern long __far addr_calc_segment(int, int, int);

void __far sample_data_far_4(void)
{
	int loc_6;
	int loc_4;
	unsigned loc_2;
	unsigned int ax;
	unsigned int ax2;
	int ax3;
	int ax4;
	int ax5;
	unsigned int ax6;
	unsigned int ax7;
	int bx;
	int bx2;
	int dx;
	int dx2;
	int dx3;
	int es;
	int es2;
	long t1;

	bx = (int)*(long *)((char *)&SND_CURRENT + 0);
	es = (int)(*(long *)((char *)&SND_CURRENT + 0) >> 16);
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
	ax4 = *(int *)((char *)&SND_CURRENT + 0);
	loc_2 = *(int *)((char *)&SND_CURRENT + 2);
	ax5 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 20);
	ax6 = ax5 - *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 24);
	ax7 = ax6 + G_EDIT_FIELD_VAL;
	dx2 = (int)(((long)*(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 22) << 16 | (unsigned)ax5) - *(long far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 24) >> 16) + G_EDIT_FIELD_VAL_HI + (ax7 < ax6);
	*(int far *)MK_FP(loc_2, ax4 + 20) = ax7;
	*(int far *)MK_FP(loc_2, ax4 + 22) = dx2;
	dx3 = G_EDIT_FIELD_VAL_HI;
	bx2 = (int)*(long *)((char *)&SND_CURRENT + 0);
	es2 = (int)(*(long *)((char *)&SND_CURRENT + 0) >> 16);
	*(int far *)MK_FP(es2, bx2 + 24) = G_EDIT_FIELD_VAL;
	*(int far *)MK_FP(es2, bx2 + 26) = dx3;
	return;
}
