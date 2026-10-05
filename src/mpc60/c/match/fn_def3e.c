extern char B_535C;
extern char B_5504;
extern char TBL_B1B9[];
extern char W_4C1C[];
extern char W_535F[];
extern int W_B1F9;
extern int W_B1FB;
extern int W_B1FD;

fn_def3e()
{
	while (1) {
		L_df04f(20);
		if (B_5504 != 0) {
			far_de3f8(W_4C1C, 0, (unsigned)(W_535F - W_4C1C) >> 1 << 1);
			B_5504 = 0;
		}
		if (B_535C != 0) {
			if (W_B1FD > 0xa8c) {
				W_B1FD = 0;
				W_B1FB = 0;
				setmem(TBL_B1B9, 65, 0);
				W_B1F9 = -1;
			}
			if (W_B1FD == 0) {
				far_df035(1);
				far_e016f();
				far_df042(1);
			}
		}
	}
	return;
}
