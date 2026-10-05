extern char B_8BDE;
extern char B_8D7A;
extern char STR_366F[];
extern char STR_3678[];

far_de67d(a0, a1, a2)
{
	int v2;

	B_8D7A = 1;
	v2 = 0;
	if (B_8BDE != 0) {
		far_c587b();
		v2 = 1;
	}
	far_d8810(0);
	far_de639(102, a0, a1);
	far_d8827(7, 0);
	far_d885c(STR_366F);
	if (a0 == 0) {
		far_d88b2(22);
		far_d88e6(STR_3678, a2);
	}
	far_de723();
	far_d8810(3);
	if (v2 != 0)
		far_d8692(77);
	B_8D7A = 0;
	return;
}
