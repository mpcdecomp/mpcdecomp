extern char B_4C1E;
extern char B_4C1F;
extern char B_4E7A;
extern char B_53AB;
extern char STR_36E1[];
extern char STR_36E7[];
extern int W_535F;
extern int W_5361;

far_dea87()
{
	far_d8827(5, 31);
	if (B_53AB != 0 && B_4E7A != 5 && B_4E7A != 6)
		far_d885c(STR_36E1);
	else {
		W_535F = far_d3a45(W_5361, B_4C1E, B_4C1F);
		far_d88e6(STR_36E7, W_535F / 10, W_535F % 10);
	}
	return;
}
