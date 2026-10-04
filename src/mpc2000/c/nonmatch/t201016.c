/* differs: 150 size 190, image 100; +0 image `push bp` CL `enter 0xa, 0`; 172 size 190, image 100; +0 image `push bp` CL `enter 0xa, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char BUF_XFER[1];
extern long __far __pascal flash_write_words(int, int, unsigned char far *, int);
extern void __far __pascal smem_read_words(int, int, unsigned char far *, int);

long __far __pascal smem_copy_buffered(int arg_10, long arg_8, int arg_6, long arg_4, int arg_2, unsigned long arg_0)
{
	int ax;
	int dx;
	int flags;
	unsigned int si;
	int t1;
	long t2;

	si = 0x400;
	ax = arg_2 | *(int *)((char *)&arg_0 + 0);
	if (ax == 0) {
		goto L1;
	}
L2:
	flags = arg_2;
	if (CC(">u", flags)) {
		goto L3;
	}
	if (CC("<u", flags)) {
		goto L4;
	}
	if ((unsigned int)*(int *)((char *)&arg_0 + 0) >= si) {
		goto L3;
	}
L4:
	si = *(int *)((char *)&arg_0 + 0);
L3:
	smem_read_words(arg_10, *(int *)((char *)&arg_8 + 0), (unsigned char far *)BUF_XFER, si);
	t2 = flash_write_words(arg_6, *(int *)((char *)&arg_4 + 0), (unsigned char far *)BUF_XFER, si);
	dx = 0;
	*(int *)((char *)&arg_8 + 0) = *(int *)((char *)&arg_8 + 0) + si;
	arg_10 = (int)(arg_8 + ((long)dx << 16 | (unsigned)si) >> 16);
	*(int *)((char *)&arg_4 + 0) = *(int *)((char *)&arg_4 + 0) + si;
	arg_6 = (int)(arg_4 + ((long)dx << 16 | (unsigned)si) >> 16);
	*(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - si;
	arg_2 = (int)(arg_0 - ((long)dx << 16 | (unsigned)si) >> 16);
	ax = arg_2 | *(int *)((char *)&arg_0 + 0);
	if (ax != 0) {
		goto L2;
	}
L1:
	return ((long)dx << 16 | (unsigned)ax);
}
