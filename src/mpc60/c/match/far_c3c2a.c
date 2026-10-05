extern char STR_1E8F[];

far_c3c2a(a0, a1)
{
	far_d8827(2, 21);
	if (a0 == 0 || a0 == 1 || a0 == 4 || a0 == 5 || a0 >= 41) {
		a1 = 0;
		far_d88b2(40);
	}
	else {
		far_d885c(STR_1E8F);
		far_da14f(2);
	}
	return a1;
}
