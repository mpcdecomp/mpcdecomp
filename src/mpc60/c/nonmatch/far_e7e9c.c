/* differs: +10 jmp $5 | jmp L_d3e0e */
extern char B_7E65;
extern char B_7E66;
extern char B_7E67;
extern char B_7E68;
extern char B_7E69;
extern char B_7E6A;
extern char B_7E6B;
extern char B_88DA_V112;
extern char B_8E70_V112;
extern char B_8FC9_V112;
extern char TBL_8C49[];
extern char TBL_8DF0_V112[];

far_e7e9c(a0, a1)
unsigned char *a0;
{
	char z0[2];
	int v4;
	char v5;
	char v6;
	char v7;
	char v8;
	register int r1;
	register char *r2;

	switch (*a0) {
	case 144:
		if (B_88DA_V112 == 0)
			far_f173a(a0);
		r1 = a0[2];
		if (TBL_8C49[r1] != 0) {
			v8 = -128;
			v7 = a0[1];
			v6 = r1;
			v5 = 64;
			far_e7e29(&v8, 4);
			TBL_8DF0_V112[r1] = -1;
		}
		else {
			TBL_8C49[r1] = 1;
			++B_8FC9_V112;
		}
		break;
	case 128:
		r1 = a0[2];
		if (B_8E70_V112 != 0) {
			TBL_8DF0_V112[r1] = a0[3];
			return;
		}
		TBL_8C49[r1] = 0;
		--B_8FC9_V112;
		break;
	case 208:
		B_7E65 = a0[2];
		break;
	case 224:
		B_7E66 = *(int *)(a0 + 2) != 0x4000;
		break;
	case 176:
		switch (a0[2]) {
		case 64:
			if (a0[3] != 0)
				B_8E70_V112 = 1;
			else if (B_8E70_V112 != 0) {
				B_8E70_V112 = 0;
				*a0 = 128;
				v4 = 0;
				do {
					if (TBL_8DF0_V112[v4] != -1) {
						r2 = a0;
						r2[2] = v4;
						r2 = a0;
						r2[3] = TBL_8DF0_V112[v4];
						far_e7e29(a0, a1);
						TBL_8DF0_V112[v4] = -1;
						TBL_8C49[v4] = 0;
						--B_8FC9_V112;
					}
					v4++;
				} while (v4 < 128);
			}
			return;
		case 1:
			B_7E67 = a0[3];
			break;
		case 2:
			B_7E68 = a0[3];
			break;
		case 4:
			B_7E69 = a0[3];
			break;
		case 7:
			B_7E6A = 1;
			break;
		case 11:
			B_7E6B = 1;
			break;
		}
		break;
	}
	far_e7e29(a0, a1);
}
