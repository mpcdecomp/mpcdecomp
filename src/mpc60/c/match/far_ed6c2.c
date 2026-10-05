extern char B_8E67;
extern char B_8E6A;
extern unsigned char B_8E6B;

far_ed6c2()
{
	if (B_8E67 != 71)
		return 0;
	if (B_8E6A == 69 || B_8E6A == 70)
		return B_8E6B;
	return 0;
}
