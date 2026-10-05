/* differs: +34 jmp $8 | jmp br_cbb53 */
extern char B_54FB;
extern char B_8C07;
extern char B_BC1C;
extern char B_BC1D;
extern char B_BCC0;
extern char TBL_BA98[];
extern char TBL_BB1C[];
extern char TBL_BB9C[];
extern char TBL_BC20[];
extern char TBL_BC40[];
extern char TBL_BC60[];
extern int TBL_BC80[];
extern char TBL_BCC1[];
extern char TBL_BD41[];
extern char TBL_BDC1[];
extern int W_52CE_V112;
extern int W_5510;
extern long W_BB18;
extern int W_BC1E;
extern int W_BE45;

far_cb998(a0, a1)
unsigned char *a0;
{
	int v2;
	int v4;
	int v6;
	int v8;

	if (*a0 == 255) {
		B_BCC0 = 0;
		return;
	}
	if (W_52CE_V112 > 999)
		return;
	v6 = far_d3ef5(a0);
	switch (v6) {
	case 0:
		W_BB18 = *(long *)a0;
		break;
	case 1:
		v2 = a0[2] & 127;
		if (B_8C07 != 0) {
			if (v2 >= 32)
				break;
		}
		TBL_BA98[v2] = a0[3];
		TBL_BCC1[v2] = a0[4];
		TBL_BD41[v2] = a0[5];
		TBL_BDC1[v2] = a0[6];
		B_54FB = 1;
		break;
	case 2:
		TBL_BB1C[a0[2] & 127] = a0[3];
		break;
	case 3:
		TBL_BB9C[a0[2] & 127] = a0[3];
		break;
	case 4:
		B_BC1C = a0[2];
		break;
	case 5:
		B_BC1D = a0[2];
		break;
	case 6:
		W_BC1E = *(int *)(a0 + 2);
		break;
	case 7:
		v8 = W_5510;
		v4 = 0;
		for (; v4 < a1; ) {
			*(char *)v8++ = *a0++;
			++v4;
		}
		W_BE45 = a1;
		break;
	case 8:
		TBL_BC20[a0[7] & 31] = a0[8];
		break;
	case 9:
		TBL_BC40[a0[7] & 31] = a0[8];
		break;
	case 10:
		TBL_BC60[a0[7] & 31] = a0[8];
		break;
	case 11:
		TBL_BC80[a0[7] & 31] = *(int *)(a0 + 8);
		break;
	}
}
