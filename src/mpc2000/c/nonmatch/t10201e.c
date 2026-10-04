/* differs: 150 size 2270, image 516; +0 image `push bp` CL `enter 0x70, 0`; 172 size 2270, image 516; +0 image `push bp` CL `enter 0x70, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int P_9F22;
extern int W_8FB8;
extern int W_983C;
extern int W_983E;
extern int W_9D58;

long __far timing_calc_rate(int arg_0)
{
	unsigned int ax;
	unsigned int ax10;
	unsigned int ax11;
	unsigned int ax12;
	unsigned int ax13;
	int ax14;
	unsigned int ax15;
	unsigned int ax16;
	unsigned int ax17;
	unsigned int ax18;
	unsigned int ax19;
	unsigned int ax2;
	unsigned int ax20;
	unsigned int ax21;
	unsigned int ax22;
	unsigned int ax23;
	unsigned int ax24;
	int ax25;
	unsigned int ax3;
	unsigned int ax4;
	unsigned int ax5;
	unsigned int ax6;
	unsigned int ax7;
	unsigned int ax8;
	unsigned int ax9;
	int bp;
	int bp2;
	unsigned int bx;
	unsigned int bx10;
	unsigned int bx11;
	unsigned int bx12;
	unsigned int bx13;
	unsigned int bx14;
	unsigned int bx15;
	unsigned int bx16;
	unsigned int bx17;
	unsigned int bx18;
	unsigned int bx19;
	unsigned int bx2;
	unsigned int bx3;
	unsigned int bx4;
	unsigned int bx5;
	unsigned int bx6;
	unsigned int bx7;
	unsigned int bx8;
	unsigned int bx9;
	int cx;
	int cx10;
	int cx11;
	int cx12;
	int cx13;
	int cx14;
	int cx15;
	int cx16;
	int cx17;
	int cx18;
	int cx19;
	int cx2;
	int cx20;
	int cx21;
	int cx3;
	int cx4;
	int cx5;
	int cx6;
	int cx7;
	int cx8;
	int cx9;
	int di;
	int di2;
	int di3;
	int di4;
	int di5;
	int di6;
	int di7;
	int dx;
	int dx10;
	int dx11;
	int dx12;
	int dx13;
	int dx14;
	int dx15;
	int dx16;
	int dx17;
	int dx18;
	int dx19;
	int dx2;
	int dx20;
	int dx21;
	int dx3;
	int dx4;
	int dx5;
	int dx6;
	int dx7;
	int dx8;
	int dx9;
	int p12;
	int p14;
	unsigned int si;
	unsigned int si2;
	int si3;
	unsigned int si4;
	long t1;

	si = W_983C;
	di = W_983E;
	bx = si;
	ax = di;
	dx = -(ax < 0);
	bp = dx;
	cx = 2;
L1:
	bx = bx << 1;
	ax = ax << 1 | bx >> 15 & 1;
	dx = dx << 1 | ax >> 15 & 1;
	cx = cx - 1;
	if (cx != 0) {
		goto L1;
	}
	bx2 = bx + si;
	ax2 = ax + di + (bx2 < bx);
	dx2 = dx + bp + (ax2 < ax);
	cx2 = 4;
L2:
	bx2 = bx2 << 1;
	ax2 = ax2 << 1 | bx2 >> 15 & 1;
	dx2 = dx2 << 1 | ax2 >> 15 & 1;
	cx2 = cx2 - 1;
	if (cx2 != 0) {
		goto L2;
	}
	bx3 = bx2 - si;
	ax3 = (int)(((long)ax2 << 16 | (unsigned)bx2) - ((long)di << 16 | (unsigned)si) >> 16);
	dx3 = (int)(((long)dx2 << 16 | (unsigned)ax2) - ((long)bp << 16 | (unsigned)di) >> 16);
	cx3 = 4;
L3:
	bx3 = bx3 << 1;
	ax3 = ax3 << 1 | bx3 >> 15 & 1;
	dx3 = dx3 << 1 | ax3 >> 15 & 1;
	cx3 = cx3 - 1;
	if (cx3 != 0) {
		goto L3;
	}
	bx4 = bx3 + si;
	ax4 = ax3 + di + (bx4 < bx3);
	dx4 = dx3 + bp + (ax4 < ax3);
	cx4 = 4;
L4:
	bx4 = bx4 << 1;
	ax4 = ax4 << 1 | bx4 >> 15 & 1;
	dx4 = dx4 << 1 | ax4 >> 15 & 1;
	cx4 = cx4 - 1;
	if (cx4 != 0) {
		goto L4;
	}
	bx5 = bx4 + si;
	ax5 = ax4 + di + (bx5 < bx4);
	dx5 = dx4 + bp + (ax5 < ax4);
	cx5 = 2;
L5:
	bx5 = bx5 << 1;
	ax5 = ax5 << 1 | bx5 >> 15 & 1;
	dx5 = dx5 << 1 | ax5 >> 15 & 1;
	cx5 = cx5 - 1;
	if (cx5 != 0) {
		goto L5;
	}
	bx6 = bx5 + si;
	ax6 = ax5 + di + (bx6 < bx5);
	dx6 = dx5 + bp + (ax6 < ax5);
	cx6 = 3;
L6:
	bx6 = bx6 << 1;
	ax6 = ax6 << 1 | bx6 >> 15 & 1;
	dx6 = dx6 << 1 | ax6 >> 15 & 1;
	cx6 = cx6 - 1;
	if (cx6 != 0) {
		goto L6;
	}
	ax7 = (int)(((long)ax6 << 16 | (unsigned)bx6) - ((long)di << 16 | (unsigned)si) >> 16);
	dx7 = (int)(((long)dx6 << 16 | (unsigned)ax6) - ((long)bp << 16 | (unsigned)di) >> 16);
	cx7 = 4;
L7:
	dx7 = dx7 >> 1;
	ax7 = ax7 >> 1 | (dx7 & 1) << 15;
	cx7 = cx7 - 1;
	if (cx7 != 0) {
		goto L7;
	}
	di2 = arg_0;
	cx8 = 8;
L8:
	di2 = di2 >> 1;
	si = si >> 1 | (di2 & 1) << 15;
	cx8 = cx8 - 1;
	if (cx8 != 0) {
		goto L8;
	}
	si2 = si + ax7;
	di3 = di2 + dx7 + (si2 < si);
	bx7 = si2 << 1;
	ax8 = di3 << 1 | si2 >> 15 & 1;
	bx8 = bx7 + si2;
	ax9 = ax8 + di3 + (bx8 < bx7);
	dx8 = (-(di3 < 0) << 1 | (unsigned int)di3 >> 15 & 1) + -(di3 < 0) + (ax9 < ax8);
	cx9 = 3;
L9:
	bx8 = bx8 << 1;
	ax9 = ax9 << 1 | bx8 >> 15 & 1;
	dx8 = dx8 << 1 | ax9 >> 15 & 1;
	cx9 = cx9 - 1;
	if (cx9 != 0) {
		goto L9;
	}
	bx9 = bx8 - si2;
	ax10 = (int)(((long)ax9 << 16 | (unsigned)bx8) - ((long)di3 << 16 | (unsigned)si2) >> 16);
	dx9 = (int)(((long)dx8 << 16 | (unsigned)ax9) - (long)(int)di3 >> 16);
	cx10 = 3;
L10:
	bx9 = bx9 << 1;
	ax10 = ax10 << 1 | bx9 >> 15 & 1;
	dx9 = dx9 << 1 | ax10 >> 15 & 1;
	cx10 = cx10 - 1;
	if (cx10 != 0) {
		goto L10;
	}
	bx10 = bx9 - si2;
	ax11 = (int)(((long)ax10 << 16 | (unsigned)bx9) - ((long)di3 << 16 | (unsigned)si2) >> 16);
	dx10 = (int)(((long)dx9 << 16 | (unsigned)ax10) - (long)(int)di3 >> 16);
	cx11 = 3;
L11:
	bx10 = bx10 << 1;
	ax11 = ax11 << 1 | bx10 >> 15 & 1;
	dx10 = dx10 << 1 | ax11 >> 15 & 1;
	cx11 = cx11 - 1;
	if (cx11 != 0) {
		goto L11;
	}
	bx11 = bx10 - si2;
	ax12 = (int)(((long)ax11 << 16 | (unsigned)bx10) - ((long)di3 << 16 | (unsigned)si2) >> 16);
	dx11 = (int)(((long)dx10 << 16 | (unsigned)ax11) - (long)(int)di3 >> 16);
	cx12 = 5;
L12:
	bx11 = bx11 << 1;
	ax12 = ax12 << 1 | bx11 >> 15 & 1;
	dx11 = dx11 << 1 | ax12 >> 15 & 1;
	cx12 = cx12 - 1;
	if (cx12 != 0) {
		goto L12;
	}
	bx12 = bx11 + si2;
	ax13 = ax12 + di3 + (bx12 < bx11);
	dx12 = dx11 + -(di3 < 0) + (ax13 < ax12);
	cx13 = 3;
L13:
	bx12 = bx12 << 1;
	ax13 = ax13 << 1 | bx12 >> 15 & 1;
	dx12 = dx12 << 1 | ax13 >> 15 & 1;
	cx13 = cx13 - 1;
	if (cx13 != 0) {
		goto L13;
	}
	cx14 = 4;
L14:
	dx12 = dx12 >> 1;
	ax13 = ax13 >> 1 | (dx12 & 1) << 15;
	cx14 = cx14 - 1;
	if (cx14 != 0) {
		goto L14;
	}
	p12 = ax13;
	p14 = dx12;
	si3 = W_983C;
	di4 = W_983E;
	bx13 = si3;
	ax14 = di4;
	dx13 = -(ax14 < 0);
	bp2 = dx13;
	cx15 = 2;
L15:
	bx13 = bx13 << 1;
	ax14 = ax14 << 1 | bx13 >> 15 & 1;
	dx13 = dx13 << 1 | (unsigned int)ax14 >> 15 & 1;
	cx15 = cx15 - 1;
	if (cx15 != 0) {
		goto L15;
	}
	bx14 = bx13 - si3;
	ax15 = (int)(((long)ax14 << 16 | (unsigned)bx13) - ((long)di4 << 16 | (unsigned)si3) >> 16);
	dx14 = (int)(((long)dx13 << 16 | (unsigned)ax14) - ((long)bp2 << 16 | (unsigned)di4) >> 16);
	cx16 = 3;
L16:
	bx14 = bx14 << 1;
	ax15 = ax15 << 1 | bx14 >> 15 & 1;
	dx14 = dx14 << 1 | ax15 >> 15 & 1;
	cx16 = cx16 - 1;
	if (cx16 != 0) {
		goto L16;
	}
	bx15 = bx14 + si3;
	ax16 = ax15 + di4 + (bx15 < bx14);
	dx15 = dx14 + bp2 + (ax16 < ax15);
	cx17 = 4;
L17:
	bx15 = bx15 << 1;
	ax16 = ax16 << 1 | bx15 >> 15 & 1;
	dx15 = dx15 << 1 | ax16 >> 15 & 1;
	cx17 = cx17 - 1;
	if (cx17 != 0) {
		goto L17;
	}
	bx16 = bx15 + si3;
	ax17 = ax16 + di4 + (bx16 < bx15);
	dx16 = dx15 + bp2 + (ax17 < ax16);
	bx17 = bx16 << 1;
	ax18 = ax17 << 1 | bx16 >> 15 & 1;
	bx18 = bx17 + si3;
	ax19 = ax18 + di4 + (bx18 < bx17);
	dx17 = (dx16 << 1 | ax17 >> 15 & 1) + bp2 + (ax19 < ax18);
	cx18 = 3;
L18:
	bx18 = bx18 << 1;
	ax19 = ax19 << 1 | bx18 >> 15 & 1;
	dx17 = dx17 << 1 | ax19 >> 15 & 1;
	cx18 = cx18 - 1;
	if (cx18 != 0) {
		goto L18;
	}
	bx19 = bx18 - si3;
	ax20 = (int)(((long)ax19 << 16 | (unsigned)bx18) - ((long)di4 << 16 | (unsigned)si3) >> 16);
	dx18 = (int)(((long)dx17 << 16 | (unsigned)ax19) - ((long)bp2 << 16 | (unsigned)di4) >> 16);
	cx19 = 2;
L19:
	bx19 = bx19 << 1;
	ax20 = ax20 << 1 | bx19 >> 15 & 1;
	dx18 = dx18 << 1 | ax20 >> 15 & 1;
	cx19 = cx19 - 1;
	if (cx19 != 0) {
		goto L19;
	}
	ax21 = ax20 + di4 + (bx19 + si3 < bx19);
	dx19 = dx18 + bp2 + (ax21 < ax20);
	cx20 = 4;
L20:
	dx19 = dx19 >> 1;
	ax21 = ax21 >> 1 | (dx19 & 1) << 15;
	cx20 = cx20 - 1;
	if (cx20 != 0) {
		goto L20;
	}
	ax22 = ax21 + p12;
	dx20 = dx19 + p14 + (ax22 < ax21);
	W_983C = si2;
	W_983E = di3;
	di5 = dx20 >> 1;
	di6 = di5 >> 1;
	di7 = di6 >> 1;
	si4 = ((ax22 >> 1 | (dx20 & 1) << 15) >> 1 | (di5 & 1) << 15) >> 1 | (di6 & 1) << 15;
	ax23 = ax22 + si4;
	ax24 = ax23 + (si4 >> 1 | (di7 & 1) << 15);
	dx21 = dx20 + di7 + (ax23 < ax22) + (di7 >> 1) + (ax24 < ax23);
	if (dx21 < 0) {
		goto L21;
	}
	if ((char)(dx21 >> 8) != 0) {
		goto L22;
	}
	if ((unsigned int)((char)dx21 << 8 | (unsigned char)(char)(ax24 >> 8)) < (unsigned int)W_9D58) {
		goto L23;
	}
L22:
	ax25 = W_9D58 - 1;
	goto L24;
L21:
	if ((char)(dx21 >> 8) != -1) {
		goto L25;
	}
	if ((unsigned int)-((char)dx21 << 8 | (unsigned char)(char)(ax24 >> 8)) < (unsigned int)W_9D58) {
		goto L23;
	}
L25:
	ax25 = -(W_9D58 - 1);
	goto L24;
L23:
	cx21 = 7;
L26:
	ax24 = ax24 << 1;
	dx21 = dx21 << 1 | ax24 >> 15 & 1;
	cx21 = cx21 - 1;
	if (cx21 != 0) {
		goto L26;
	}
	t1 = ((long)dx21 << 16 | (unsigned)ax24);
	ax25 = (int)(t1 / (long)(int)W_9D58);
	dx21 = (int)(t1 % (long)(int)W_9D58);
L24:
	if (ax25 <= P_9F22) {
		goto L27;
	}
	P_9F22 = ax25;
	goto L28;
L27:
	if (ax25 >= W_8FB8) {
		goto L28;
	}
	W_8FB8 = ax25;
L28:
	return ((long)dx21 << 16 | (unsigned)ax25);
}
