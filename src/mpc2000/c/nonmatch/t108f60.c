/* differs: 150 size 128, image 108; +1 image `enter 2, 0` CL `enter 4, 0`; 172 size 128, image 108; +1 image `enter 2, 0` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int G_ERRNO;
extern int __far int2F_call_fn6(char far *, int);
extern long __near __pascal sample_block_copy(int);
extern long __far __pascal sample_create(int);

long __near midi_active_sense(void)
{
	char loc_2;
	unsigned char loc_1;
	unsigned ax;

	if (int2F_call_fn6((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2) != 2) {
		goto L1;
	}
	if (loc_2 != 1) {
		goto L1;
	}
	ax = loc_1;
	if (ax < 0) {
		goto L2;
	}
	if (CC("o", ax)) {
		goto L2;
	}
	if (ax - 1 <= 0) {
		goto L3;
	}
	if (ax == 2) {
		goto L4;
	}
	if (ax == 3) {
		goto L5;
	}
	if (ax == 4) {
		goto L4;
	}
L2:
	G_ERRNO = 6;
	goto L6;
L3:
	return sample_create(loc_1);
L4:
	return sample_block_copy(loc_1);
L5:
	G_ERRNO = 7;
	goto L6;
L1:
	G_ERRNO = 4;
L6:
	return 0L;
}
