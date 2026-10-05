extern char B_BE83;
extern char B_BE84;
extern char B_BE85;
extern char B_BE86;
extern char TBL_7DA2[];
extern char TBL_7DA3[];
extern char TBL_7DA4[];
extern char TBL_7DA5[];
extern char TBL_7DA6[];
extern char TBL_BE82;

far_e4bc1(a0)
{
	TBL_BE82 = TBL_7DA2[a0 * 5];
	B_BE83 = TBL_7DA3[a0 * 5];
	B_BE84 = TBL_7DA4[a0 * 5];
	B_BE85 = TBL_7DA5[a0 * 5];
	B_BE86 = TBL_7DA6[a0 * 5];
	return;
}
