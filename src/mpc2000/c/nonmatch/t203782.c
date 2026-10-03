/* blocked: jumps into X_03840, another function: not C; differs: 150 size 128, image 112; +0 image `cmp byte ptr [0x8a68], 0` CL `enter 2, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char EDIT_CURSOR_H;
extern unsigned char EDIT_CURSOR_X;
extern unsigned char EDIT_CURSOR_Y;
extern unsigned char EDIT_FIELD_Y;
extern char G_FLAG_8CA8;
extern char G_SEQ_MODE;
extern int NUM_ENTRY_VALUE;
extern char WIN_FIELD_BOX_W;
extern char WIN_FIELD_DIGITS;
extern unsigned char WIN_FIELD_X;
extern long __far __pascal cmd_param_setup(int, int, char, char);
extern void __far __pascal ratio_calc_divide(int, int, int, int);

void __far L_03782(void)
{
	int ax;
	int ax2;
	int ax3;
	int ax4;
	int ax5;

	if (G_FLAG_8CA8 == 0) {
		goto L1;
	}
	ratio_calc_divide(WIN_FIELD_X, EDIT_FIELD_Y, NUM_ENTRY_VALUE, WIN_FIELD_DIGITS);
	return;
L1:
	if (G_SEQ_MODE != 0) {
		goto L2;
	}
	ax = ((char)(ax2 >> 8) << 8 | (unsigned char)WIN_FIELD_DIGITS);
	ax3 = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax + 1));
	goto L3;
L2:
	ax4 = ((char)(ax2 >> 8) << 8 | (unsigned char)WIN_FIELD_DIGITS);
	ax3 = ((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 - G_SEQ_MODE));
L3:
	WIN_FIELD_BOX_W = (char)((char)ax3 * 6);
	ax5 = EDIT_CURSOR_Y;
	cmd_param_setup(EDIT_CURSOR_X, ax5, WIN_FIELD_BOX_W, EDIT_CURSOR_H);
	return;
}
