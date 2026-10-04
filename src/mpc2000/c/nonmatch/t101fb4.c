/* differs: 150 size 216, image 106; +0 image `push bp` CL `enter 0x12, 0`; 172 size 216, image 106; +0 image `push bp` CL `enter 0x12, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0

long __far addr_calc_segment(int arg_0, int arg_2, int arg_4)
{
	int loc_4;
	int loc_2;
	unsigned int ax;
	unsigned int ax2;
	unsigned int bx;
	int cx;
	unsigned int cx2;
	unsigned int di;
	unsigned int dx;
	int flags;
	unsigned int si;

	loc_2 = 0;
	loc_4 = 0;
	di = arg_4;
	bx = arg_0;
	ax = arg_2;
	cx = 4;
L1:
	ax = ax >> 1;
	bx = bx >> 1 | (ax & 1) << 15;
	di = di >> 1 | (bx & 1) << 15;
	cx = cx - 1;
	if (cx != 0) {
		goto L1;
	}
	if (ax != 0) {
		goto L2;
	}
	flags = bx - 0x3fff;
	if (CC(">u", flags)) {
		goto L2;
	}
	if (CC("!=", flags)) {
		goto L3;
	}
	if (di > 1) {
		goto L2;
	}
L3:
	cx2 = 0x7fff;
	si = -1;
L4:
	ax2 = (unsigned)((unsigned long)((long)bx << 16 | (unsigned)di) / (unsigned long)(unsigned int)cx2);
	dx = (unsigned)((unsigned long)((long)bx << 16 | (unsigned)di) % (unsigned long)(unsigned int)cx2);
	if (ax2 == 0) {
		goto L5;
	}
	if (dx >= si) {
		goto L6;
	}
	si = dx;
	loc_2 = cx2;
	loc_4 = ax2;
	if (dx == 0) {
		goto L2;
	}
L6:
	if (ax2 >= cx2) {
		goto L2;
	}
L5:
	cx2 = cx2 - 1;
	if (cx2 != 0) {
		goto L4;
	}
L2:
	return ((long)loc_4 << 16 | (unsigned)loc_2);
}
