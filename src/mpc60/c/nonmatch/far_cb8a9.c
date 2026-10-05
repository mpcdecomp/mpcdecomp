/* differs: +2a mov byte ptr TBL_50BF_ [bx],al | push ax */
extern char TBL_50BE[];
extern char TBL_50BF[];
extern char TBL_50C0[];
extern char TBL_50C1[];
extern char TBL_50C2[];
extern char TBL_50C3[];
extern char TBL_50C4[];
extern char TBL_50C5[];
extern char TBL_50C6[];
extern char TBL_50C7[];

far_cb8a9()
{
	int v2;

	v2 = 0;
	do {
		TBL_50BE[v2 * 10] = 0;
		TBL_50BF[v2 * 10] = v2 % 8;
		TBL_50C0[v2 * 10] = 15;
		TBL_50C1[v2 * 10] = 42;
		TBL_50C2[v2 * 10] = 50;
		TBL_50C3[v2 * 10] = 0;
		TBL_50C4[v2 * 10] = 3;
		TBL_50C5[v2 * 10] = 16;
		TBL_50C6[v2 * 10] = 20;
		TBL_50C7[v2 * 10] = 1;
		v2++;
	} while (v2 < 16);
	return;
}
