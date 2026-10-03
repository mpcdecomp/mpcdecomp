/* differs: 150 size 118, image 124; +4 image `mov ax, word ptr [0x1504]` CL `push si`; 172 size 118, image 124; +4 image `mov ax, word ptr [0x1582]` CL `push si` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_TBL_155A {
    int f_0;
};
extern struct g_TBL_155A TBL_155A;
extern char TBL_155B[1];
extern int W_1582;
extern int W_1584;
extern long __far _div(int, int);
extern long __far __pascal cmd_dispatch_1E(int, int, int far *);

void __far __pascal cmd_dispatch_caller2(int arg_4, int arg_2, int arg_0)
{
	int loc_8;
	int loc_6;
	int loc_4;
	int loc_3;
	int loc_2;
	int bx;
	int dx;
	char far *t1;
	char far *t2;

	dx = W_1584;
	loc_4 = W_1582;
	loc_2 = dx;
	t1 = _div(*(char *)((char *)&arg_0 + 0), 20);
	loc_8 = (int)FP_OFF(t1);
	loc_6 = (int)FP_SEG(t1);
	if ((int)FP_OFF(t1) == 0) {
		goto L1;
	}
	if ((int)FP_OFF(t1) == 1) {
		goto L2;
	}
	if ((int)FP_OFF(t1) == 2) {
		goto L3;
	}
	if ((int)FP_OFF(t1) == 3) {
		goto L4;
	}
	goto L5;
L1:
	loc_3 = *(int *)((char *)&TBL_155A + 0 + (int)FP_SEG(t1) * 2);
	goto L5;
L3:
	bx = (int)FP_SEG(t1) * 2;
	*(char *)((char *)&loc_4 + 0) = *(char *)((char *)&TBL_155A + 0 + bx);
	*(char *)((char *)&loc_2 + 0) = TBL_155B[bx];
	goto L5;
L4:
	*(char *)((char *)&loc_2 + 0) = (char)107;
L2:
	loc_4 = *(int *)((char *)&TBL_155A + 0 + (int)FP_SEG(t1) * 2);
L5:
	t2 = cmd_dispatch_1E(arg_4, arg_2, (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4));
	return;
}
