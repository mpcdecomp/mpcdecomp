extern unsigned char B_A06C;
extern unsigned char B_A419;
extern int TBL_A1C1;
extern int TBL_A1C3;
extern int TBL_A1C5;
extern int W_5361;
extern int W_5365;
extern int W_5367;
extern int W_53A7;
extern int W_A075;
extern int W_A077;
extern int W_A07D;
extern int W_A07F;
extern int W_A1C7;
extern int W_A1C9;
extern int W_A1CB;
extern int W_A1CD;
extern int W_A1CF;
extern int W_A1D1;
extern int W_A1D3;
extern int W_A1D5;
extern int W_A1D7;

fn_c6561(a0)
{
	far_d8850();
	far_d880a();
	far_d885c(a0);
	far_d88e6(0x25ab, W_5367, W_5365, W_5361);
	far_d88e6(0x25ca, W_53A7, B_A06C);
	far_d88e6(0x25e0, B_A419, W_A07D, W_A07F, W_A075, W_A077);
	far_d88e6(0x2602, TBL_A1C1, TBL_A1C3, TBL_A1C5);
	far_d88e6(0x2624, W_A1C7, W_A1C9, W_A1CB);
	far_d88e6(0x2646, W_A1CD, W_A1CF, W_A1D1);
	far_d88e6(0x2668, W_A1D3, W_A1D5, W_A1D7);
	far_d861e();
	far_d8856();
	return;
}
