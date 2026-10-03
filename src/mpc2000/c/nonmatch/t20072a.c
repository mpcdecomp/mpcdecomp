/* differs: 150 size 204, image 148; +1 image `enter 4, 0` CL `enter 6, 0`; 172 size 204, image 148; +1 image `enter 4, 0` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char BUF_XFER[1];
extern int G_ERRNO;
extern long __far __pascal flash_write_words(int, int, unsigned char far *, int);
extern int __far int2F_call_fn6(unsigned char far *, int);

long __far __pascal far_memop_caller(int arg_6, long arg_4, int arg_2, unsigned long arg_0)
{
	long loc_4;
	int loc_2;
	int ax;
	int ax2;
	int flags;
	int si;
	long t1;

	*(int *)((char *)&loc_4 + 0) = *(int *)((char *)&arg_4 + 0);
	loc_2 = arg_6;
	if ((arg_2 | *(int *)((char *)&arg_0 + 0)) == 0) {
		goto L1;
	}
L2:
	flags = arg_2;
	if (CC("<", flags)) {
		goto L3;
	}
	if (CC(">", flags)) {
		goto L4;
	}
	if ((unsigned int)*(int *)((char *)&arg_0 + 0) <= 0x400) {
		goto L3;
	}
L4:
	si = 0x400;
	goto L5;
L3:
	si = *(int *)((char *)&arg_0 + 0);
L5:
	ax = si * 2;
	if (int2F_call_fn6((unsigned char far *)BUF_XFER, ax) != ax) {
		goto L6;
	}
	t1 = flash_write_words(loc_2, *(int *)((char *)&loc_4 + 0), (unsigned char far *)BUF_XFER, si);
	*(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + si;
	loc_2 = (int)(loc_4 + (long)(int)si >> 16);
	*(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - si;
	arg_2 = (int)(arg_0 - (long)(int)si >> 16);
	if ((arg_2 | *(int *)((char *)&arg_0 + 0)) != 0) {
		goto L2;
	}
	goto L1;
L6:
	G_ERRNO = 2;
	return -1L;
L1:
	ax2 = *(int *)((char *)&loc_4 + 0);
	return (long)MK_FP((int)(((long)loc_2 << 16 | (unsigned)ax2) - arg_4 >> 16), ax2 - *(int *)((char *)&arg_4 + 0));
}
