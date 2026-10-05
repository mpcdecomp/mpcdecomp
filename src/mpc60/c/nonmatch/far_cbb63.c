/* differs: +27 jmp $7 | jmp br_cbc70 */
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
extern int W_BB18;
extern int W_BB1A;
extern int W_BC1E;
extern int W_BE45;

far_cbb63(a0)
unsigned char *a0;
{
	int v2;
	char z0[4];

	if (*a0 == 255) {
		B_BCC0 = -1;
		return;
	}
	switch (far_d3ef5(a0)) {
	case 0:
		W_BB1A = -1;
		W_BB18 = -1;
		break;
	case 1:
		v2 = a0[2] & 127;
		TBL_BA98[v2] = -1;
		break;
	case 2:
		TBL_BB1C[a0[2] & 127] = -1;
		break;
	case 3:
		TBL_BB9C[a0[2] & 127] = -1;
		break;
	case 4:
		B_BC1C = -1;
		break;
	case 5:
		B_BC1D = -1;
		break;
	case 6:
		W_BC1E = -1;
		break;
	case 7:
		W_BE45 = 0;
		break;
	case 8:
		TBL_BC20[a0[7] & 31] = -1;
		break;
	case 9:
		TBL_BC40[a0[7] & 31] = -1;
		break;
	case 10:
		TBL_BC60[a0[7] & 31] = -1;
		break;
	case 11:
		TBL_BC80[a0[7] & 31] = -1;
		break;
	}
}
