/* differs: 150 size 198, image 216; +0 image `push ds` CL `enter 8, 0`; 172 size 198, image 216; +0 image `push ds` CL `enter 8, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char far *WIN_FIELD_VAR;
extern long WIN_FIELD_CHANGE_FN;
extern long __far far_078E4(void);

void __far __fastcall __loadds X_036F0(void)
{
	int ax;
	int bx;
	int bx2;
	int bx3;
	int dx;
	int es;
	int es2;
	int es3;
	int es4;
	long t1;
	long t2;
	long t3;

	t1 = far_078E4();
	if (((int)(t1 >> 16) | (int)t1) == 0) {
		goto L1;
	}
	if ((*(int far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0) + 2) | *(int far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0))) != 0) {
		goto L2;
	}
	t2 = far_078E4();
	ax = (int)t2;
	dx = (int)(t2 >> 16);
	goto L3;
L2:
	bx = (int)*(long far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0));
	es = (int)(*(long far *)MK_FP((int)(*(long *)((char *)&WIN_FIELD_VAR + 0) >> 16), bx) >> 16);
	es2 = (int)(*(long far *)MK_FP(es, (int)*(long far *)MK_FP(es, bx + 40) + 40) >> 16);
	if ((*(int far *)MK_FP(es2, (int)*(long far *)MK_FP(es, bx + 40) + 42) | *(int far *)MK_FP(es2, (int)*(long far *)MK_FP(es, bx + 40) + 40)) == 0) {
		goto L1;
	}
	bx2 = (int)*(long far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0));
	es3 = (int)(*(long far *)MK_FP((int)(*(long *)((char *)&WIN_FIELD_VAR + 0) >> 16), bx2) >> 16);
	ax = *(int far *)MK_FP(es3, bx2 + 40);
	dx = *(int far *)MK_FP(es3, bx2 + 42);
L3:
	bx3 = (int)*(long *)((char *)&WIN_FIELD_VAR + 0);
	es4 = (int)(*(long *)((char *)&WIN_FIELD_VAR + 0) >> 16);
	*(int far *)MK_FP(es4, bx3) = ax;
	*(int far *)MK_FP(es4, bx3 + 2) = dx;
	t3 = (*(long (far *)())WIN_FIELD_CHANGE_FN)();
L1:
	return;
}
