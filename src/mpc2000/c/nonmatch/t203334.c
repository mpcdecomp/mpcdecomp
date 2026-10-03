/* differs: 150 size 154, image 120; +1 image `enter 8, 0` CL `enter 0x12, 0`; 172 size 154, image 4; +1 image `enter 8, 0` CL `enter 0x12, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PTR_SECONDARY {
    int f_0;
    int f_2;
};
extern unsigned char BUF_NAME_EDIT[1];
extern char G_FLAG_8CA8;
extern long NAME_EDIT_CHANGE_FN;
extern struct g_PTR_SECONDARY WIN_FIELD_VAR;
extern long __far __fastcall _fstrncpy(int, long, long, int);

void __far __fastcall __loadds name_edit_commit(void)
{
	char loc_6[6];
	int ax;
	unsigned int bx;
	int cx;
	int es;
	int p16;
	int p18;
	int p20;
	int p22;
	int p24;
	char __near *si;
	long t1;
	long t2;

	si = (char __near *)-0x7567;
	bx = (unsigned int)(unsigned)si;
	*(int *)((char *)&loc_6 + 0) = SEG_DATA;
	if (*si != 32) {
		goto L1;
	}
	es = *(int *)((char *)&loc_6 + 0);
L2:
	bx = bx - 1;
	if (*(char far *)MK_FP(es, bx) == 32) {
		goto L2;
	}
L1:
	if (bx >= (unsigned int)(unsigned)BUF_NAME_EDIT) {
		goto L3;
	}
	p16 = 16;
	p18 = WIN_FIELD_VAR.f_2;
	p20 = WIN_FIELD_VAR.f_0;
	p22 = SEG_DATA;
	p24 = (int)(unsigned)BUF_NAME_EDIT;
	goto L4;
L3:
	if (*(char far *)MK_FP(*(int *)((char *)&loc_6 + 0), bx) != 32) {
		goto L5;
	}
	*(char far *)MK_FP(*(int *)((char *)&loc_6 + 0), bx) = (char)95;
L5:
	ax = *(int *)((char *)&loc_6 + 0);
	cx = bx;
	bx = bx - 1;
	if (cx != (unsigned int)(unsigned)BUF_NAME_EDIT) {
		goto L3;
	}
	if (ax != SEG_DATA) {
		goto L3;
	}
	p16 = 16;
	p18 = SEG_DATA;
	p20 = cx;
	p22 = WIN_FIELD_VAR.f_2;
	p24 = WIN_FIELD_VAR.f_0;
L4:
	t1 = _fstrncpy(ax, ((long)p22 << 16 | (unsigned)p24), ((long)p18 << 16 | (unsigned)p20), p16);
	G_FLAG_8CA8 = (char)0;
	t2 = (*(long (far *)())NAME_EDIT_CHANGE_FN)();
	return;
}
