/* differs: 150 size 502, image 320; +1 image `enter 0x10, 0` CL `enter 6, 0`; 172 size 502, image 320; +1 image `enter 0x10, 0` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char BUF_XFER[1];
extern long __far __pascal flash_write_words(int, int, unsigned char far *, int);
extern void __far __pascal smem_read_words(int, int, unsigned char far *, int);

long __far __pascal input_handler(int arg_10, long arg_8, int arg_6, unsigned long arg_4, int arg_2, unsigned long arg_0)
{
	int loc_10;
	int loc_e;
	int loc_c;
	int loc_a;
	int loc_8;
	int loc_6;
	int loc_4;
	int loc_2;
	unsigned int ax;
	unsigned int ax2;
	int ax3;
	int ax4;
	int ax5;
	int ax6;
	int ax7;
	int ax8;
	int dx;
	int dx2;
	int dx3;
	int flags;
	int flags2;
	int flags3;
	int flags4;
	unsigned int si;
	unsigned int si2;
	int t1;
	long t2;
	int t3;
	long t4;

	ax = arg_2 | *(int *)((char *)&arg_0 + 0);
	if (ax != 0) {
		goto L1;
	}
	goto L2;
L1:
	ax = *(int *)((char *)&arg_8 + 0);
	dx = arg_10;
	flags = arg_6 - dx;
	if (CC("<=", flags)) {
		goto L3;
	}
	goto L4;
L3:
	if (CC("<", flags)) {
		goto L5;
	}
	if ((unsigned int)*(int *)((char *)&arg_4 + 0) >= ax) {
		goto L4;
	}
L5:
	si2 = 0x400;
	ax = arg_2 | *(int *)((char *)&arg_0 + 0);
	if (ax != 0) {
		goto L6;
	}
	goto L2;
L6:
	flags4 = arg_2;
	if (CC(">u", flags4)) {
		goto L7;
	}
	if (CC("<u", flags4)) {
		goto L8;
	}
	if ((unsigned int)*(int *)((char *)&arg_0 + 0) >= si2) {
		goto L7;
	}
L8:
	si2 = *(int *)((char *)&arg_0 + 0);
L7:
	smem_read_words(arg_10, *(int *)((char *)&arg_8 + 0), (unsigned char far *)BUF_XFER, si2);
	*(int *)((char *)&arg_8 + 0) = *(int *)((char *)&arg_8 + 0) + si2;
	arg_10 = (int)(arg_8 + (unsigned long)(unsigned int)si2 >> 16);
	loc_4 = si2;
	loc_2 = 0;
	loc_8 = si2;
	loc_6 = 0;
	t4 = flash_write_words(arg_6, *(int *)((char *)&arg_4 + 0), (unsigned char far *)BUF_XFER, si2);
	ax6 = loc_8;
	*(int *)((char *)&arg_4 + 0) = *(int *)((char *)&arg_4 + 0) + ax6;
	arg_6 = (int)(arg_4 + ((long)loc_6 << 16 | (unsigned)ax6) >> 16);
	ax7 = loc_4;
	dx3 = loc_2;
	*(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - ax7;
	arg_2 = (int)(arg_0 - ((long)dx3 << 16 | (unsigned)ax7) >> 16);
	ax8 = arg_2 | *(int *)((char *)&arg_0 + 0);
	if (ax8 != 0) {
		goto L6;
	}
	return ((long)dx3 << 16 | (unsigned)ax8);
L4:
	flags2 = arg_6 - dx;
	if (CC(">=", flags2)) {
		goto L9;
	}
	goto L2;
L9:
	if (CC(">", flags2)) {
		goto L10;
	}
	if ((unsigned int)*(int *)((char *)&arg_4 + 0) > ax) {
		goto L10;
	}
	goto L2;
L10:
	ax2 = *(int *)((char *)&arg_0 + 0);
	dx2 = arg_2;
	if (dx2 != 0) {
		goto L11;
	}
	if (ax2 <= 0x400) {
		goto L12;
	}
L11:
	ax2 = 0x400;
L12:
	si = ax2;
	ax3 = *(int *)((char *)&arg_0 + 0);
	*(int *)((char *)&arg_8 + 0) = *(int *)((char *)&arg_8 + 0) + ax3;
	arg_10 = (int)(arg_8 + ((long)dx2 << 16 | (unsigned)ax3) >> 16);
	*(int *)((char *)&arg_4 + 0) = *(int *)((char *)&arg_4 + 0) + ax3;
	arg_6 = (int)(arg_4 + ((long)dx2 << 16 | (unsigned)ax3) >> 16);
L13:
	flags3 = arg_2;
	if (CC(">u", flags3)) {
		goto L14;
	}
	if (CC("<u", flags3)) {
		goto L15;
	}
	if ((unsigned int)*(int *)((char *)&arg_0 + 0) >= si) {
		goto L14;
	}
L15:
	si = *(int *)((char *)&arg_0 + 0);
L14:
	*(int *)((char *)&arg_8 + 0) = *(int *)((char *)&arg_8 + 0) - si;
	arg_10 = (int)(arg_8 - (unsigned long)(unsigned int)si >> 16);
	loc_c = si;
	loc_a = 0;
	loc_10 = si;
	loc_e = 0;
	smem_read_words(arg_10, *(int *)((char *)&arg_8 + 0), (unsigned char far *)BUF_XFER, si);
	ax4 = loc_10;
	*(int *)((char *)&arg_4 + 0) = *(int *)((char *)&arg_4 + 0) - ax4;
	arg_6 = (int)(arg_4 - ((long)loc_e << 16 | (unsigned)ax4) >> 16);
	t2 = flash_write_words(arg_6, *(int *)((char *)&arg_4 + 0), (unsigned char far *)BUF_XFER, si);
	ax5 = loc_c;
	dx = loc_a;
	*(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - ax5;
	arg_2 = (int)(arg_0 - ((long)dx << 16 | (unsigned)ax5) >> 16);
	ax = arg_2 | *(int *)((char *)&arg_0 + 0);
	if (ax != 0) {
		goto L13;
	}
L2:
	return ((long)dx << 16 | (unsigned)ax);
}
