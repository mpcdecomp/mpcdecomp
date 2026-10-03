/* differs: 150 size 102, image 68; +1 image `enter 4, 0` CL `enter 0xa, 0`; 172 size 102, image 68; +1 image `enter 4, 0` CL `enter 0xa, 0` */
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

void __far sample_str_scan_6(void)
{
	int loc_2;
	int ax;
	int bx;
	int dx;
	int es;
	long t1;

	dx = G_EDIT_FIELD_VAL_HI;
	bx = (int)SND_CURRENT.f_0;
	es = (int)(SND_CURRENT.f_0 >> 16);
	*(int far *)MK_FP(es, bx + 32) = G_EDIT_FIELD_VAL;
	*(int far *)MK_FP(es, bx + 34) = dx;
	ax = *(int *)((char *)&SND_CURRENT + 0);
	loc_2 = *(int *)((char *)&SND_CURRENT + 2);
	t1 = addr_calc_segment(G_EDIT_FIELD_VAL, G_EDIT_FIELD_VAL_HI, 0);
	*(int far *)MK_FP(loc_2, ax + 50) = (int)t1;
	*(int far *)MK_FP(loc_2, ax + 52) = (int)(t1 >> 16);
	return;
}
