extern char A_53DD[];
extern char B_53DB;
extern char B_53DC;
extern char B_5501;
extern char B_A61D;
extern char STR_360A[];
extern char STR_360F[];

far_da2e1()
{
	far_d880a();
	far_da730(STR_360A);
	far_d8810(0);
	if (B_5501 != 0) {
		far_d8827(0, 3);
		far_d88e6(STR_360F, B_53DB, B_53DC, B_A61D);
		far_d8827(1, 0);
	}
	far_d3873(B_53DB, B_53DC, B_A61D);
	far_d885c(A_53DD);
	return;
}
