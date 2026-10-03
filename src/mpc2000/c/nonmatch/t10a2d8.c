/* differs: 150 size 172, image 100; +4 image `push si` CL `push di`; 172 size 172, image 100; +4 image `push si` CL `push di` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern void __near __pascal status_poll_delay2(int, int, int);
extern long __near __pascal status_smem_read(int, int);

void __near __pascal status_poll_handler2(int arg_2, int arg_0)
{
	int ax;
	unsigned int ax2;
	int dx;
	int flags;
	int t1;
	long t2;

	status_poll_delay2(arg_2, arg_0, 59);
	ax = ((char)(UNDEF >> 8) << 8 | (unsigned char)*(char far *)MK_FP(arg_2, arg_0 + 58)) & 96;
	if (ax == 32) {
		goto L1;
	}
	if (ax == 64) {
		goto L2;
	}
	ax2 = *(int far *)MK_FP(arg_2, arg_0 + 20);
	dx = *(int far *)MK_FP(arg_2, arg_0 + 22);
	flags = dx - *(int far *)MK_FP(arg_2, arg_0 + 26);
	if (CC("<u", flags)) {
		goto L3;
	}
	if (CC(">u", flags)) {
		goto L2;
	}
	if (ax2 <= (unsigned int)*(int far *)MK_FP(arg_2, arg_0 + 24)) {
		goto L3;
	}
	goto L2;
L1:
	ax2 = *(int far *)MK_FP(arg_2, arg_0 + 20);
	dx = *(int far *)MK_FP(arg_2, arg_0 + 22);
	goto L3;
L2:
	ax2 = *(int far *)MK_FP(arg_2, arg_0 + 24);
	dx = *(int far *)MK_FP(arg_2, arg_0 + 26);
L3:
	t2 = status_smem_read((int)(((long)dx << 16 | (unsigned)ax2) - 59L >> 16), ax2 - 59);
	return;
}
