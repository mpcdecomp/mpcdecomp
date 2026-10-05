/* differs: +11 mov ax,word ptr 6[bp] | mov bx, word ptr [bp + 6] */
extern char B_53B0;
extern char B_53B1;
extern char B_604A_V112;
extern char B_604B_V112;
extern char B_604C_V112;
extern char TBL_6049_V112[];

L_c3065(a0)
{
	int v2;
	char z0[2];

	far_d8850();
	v2 = 0;
	do {
		TBL_6049_V112[v2] = ((char *)(a0 + v2))[1];
		v2++;
	} while (v2 < 4);
	far_dde82();
	B_53B1 = 1;
	while (B_53B0 == 0)
		;
	inport(288);
	while (B_53B0 != 0) {
		if (L_c3132() != 0)
			B_53B1 = 0;
		far_d8827(2, 6);
		far_d88e6(0x15cb, B_604C_V112, B_604B_V112, B_604A_V112);
	}
	far_ddec3();
	inport(288);
	far_d8856();
	return;
}
