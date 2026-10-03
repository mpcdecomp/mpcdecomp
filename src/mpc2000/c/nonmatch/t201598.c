/* differs: 150 size 62, image 72; +1 image `enter 6, 0` CL `enter 2, 0`; 172 size 62, image 72; +1 image `enter 6, 0` CL `enter 2, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0

long __far __pascal memcpy_far_seg(unsigned int arg_4, unsigned int arg_2, int arg_0)
{
	int loc_6;
	int loc_4;
	int loc_2;
	int ax;
	int bx;
	int di;
	int di2;
	int di3;
	unsigned int dx;
	unsigned int dx2;
	unsigned int dx3;
	int si;
	int si2;
	int si3;

	dx = arg_4 >> 1;
	dx2 = dx >> 1;
	dx3 = dx2 >> 1;
	ax = (((arg_2 >> 1 | (arg_4 & 1) << 15) >> 1 | (dx & 1) << 15) >> 1 | (dx2 & 1) << 15) >> 1 | (dx3 & 1) << 15;
	loc_2 = dx3 >> 1;
	loc_4 = ax;
	loc_6 = arg_2 << 12;
	bx = arg_0;
	di = bx;
	si = (int)(unsigned)&loc_6;
	*(int far *)MK_FP(SEG_STACK, di) = *(int far *)MK_FP(SEG_STACK, si);
	si2 = si + 2;
	di2 = di + 2;
	*(int far *)MK_FP(SEG_STACK, di2) = *(int far *)MK_FP(SEG_STACK, si2);
	si3 = si2 + 2;
	di3 = di2 + 2;
	*(int far *)MK_FP(SEG_STACK, di3) = *(int far *)MK_FP(SEG_STACK, si3);
	return (long)MK_FP(SEG_STACK, bx);
}
