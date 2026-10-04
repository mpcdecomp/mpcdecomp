/* differs: 150 size 258, image 198; +1 image `enter 0xc, 0` CL `enter 0x16, 0`; 172 size 258, image 198; +1 image `enter 0xc, 0` CL `enter 0x16, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int G_EDIT_FIELD_VAL;
extern int G_EDIT_FIELD_VAL_HI;
extern char LOOP_LEN_FIX;
extern unsigned char SAMPLE_STR_SCAN_6[1];
extern char far *SND_CURRENT;
extern char TRIM_LEN_FIX;
extern int __far __pascal sample_check_active(void far *);
extern long __far __pascal ui_field_edit(int far *, int, int, int, int, int, int, int, int, int, int);

long __far __pascal sample_active_check_3(int arg_6, int arg_4, int arg_2, int arg_0)
{
	int loc_c;
	int loc_a;
	int loc_8;
	int loc_6;
	char loc_4[4];
	int ax;
	unsigned int ax2;
	unsigned int ax3;
	int bx;
	int dx;
	int dx2;
	int es;
	int t1;

	bx = (int)*(long *)((char *)&SND_CURRENT + 0);
	es = (int)(*(long *)((char *)&SND_CURRENT + 0) >> 16);
	dx = *(int far *)MK_FP(es, bx + 34);
	G_EDIT_FIELD_VAL = *(int far *)MK_FP(es, bx + 32);
	G_EDIT_FIELD_VAL_HI = dx;
	t1 = sample_check_active(MK_FP(es, bx));
	if (t1 != 0) {
		goto L1;
	}
	if (TRIM_LEN_FIX != 0) {
		goto L2;
	}
	loc_6 = t1;
	loc_8 = t1;
	ax = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 28);
	ax2 = ax - *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 24);
	ax3 = ax2 + *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 32);
	dx2 = (int)(((long)*(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 30) << 16 | (unsigned)ax) - *(long far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 24) >> 16) + *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 34) + (ax3 < ax2);
	*(int *)((char *)&loc_4 + 0) = ax3;
	loc_c = -0x6c84;
	loc_a = 0x0b50 /* TEXT2_SEG */;
	goto L3;
L2:
	if (LOOP_LEN_FIX != 0) {
		goto L1;
	}
	loc_6 = 0;
	loc_8 = 0;
	dx2 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 26);
	*(int *)((char *)&loc_4 + 0) = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 24);
	loc_c = (int)(unsigned)SAMPLE_STR_SCAN_6;
	loc_a = 0x0b50 /* TEXT2_SEG */;
	goto L3;
L1:
	dx2 = G_EDIT_FIELD_VAL_HI;
	*(int *)((char *)&loc_4 + 0) = G_EDIT_FIELD_VAL;
	loc_8 = *(int *)((char *)&loc_4 + 0);
	loc_6 = dx2;
	loc_a = 0;
	loc_c = 0;
L3:
	return ui_field_edit((int far *)&G_EDIT_FIELD_VAL, arg_6, arg_4, loc_6, loc_8, dx2, *(int *)((char *)&loc_4 + 0), loc_a, loc_c, arg_2, arg_0);
}
