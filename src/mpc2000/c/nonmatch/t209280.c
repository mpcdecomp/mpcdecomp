/* differs: 150 size 372, image 252; +1 image `enter 0xc, 0` CL `enter 0x10, 0`; 172 size 372, image 252; +1 image `enter 0xc, 0` CL `enter 0x10, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int G_EDIT_FIELD_VAL;
extern int G_EDIT_FIELD_VAL_HI;
extern char LOOP_LEN_FIX;
extern char far *SND_CURRENT;
extern char TRIM_LEN_FIX;
extern int __far __pascal sample_check_active(void far *);
extern long __far __pascal ui_field_edit(int far *, int, int, int, int, int, int, int, int, int, int);

long __far __pascal ui_edit_position(int arg_6, int arg_4, int arg_2, int arg_0)
{
	int loc_c;
	int loc_a;
	int loc_8;
	int loc_6;
	int loc_4;
	int loc_2;
	unsigned int ax;
	int bx;
	int bx2;
	int dx;
	int dx2;
	int dx3;
	int dx4;
	int dx5;
	int dx6;
	int es;
	int es2;
	int flags;

	bx = (int)*(long *)((char *)&SND_CURRENT + 0);
	es = (int)(*(long *)((char *)&SND_CURRENT + 0) >> 16);
	dx = (int)(*(long far *)MK_FP(es, bx + 24) - *(long far *)MK_FP(es, bx + 32) >> 16);
	G_EDIT_FIELD_VAL = *(int far *)MK_FP(es, bx + 24) - *(int far *)MK_FP(es, bx + 32);
	G_EDIT_FIELD_VAL_HI = dx;
	if (sample_check_active(MK_FP(es, bx)) == 0) {
		goto L1;
	}
	dx2 = G_EDIT_FIELD_VAL_HI;
	loc_4 = G_EDIT_FIELD_VAL;
	loc_2 = dx2;
	loc_c = loc_4;
	loc_a = loc_2;
	loc_6 = 0;
	loc_8 = 0;
	goto L2;
L1:
	loc_a = 0;
	loc_c = 0;
	if (LOOP_LEN_FIX == 0) {
		goto L3;
	}
	bx2 = (int)*(long *)((char *)&SND_CURRENT + 0);
	es2 = (int)(*(long *)((char *)&SND_CURRENT + 0) >> 16);
	dx3 = (int)(*(long far *)MK_FP(es2, bx2 + 28) - *(long far *)MK_FP(es2, bx2 + 32) >> 16);
	loc_4 = *(int far *)MK_FP(es2, bx2 + 28) - *(int far *)MK_FP(es2, bx2 + 32);
	loc_2 = dx3;
	if (TRIM_LEN_FIX != 0) {
		goto L4;
	}
	loc_8 = -0x6e1c;
	loc_6 = 0x0b50 /* TEXT2_SEG */;
	goto L2;
L4:
	ax = G_EDIT_FIELD_VAL;
	dx4 = G_EDIT_FIELD_VAL_HI;
	flags = *(int far *)MK_FP(es2, bx2 + 22) - dx4;
	if (CC(">", flags)) {
		goto L5;
	}
	if (CC("<", flags)) {
		goto L6;
	}
	if ((unsigned int)*(int far *)MK_FP(es2, bx2 + 20) >= ax) {
		goto L5;
	}
L6:
	dx5 = (int)(((long)dx4 << 16 | (unsigned)ax) - *(long far *)MK_FP(es2, bx2 + 20) >> 16);
	loc_c = ax - *(int far *)MK_FP(es2, bx2 + 20);
	loc_a = dx5;
L5:
	loc_8 = -0x6dd4;
	loc_6 = 0x0b50 /* TEXT2_SEG */;
	goto L2;
L3:
	dx6 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 26);
	loc_4 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 24);
	loc_2 = dx6;
	loc_8 = -0x6e7c;
	loc_6 = 0x0b50 /* TEXT2_SEG */;
L2:
	return ui_field_edit((int far *)&G_EDIT_FIELD_VAL, arg_6, arg_4, loc_a, loc_c, loc_2, loc_4, loc_6, loc_8, arg_2, arg_0);
}
