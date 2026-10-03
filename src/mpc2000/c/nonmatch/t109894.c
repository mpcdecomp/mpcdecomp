/* differs: 150 size 230, image 200; +1 image `enter 2, 0` CL `enter 8, 0`; 172 size 230, image 200; +1 image `enter 2, 0` CL `enter 8, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int __far _longjmp(void far *, int);
extern long __near __pascal int2F_fn5_caller(int, int);
extern void __near __pascal status_poll_delay(int, int, int);

void __near __pascal envelope_process_1(int arg_6, int arg_4, int arg_2, unsigned long arg_0)
{
	int loc_2;
	unsigned int di;
	int t1;
	long t2;
	long t3;
	long t4;
	long t5;
	long t6;

	__stos2(((long)arg_6 << 16 | (unsigned)arg_4), 0, 18);
	loc_2 = 18;
	di = loc_2;
	if (arg_2 != 0) {
		goto L1;
	}
	if ((unsigned int)*(int *)((char *)&arg_0 + 0) >= 18) {
		goto L1;
	}
	di = *(int *)((char *)&arg_0 + 0);
L1:
	status_poll_delay(arg_6, arg_4, di);
	if (*(int far *)MK_FP(arg_6, arg_4) != 1) {
		goto L2;
	}
	if (*(int far *)MK_FP(arg_6, arg_4 + 2) == 0) {
		goto L2;
	}
	if ((unsigned int)*(int far *)MK_FP(arg_6, arg_4 + 2) > 2) {
		goto L2;
	}
	if ((unsigned int)*(int far *)MK_FP(arg_6, arg_4 + 14) > 16) {
		goto L2;
	}
	if ((unsigned int)*(int far *)MK_FP(arg_6, arg_4 + 14) >= 9) {
		goto L3;
	}
L2:
	t2 = _longjmp(MK_FP(SEG_DATA, -0x72de), 18);
L3:
	t3 = (unsigned long)(unsigned int)((unsigned int)*(int far *)MK_FP(arg_6, arg_4 + 14) >> 3) * (unsigned long)(unsigned int)*(int far *)MK_FP(arg_6, arg_4 + 2);
	t4 = t3 * *(long far *)MK_FP(arg_6, arg_4 + 4);
	if ((int)t4 != *(int far *)MK_FP(arg_6, arg_4 + 8)) {
		goto L4;
	}
	if ((int)(t4 >> 16) != *(int far *)MK_FP(arg_6, arg_4 + 10)) {
		goto L4;
	}
	if (((unsigned int)*(int far *)MK_FP(arg_6, arg_4 + 14) >> 3) * *(int far *)MK_FP(arg_6, arg_4 + 2) == *(int far *)MK_FP(arg_6, arg_4 + 12)) {
		goto L5;
	}
L4:
	t5 = _longjmp(MK_FP(SEG_DATA, -0x72de), 4);
L5:
	t6 = int2F_fn5_caller((int)(arg_0 - (unsigned long)(unsigned int)di >> 16), *(int *)((char *)&arg_0 + 0) - di);
	return;
}
