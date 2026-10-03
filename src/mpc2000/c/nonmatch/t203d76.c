/* differs: 150 matches; 172 size 198, image 5; +5 image `push di` CL `push si` */
extern char B_980A_V150;
extern char B_980B_V150;
extern unsigned char G_PAD_BANK;
extern unsigned char G_PAD_INDEX;
extern char far *W_64CE;
extern int W_64D0;
void __far __pascal cmd_build_params(int, int, int, int, int);
void __far __pascal cmd_exec_0E_wrapper(int);
void __far __pascal cmd_param_setup(int, int, int, int);
void __far __pascal cmd_ratio_setup(int, int, char);

void __far __fastcall __loadds cmd_exec_quad(void)
{
	int l2;
	int l4;
	int l6;
	int l8;
	int si_;
	int di_;

	cmd_exec_0E_wrapper(0);
	if (B_980B_V150) {
		l2 = 1;
		l4 = 0xc;
	} else {
		l2 = 0xf;
		l4 = 0x23;
	}
	if (B_980A_V150) {
		l6 = 5;
		l8 = 0xee;
	} else {
		l6 = (G_PAD_INDEX << 4) - G_PAD_INDEX + 5;
		l8 = 0xd;
	}
	cmd_param_setup(l6, l2, l8, l4);
	if (!W_64CE) goto L_03F45;
	di_ = 0;
	si_ = 5;
loop_03EFF:
	cmd_ratio_setup(si_, 0x10, (char)(G_PAD_BANK + 0x41));
	cmd_build_params(0x13, si_, 1, 0xe, 0xe);
	cmd_build_params(0x13, si_ + 7, 0xf, 4, 0x22);
	((int (__far __pascal *)(int, int))W_64CE)(si_, (G_PAD_BANK << 4) + di_);
	si_ += 0xf;
	di_++;
	if (di_ < 0x10) goto loop_03EFF;
L_03F45:
	;
}
