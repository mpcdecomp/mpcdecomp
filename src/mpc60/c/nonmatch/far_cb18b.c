/* differs: +11 mov ax,word ptr 6[bp] | mov bx, word ptr [bp + 6] */
extern char B_53B0;
extern char B_53B1;
extern char B_53B8;
extern char B_53B9;
extern char B_53BA;
extern char STR_346C[];
extern char TBL_53B7[];

far_cb18b(a0)
{
	int v2;

	far_d8850();
	v2 = 0;
	do {
		TBL_53B7[v2] = ((char *)(a0 + v2))[1];
		v2++;
	} while (v2 < 4);
	far_dde82();
	B_53B1 = 1;
	while (B_53B0 == 0)
		;
	inport(288);
	while (B_53B0 != 0) {
		if (far_cb258() != 0)
			B_53B1 = 0;
		far_d8827(2, 6);
		far_d88e6(STR_346C, B_53BA, B_53B9, B_53B8);
	}
	far_ddec3();
	inport(288);
	far_d8856();
	return;
}
