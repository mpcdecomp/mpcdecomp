extern char B_B24D;
extern char B_B24E;
extern char B_B24F;
extern char B_B250;
extern char B_B251;
extern char B_B252;
extern char B_B253;
extern char B_B254;
extern char B_B255;
extern char TBL_50BE[];
extern char TBL_50C0[];
extern char TBL_50C1[];
extern char TBL_50C2[];
extern char TBL_50C3[];
extern char TBL_50C4[];
extern char TBL_50C5[];
extern char TBL_50C6[];
extern char TBL_50C7[];

far_c4891(a0)
char a0;
{
	B_B24D = TBL_50BE[a0 * 10] + 1;
	B_B24E = TBL_50C0[a0 * 10] + 1;
	B_B24F = TBL_50C1[a0 * 10];
	B_B250 = TBL_50C2[a0 * 10];
	B_B251 = TBL_50C3[a0 * 10];
	B_B252 = TBL_50C4[a0 * 10] + 1;
	B_B253 = TBL_50C5[a0 * 10];
	B_B254 = TBL_50C6[a0 * 10];
	B_B255 = TBL_50C7[a0 * 10];
	return;
}
