#if FW_VERSION == 150
extern char B_980A_V150;
extern char B_980B_V150;
extern unsigned char G_PAD_INDEX;
void __far __pascal cmd_param_setup(int, int, int, int);
#else
extern char B_9A4C;
extern unsigned W_9A4A;
extern char STR_CLEAR[1];
extern char STR_ALL_CH[1];
int __far __pascal L_03C6C(int, int);
void __far __pascal string_copy_scan(char far *);
#endif
extern unsigned char G_PAD_BANK;
extern char far *W_64CE;
void __far __pascal cmd_build_params(int, int, int, int, int);
void __far __pascal cmd_exec_0E_wrapper(int);
void __far __pascal cmd_ratio_setup(int, int, char);

void __far __fastcall __loadds cmd_exec_quad(void)
{
#if FW_VERSION == 150
	int l2;
	int l4;
	int l6;
	int l8;
#else
	int a, b, y;
	unsigned m;
#endif
	int si_;
	int di_;

#if FW_VERSION == 150
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
#else
	cmd_exec_0E_wrapper(2);
	cmd_build_params(0x13, 0, 0, 0xf8, 0x33);
	if (B_9A4C & 1) {
		a = 0;
		b = 0xd;
	} else {
		a = 0xe;
		b = 0x24;
	}
	for (m = 1, y = 4; m; m += m, y += 0xf)
		if (W_9A4A & m)
			cmd_build_params(0x12, y, a, 0xe, b);
	cmd_exec_0E_wrapper(0);
#endif
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
#if FW_VERSION == 172
	string_copy_scan(L_03C6C(6, 1) > 1 ? STR_CLEAR : STR_ALL_CH);
#endif
	;
}
