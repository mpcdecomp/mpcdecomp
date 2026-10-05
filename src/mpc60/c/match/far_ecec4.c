extern char B_4A67;
extern char B_4A68;
extern char STR_4A63[];
extern char TBL_7C4E[];

far_ecec4()
{
	int v2;
	int v4;
	char z0[2];
	char v7;
	char v8;

	v4 = 1;
	v2 = 0;
	do {
		far_daa7d(v4, &v8, 2, 48);
		B_4A67 = v8;
		B_4A68 = v7;
		strcpy(v2 * 17 + TBL_7C4E, STR_4A63);
		++v4;
		++v2;
	} while (v2 < 20);
	return;
}
