extern char STR_2301[];
extern char STR_2311[];

far_c5e13()
{
	int v2;

	far_d97f5();
	far_d880a();
	far_da730(STR_2301);
	far_d8827(7, 0);
	far_d885c(STR_2311);
	while (1) {
		far_c5e6a();
		if ((v2 = far_c64c1()) != 0)
			return v2;
	}
}
