extern char B_AE2D;
extern char TBL_AE2C;
extern char TBL_AE2E[];

far_dfbe6(a0)
unsigned char *a0;
{
	char v1;
	char v2;
	char v3;
	char v4;
	int v6;

	switch (*a0) {
	case 144:
		far_0579f(a0);
		break;
	case 176:
		far_0583f(a0);
		break;
	case 240:
		if (a0[2] != 71)
			break;
		if (a0[5] != 69) {
			if (a0[5] != 70)
				break;
		}
		v1 = a0[7] & 31;
		switch (a0[6]) {
		case 1:
			v2 = a0[8];
			if (v1 != 0)
				far_ef727(TBL_AE2E[v1], v2, -1);
			else {
				far_ef727(TBL_AE2C, v2, -1);
				far_ef727(B_AE2D, v2, -1);
				far_ef727(TBL_AE2E[0], v2, -1);
			}
			far_f0225(v1, 1, v2);
			break;
		case 2:
			v3 = a0[8];
			if (v1 != 0)
				far_ef727(TBL_AE2E[v1], -1, v3);
			else {
				far_ef727(TBL_AE2C, -1, v3);
				far_ef727(B_AE2D, -1, v3);
				far_ef727(TBL_AE2E[0], -1, v3);
			}
			far_f0225(v1, 2, v3);
			break;
		case 3:
			v4 = a0[8];
			if (v1 != 0)
				far_dfe95(TBL_AE2E[v1], v4);
			else {
				far_dfe95(TBL_AE2C, v4);
				far_dfe95(B_AE2D, v4);
				far_dfe95(TBL_AE2E[0], v4);
			}
			far_f0225(v1, 3, v4);
			break;
		case 4:
			v6 = (far_da912(*(int *)(a0 + 8)) + -0x2000) / 20;
			if (v6 < -120)
				v6 = -120;
			if (v6 > 60)
				v6 = 60;
			if (v1 != 0)
				far_dfec3(TBL_AE2E[v1], v6);
			else {
				far_dfec3(TBL_AE2C, v6);
				far_dfec3(B_AE2D, v6);
				far_dfec3(TBL_AE2E[0], v6);
			}
			far_f0225(v1, 4, v6);
			break;
		}
		break;
	}
	return;
}
