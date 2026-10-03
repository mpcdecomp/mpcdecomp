/* differs: 150 size 206, image 84; +1 image `enter 8, 0` CL `enter 0x22, 0`; 172 size 206, image 84; +1 image `enter 8, 0` CL `enter 0x22, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int G_EDIT_FIELD_VAL;
extern int G_EDIT_FIELD_VAL_HI;
extern long SND_CURRENT;

void __far sample_str_scan_5(void)
{
	int loc_4;
	int loc_2;
	unsigned int ax;
	unsigned int ax2;
	unsigned int ax3;
	int bx;
	int bx2;
	int dx;
	int dx2;
	int es;
	int es2;

	bx = (int)SND_CURRENT;
	es = (int)(SND_CURRENT >> 16);
	ax = *(int far *)MK_FP(es, bx + 32) + G_EDIT_FIELD_VAL;
	dx = *(int far *)MK_FP(es, bx + 34) + G_EDIT_FIELD_VAL_HI + (ax < (unsigned int)*(int far *)MK_FP(es, bx + 32));
	loc_4 = ax;
	loc_2 = dx;
	ax2 = *(int far *)MK_FP(es, bx + 20) - *(int far *)MK_FP(es, bx + 24);
	ax3 = ax2 + loc_4;
	dx2 = (int)(*(long far *)MK_FP(es, bx + 20) - *(long far *)MK_FP(es, bx + 24) >> 16) + loc_2 + (ax3 < ax2);
	*(int far *)MK_FP(es, bx + 20) = ax3;
	*(int far *)MK_FP(es, bx + 22) = dx2;
	bx2 = (int)SND_CURRENT;
	es2 = (int)(SND_CURRENT >> 16);
	*(int far *)MK_FP(es2, bx2 + 24) = loc_4;
	*(int far *)MK_FP(es2, bx2 + 26) = loc_2;
	return;
}
