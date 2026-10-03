/* differs: 150 size 156, image 106; +1 image `enter 0xe, 0` CL `enter 0x14, 0`; 172 size 156, image 106; +1 image `enter 0xe, 0` CL `enter 0x14, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char PGM_TABLE[1];

long __far __pascal rep_memcpy_handler(int arg_6, int arg_4, int arg_2, int arg_0)
{
	int loc_8;
	int loc_6;
	char loc_4[4];
	int ax;
	int bx;
	int cx;
	char far *__near *di;
	int dx;
	int es;
	int si;

	di = (char far *__near *)PGM_TABLE;
	loc_8 = 24;
L1:
	if ((unsigned int)*(int far *)(*di) <= 2) {
		goto L2;
	}
	bx = 0;
	*(int *)((char *)&loc_4 + 0) = 64;
	cx = *(int *)((char *)&loc_4 + 0);
	loc_6 = (int)(unsigned)di;
L3:
	es = FP_SEG(*di);
	si = FP_OFF(*di) + bx + 30;
	ax = arg_4;
	dx = arg_6;
	if (*(int far *)MK_FP(es, si) != ax) {
		goto L4;
	}
	if (*(int far *)MK_FP(es, si + 2) != dx) {
		goto L4;
	}
	ax = arg_0;
	dx = arg_2;
	*(int far *)MK_FP(es, si) = ax;
	*(int far *)MK_FP(es, si + 2) = dx;
L4:
	bx = bx + 29;
	cx = cx - 1;
	if (cx != 0) {
		goto L3;
	}
L5:
	loc_6 = loc_6 + 4;
	loc_8 = loc_8 - 1;
	if (loc_8 != 1) {
		goto L6;
	}
	return ((long)dx << 16 | (unsigned)ax);
L2:
	loc_6 = (int)(unsigned)di;
	goto L5;
L6:
	di = (char far *__near *)loc_6;
	goto L1;
}
