/* differs: +87 xor al,al | mov al, 0 */
extern char B_4CBE_V112;
extern char B_5064_V112;
extern char B_52B5_V112;
extern char B_52E3_V112;
extern char B_52E5_V112;
extern char B_54F7;
extern char B_5757_V112;
extern char B_5759_V112;
extern int W_A454_V112;
extern int W_A456_V112;

L_e0488(a0)
{
	int v2;

	if ((v2 = L_e053c(a0)) != 0) {
		far_d4b6e();
		setmem(0x6196, 0x2710, 0);
		setmem(-0x775a, 20, 0);
		setmem(-0x7746, 20, 1);
	}
	L_dc484(-1, 0);
	far_d4a9b(0);
	W_A456_V112 = 0;
	W_A454_V112 = 0;
	B_52B5_V112 = B_52E3_V112 = -1;
	B_5757_V112 = B_5759_V112 = 0;
	B_52E5_V112 = B_5757_V112;
	B_5064_V112 = B_52E5_V112;
	B_54F7 = 77;
	far_d6a82(B_4CBE_V112, 1);
	return v2;
}
