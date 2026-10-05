extern char A_53DD[];
extern char B_5218;
extern char B_53DC;
extern char STR_2BD6[];
extern char STR_2BE6[];
extern char STR_2BEF[];
extern int TBL_0CF1[];

far_c7ded(a0)
{
	far_c1f4e(STR_2BD6);
	far_d8827(1, 0);
	far_d885c(STR_2BE6);
	far_d88e6(0x2bec, TBL_0CF1[B_5218]);
	far_d885c(STR_2BEF);
	far_d88e6(0x2bf8, a0);
	far_d8827(2, 0);
	far_d3873(76, 2, 91);
	far_d885c(A_53DD);
	B_53DC = 22;
	return far_d981a(2);
}
