extern char B_52A5;
extern char B_52A7;
extern char B_8E67;
extern char B_8E68;
extern char B_8E69;
extern char B_8E6A;
extern char B_8E6B;
extern char TBL_8E65;
extern char TBL_8E66;

far_e0cd1(a0)
char a0;
{
	TBL_8E65 = -16;
	TBL_8E66 = 126;
	B_8E67 = B_52A7 - 1;
	B_8E68 = 3;
	B_8E69 = a0;
	B_8E6A = 0;
	B_8E6B = -9;
	far_e09f4(&TBL_8E65, 7, B_52A5);
	return;
}
