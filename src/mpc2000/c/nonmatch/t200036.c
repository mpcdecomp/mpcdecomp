/* differs: 150 size 158, image 152; +4 image `push si` CL `push di`; 172 size 158, image 22; +0 image `push es` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int BUF_XFER[1];
extern unsigned int REC_PEAK_L;
extern unsigned int REC_PEAK_MONO;
extern unsigned int REC_PEAK_R;
extern int REC_RING_POS;
extern unsigned int REC_TRIG_PEAK;
extern int __far mpc_config_rate(void);

void __far mpc_rate_caller(void)
{
	unsigned int loc_4;
	unsigned int loc_2;
	int bx;
	unsigned int bx2;
	unsigned cx;
	int cx2;
	unsigned int cx3;
	unsigned int si;
	int si2;
	int t1;

	si = REC_RING_POS;
	t1 = mpc_config_rate();
	REC_RING_POS = ((char)(t1 >> 8) << 8 | (unsigned char)((char)t1 & -2));
	loc_4 = 0;
	loc_2 = 0;
L1:
	bx = si;
	si2 = si + 1;
	cx = BUF_XFER[bx];
	if (cx >= 0) {
		goto L2;
	}
	cx = -cx;
L2:
	if (loc_2 >= (unsigned int)cx) {
		goto L3;
	}
	loc_2 = cx;
L3:
	si = si2 + 1;
	cx2 = BUF_XFER[si2];
	if (cx2 >= 0) {
		goto L4;
	}
	cx2 = -cx2;
L4:
	if (loc_4 >= (unsigned int)cx2) {
		goto L5;
	}
	loc_4 = cx2;
L5:
	if (si - REC_RING_POS == 2) {
		goto L6;
	}
	if (si < 0x400) {
		goto L1;
	}
	si = si - 0x400;
	goto L1;
L6:
	bx2 = loc_2;
	if (REC_PEAK_L >= bx2) {
		goto L7;
	}
	REC_PEAK_L = bx2;
L7:
	cx3 = loc_4;
	if (REC_PEAK_R >= cx3) {
		goto L8;
	}
	REC_PEAK_R = cx3;
L8:
	if (cx3 <= bx2) {
		goto L9;
	}
	bx2 = cx3;
L9:
	if (REC_TRIG_PEAK >= bx2) {
		goto L10;
	}
	REC_TRIG_PEAK = bx2;
L10:
	if (REC_PEAK_MONO >= bx2) {
		goto L11;
	}
	REC_PEAK_MONO = bx2;
L11:
	return;
}
