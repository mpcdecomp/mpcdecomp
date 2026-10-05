extern char B_52AD;
extern char B_52AE;
extern char STR_282C[];

far_c6ac2()
{
	far_d8827(1, 21);
	if (B_52AD != 0) {
		far_d885c(STR_282C);
		far_da14f(1);
	}
	else
		far_d88b2(40);
	far_d8827(2, 21);
	if (B_52AE != 0) {
		far_d885c(STR_282C);
		far_da14f(3);
	}
	else
		far_d88b2(40);
	return;
}
