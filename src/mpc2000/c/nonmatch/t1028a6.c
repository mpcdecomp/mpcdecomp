/* differs: 150 size 90, image 74; +1 image `enter 4, 0` CL `enter 0xa, 0`; 172 size 90, image 74; +1 image `enter 4, 0` CL `enter 0xa, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0

void __near __pascal buffer_init(int arg_6, int arg_4, int arg_2, int arg_0)
{
	int loc_4;
	int loc_2;
	int bx;
	int cx;
	int di;
	int es;
	int si;

	loc_4 = 1;
	cx = arg_0;
	bx = arg_2;
L1:
	loc_2 = 0;
	di = arg_4;
L2:
	if (cx == 0) {
		goto L3;
	}
	es = arg_6;
	si = di;
	di = di + 2;
	*(int far *)MK_FP(es, si) = bx;
	bx = bx + loc_4;
	cx = cx - 1;
	loc_2 = loc_2 + 1;
	if (loc_2 < 128) {
		goto L2;
	}
L3:
	arg_4 = di;
	bx = ~bx;
	loc_4 = loc_4 + 1;
	if (cx != 0) {
		goto L1;
	}
	return;
}
