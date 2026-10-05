extern char B_535A;
extern char B_981C[];
extern char B_A069;

far_d4c91()
{
	if (B_A069 == 0)
		far_d55e8(B_981C);
	else {
		far_d6a82(B_981C, B_535A, 1);
		far_ec4cc();
	}
	far_ee201(11, B_A069);
	return;
}
