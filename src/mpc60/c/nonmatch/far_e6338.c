/* differs: +162 mov byte ptr B_A069_,0 | mov al, 0 */
extern char B_4C32;
extern char B_501C;
extern char B_5320;
extern char B_5321;
extern char B_5322;
extern char B_53DC;
extern char B_94A6;
extern char B_981C;
extern char B_9D34;
extern char B_A069;
extern char B_A61D;
extern char STR_4668[];
extern char STR_467F[];
extern char STR_4687[];
extern char STR_4694[];
extern char STR_46DF[];
extern char STR_4708[];
extern char STR_4728[];
extern char TBL_954C[];
extern char TBL_954D[];
extern char TBL_95B0[];
extern int W_52B6;
extern int W_52B8;
extern int W_52BA;

far_e6338()
{
	int v2;
	int v4;
	int v6;
	char z0[16];
	char v23;
	char z1[16];
	char v40;
	int v42;
	int v44;
	int v46;
	char v47;
	int v49;

	v49 = 0;
	far_c1f4e(STR_4668);
	far_d7983();
	B_53DC = 2;
	v6 = B_9D34;
	far_d936c(STR_467F, &v6, 2, 1, 99, 0);
	far_d6668(v6, -1, &v23);
	far_d90a6(0x4309, &v23, 16);
	far_d88b2(25);
	far_d936c(STR_4687, &B_5320, 2, 1, 31, 8);
	far_d916d(0x4316, &B_5321, 0xf7f, 2);
	far_d8827(2, 0);
	far_d885c(STR_4694);
	far_d8827(3, 0);
	far_d885c(0x433a);
	far_d885c(STR_46DF);
	far_d885c(STR_4708);
	far_d8827(7, 0);
	far_d885c(STR_4728);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
		switch (B_A61D) {
		case 0:
			far_d6668(v6, -1, &v23);
			far_da14f(1);
			break;
		}
	}
	switch (v2) {
	case 120:
		B_A069 = 0;
		far_ee201(11, B_A069);
		far_d55e8(&B_981C);
		far_d55e8(&B_94A6);
		far_e9d7e(v6);
		v42 = W_52B6;
		v47 = B_5322;
		v44 = W_52B8;
		v46 = W_52BA;
		W_52B6 = 1;
		B_5322 = 0;
		W_52B8 = 1;
		far_d5bcd(v6);
		W_52B6 = v42;
		B_5322 = v47;
		W_52B8 = v44;
		W_52BA = v46;
		far_d6668(0, -1, &v40);
		if (strcmp(&v23, &v40) != 0)
			far_d700c(B_9D34, -1, &v23);
		v4 = 1;
		do {
			TBL_954C[v4] = 2;
			TBL_95B0[v4] = v4 - 1;
			v4++;
		} while (v4 <= 16);
		if (B_501C >= 0)
			TBL_954D[B_501C] = 6;
		B_4C32 = 0;
		v2 = far_e65ab();
		break;
	}
	return v2;
}
