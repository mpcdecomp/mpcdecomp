extern char A_53DD[];
extern char B_5218;
extern char B_53DC;
extern char STR_2BFB[];
extern char STR_2C0A[];
extern char STR_2C13[];
extern int TBL_0CF1[];

far_c7e8e(a0)
{
	far_d880a();
	far_c1f4e(STR_2BFB);
	far_d8827(1, 0);
	far_d885c(STR_2C0A);
	far_d88e6(0x2c10, TBL_0CF1[B_5218]);
	far_d885c(STR_2C13);
	far_d88e6(0x2c1c, a0);
	far_d8827(2, 0);
	far_d3873(76, 2, 92);
	far_d885c(A_53DD);
	B_53DC = 23;
	return far_d981a(2);
}
