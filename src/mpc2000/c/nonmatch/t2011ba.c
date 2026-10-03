/* differs: 150 size 168, image 92; +0 image `push bp` CL `enter 4, 0`; 172 size 168, image 92; +0 image `push bp` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char BUF_XFER[1];
extern long __far __pascal flash_write_words();

int __far __pascal smem_fill(int arg_8, int arg_6, int arg_4, int arg_2, unsigned long arg_0)
{
	int ax;
	unsigned int cx;
	int dx;
	int flags;
	unsigned int si;

	__stos2((unsigned char far *)BUF_XFER, (*(char *)((char *)&arg_4 + 0) << 8 | (unsigned char)*(char *)((char *)&arg_4 + 0)), 0x800);
L1:
	flags = arg_2;
	if (CC("<", flags)) {
		goto L2;
	}
	if (CC(">", flags)) {
		goto L3;
	}
	if ((unsigned int)*(int *)((char *)&arg_0 + 0) <= 0x400) {
		goto L2;
	}
L3:
	si = 0x400;
	goto L4;
L2:
	si = *(int *)((char *)&arg_0 + 0);
L4:
	*(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - si;
	arg_2 = (int)(arg_0 - (unsigned long)(unsigned int)si >> 16);
	cx = *(int *)((char *)&arg_0 + 0) + arg_6;
	dx = (int)(flash_write_words(arg_2 + arg_8 + (cx < (unsigned int)*(int *)((char *)&arg_0 + 0)), cx, (unsigned char far *)BUF_XFER, si) >> 16);
	ax = arg_2 | *(int *)((char *)&arg_0 + 0);
	if (ax != 0) {
		goto L1;
	}
	return ax;
}
