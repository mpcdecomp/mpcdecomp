/* differs: 150 size 212, image 100; +0 image `push ds` CL `enter 0xa, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char B_8CAB;
extern char far *WIN_FIELD_VAR;
extern long WIN_FIELD_CHANGE_FN;
extern long __far far_078E4(void);

void __far __fastcall __loadds L_036C0(void)
{
	int bx;
	int bx2;
	int bx3;
	int bx4;
	int dx;
	int es;
	int es2;
	int es3;
	int es4;
	int es5;
	char far *t1;
	char far *t2;

	t1 = far_078E4();
	if (((int)FP_SEG(t1) | (int)FP_OFF(t1)) == 0) {
		goto L1;
	}
	if ((*(int far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0) + 2) | *(int far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0))) == 0) {
		goto L1;
	}
	bx = (int)*(long far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0));
	es = (int)(*(long far *)MK_FP((int)(*(long *)((char *)&WIN_FIELD_VAR + 0) >> 16), bx) >> 16);
	es2 = (int)(*(long far *)MK_FP(es, (int)*(long far *)MK_FP(es, bx + 44) + 44) >> 16);
	if ((*(int far *)MK_FP(es2, (int)*(long far *)MK_FP(es, bx + 44) + 46) | *(int far *)MK_FP(es2, (int)*(long far *)MK_FP(es, bx + 44) + 44)) == 0) {
		goto L2;
	}
	bx2 = (int)*(long far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0));
	es3 = (int)(*(long far *)MK_FP((int)(*(long *)((char *)&WIN_FIELD_VAR + 0) >> 16), bx2) >> 16);
	dx = *(int far *)MK_FP(es3, bx2 + 46);
	bx3 = (int)*(long *)((char *)&WIN_FIELD_VAR + 0);
	es4 = (int)(*(long *)((char *)&WIN_FIELD_VAR + 0) >> 16);
	*(int far *)MK_FP(es4, bx3) = *(int far *)MK_FP(es3, bx2 + 44);
	*(int far *)MK_FP(es4, bx3 + 2) = dx;
	goto L3;
L2:
	if (B_8CAB == 0) {
		goto L1;
	}
	bx4 = (int)*(long *)((char *)&WIN_FIELD_VAR + 0);
	es5 = (int)(*(long *)((char *)&WIN_FIELD_VAR + 0) >> 16);
	*(int far *)MK_FP(es5, bx4 + 2) = 0;
	*(int far *)MK_FP(es5, bx4) = 0;
L3:
	t2 = (*(long (far *)())WIN_FIELD_CHANGE_FN)();
L1:
	return;
}
