/* differs: 150 size 374, image 312; +1 image `enter 0x10, 0` CL `enter 0x14, 0`; 172 size 374, image 312; +1 image `enter 0x10, 0` CL `enter 0x14, 0` */
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
extern long __far L_08E48();
extern int __far __pascal sample_check_active(int, int);
extern long __far __pascal ui_field_edit(int far *, int, int, int, int, int, int, int, int, int, int);

long __far __pascal sample_active_check_2(int arg_6, int arg_4, int arg_2, int arg_0)
{
	int loc_10;
	int loc_e;
	int loc_c;
	int loc_a;
	int loc_8;
	char loc_6[6];
	unsigned int ax;
	int bx;
	int dx;
	int dx2;
	int dx3;
	int dx4;
	int dx5;
	int es;
	int flags;

	if (sample_check_active(*(int *)((char *)&SND_CURRENT + 2), *(int *)((char *)&SND_CURRENT + 0)) == 0) {
		goto L1;
	}
	goto L2;
L1:
	bx = (int)*(long *)((char *)&SND_CURRENT + 0);
	es = (int)(*(long *)((char *)&SND_CURRENT + 0) >> 16);
	dx2 = *(int far *)MK_FP(es, bx + 30);
	loc_8 = *(int far *)MK_FP(es, bx + 28);
	*(int *)((char *)&loc_6 + 0) = dx2;
	if (TRIM_LEN_FIX != 0) {
		goto L3;
	}
	if (LOOP_LEN_FIX != 0) {
		goto L4;
	}
	loc_a = 0;
	loc_c = 0;
	loc_10 = -0x763c;
	loc_e = 0x0b50 /* TEXT2_SEG */;
	goto L5;
L4:
	dx3 = *(int far *)MK_FP(es, bx + 34);
	loc_c = *(int far *)MK_FP(es, bx + 32);
	loc_a = dx3;
	loc_10 = (int)(unsigned)L_08E48;
	loc_e = 0x0b50 /* TEXT2_SEG */;
	goto L5;
L3:
	ax = *(int far *)MK_FP(es, bx + 24) - *(int far *)MK_FP(es, bx + 20);
	dx4 = (int)(*(long far *)MK_FP(es, bx + 24) - *(long far *)MK_FP(es, bx + 20) >> 16);
	if (LOOP_LEN_FIX != 0) {
		goto L6;
	}
	loc_c = ax;
	loc_a = dx4;
	loc_10 = -0x756a;
	loc_e = 0x0b50 /* TEXT2_SEG */;
	goto L5;
L6:
	flags = *(int far *)MK_FP(es, bx + 34) - dx4;
	if (CC(">", flags)) {
		goto L7;
	}
	if (CC("<", flags)) {
		goto L8;
	}
	if ((unsigned int)*(int far *)MK_FP(es, bx + 32) < ax) {
		goto L8;
	}
L7:
	ax = *(int far *)MK_FP(es, bx + 32);
	dx4 = *(int far *)MK_FP(es, bx + 34);
L8:
	loc_c = ax;
	loc_a = dx4;
	loc_10 = -0x74bc;
	loc_e = 0x0b50 /* TEXT2_SEG */;
	goto L5;
L2:
	dx = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 26);
	loc_8 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 24);
	*(int *)((char *)&loc_6 + 0) = dx;
	loc_c = loc_8;
	loc_a = *(int *)((char *)&loc_6 + 0);
	loc_e = 0;
	loc_10 = 0;
L5:
	dx5 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 26);
	G_EDIT_FIELD_VAL = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 24);
	G_EDIT_FIELD_VAL_HI = dx5;
	return ui_field_edit((int far *)&G_EDIT_FIELD_VAL, arg_6, arg_4, loc_a, loc_c, *(int *)((char *)&loc_6 + 0), loc_8, loc_e, loc_10, arg_2, arg_0);
}
