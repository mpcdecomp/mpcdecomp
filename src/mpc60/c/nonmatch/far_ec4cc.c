/* differs: +c beq $5 | jz br_ec53a */
extern char B_94A6;
extern char B_981C;
extern char B_981D;
extern char B_9D34;
extern char B_A068;
extern char B_A069;
extern int W_94D0;
extern int W_94D2;
extern int W_984C;
extern int W_984E;
extern int W_9854;

far_ec4cc()
{
	int v2;
	char z0;
	char v4;

	if (B_A069 != 0 && B_981C >= 0 && (B_A068 != B_9D34 || B_94A6 == 1)) {
		far_d3f44(&B_981C, W_94D0, W_94D2, &v4);
		far_eaf33(&B_981C, v4, v2);
		if (W_9854 > W_984C && (B_981D & 1) != 0)
			far_e8cd3(&B_981C, W_984E);
	}
	return;
}
