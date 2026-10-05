extern char B_52A5;
extern char B_8E67;
extern char B_8E68;
extern char B_8E69;
extern char B_8E6A;
extern char TBL_8E65;
extern char TBL_8E66;

far_e0bad(a0)
char a0;
{
	TBL_8E65 = -16;
	TBL_8E66 = 126;
	B_8E67 = 0;
	B_8E68 = a0;
	B_8E69 = 0;
	B_8E6A = -9;
	far_e09f4(&TBL_8E65, 6, B_52A5);
	return;
}
