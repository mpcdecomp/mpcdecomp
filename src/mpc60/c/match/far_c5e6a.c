extern char A_53B2[];
extern char B_4E7A;
extern char B_53AB;
extern char B_53C9;
extern char STR_2318[];
extern char STR_23D2[];
extern int W_5361;
extern int W_5363;
extern int W_5365;
extern int W_5375;
extern int W_5377;
extern int W_5379;
extern int W_537B;
extern int W_537D;
extern int W_537F;
extern int W_5381;
extern int W_5383;
extern int W_5393;
extern int W_5395;
extern int W_5397;
extern int W_5399;
extern int W_53BD;
extern int W_53BF;
extern int W_53C1;
extern int W_53C3;

far_c5e6a()
{
	far_d8827(1, 0);
	far_d88e6(STR_2318, W_5365, W_5361, W_5363);
	far_d88e6(0x233a, W_5381, W_5383, W_5375, W_5377);
	far_d88e6(0x2358, W_537D, W_537F, W_5379, W_537B);
	far_d88e6(0x2376, W_5393, W_5395, W_5397, W_5399);
	far_d88e6(0x2394, W_53C1, W_53C3, W_53BD, W_53BF);
	far_d88e6(0x23b2, B_4E7A, B_53AB);
	far_dea25(A_53B2);
	far_d8827(7, 20);
	far_d88e6(STR_23D2, B_53C9);
	return;
}
