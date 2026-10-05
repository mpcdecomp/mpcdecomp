/* differs: +c bne $5 | jnz br_eeb6c */
extern char B_5504;
extern char B_A61E;
extern char TBL_4B15[];
extern char *W_A61A;
extern unsigned char *W_A650;
extern int W_BE92;
extern int W_BE94;

far_eeb33(a0)
char a0;
{
	int v2;
	int v4;
	int v6;
	int v8;
	register int r1;

	if (a0 == 0) {
		W_BE92 = *(int *)(W_A61A + 7);
		W_BE94 = 0;
		for (; ; ) {
			r1 = W_BE94;
			if (*(int *)(W_BE92 + (r1 << 1)) == 0)
				break;
			++W_BE94;
		}
		return 0;
	}
	v2 = 0;
	v6 = B_A61E & 15;
	if (v6 == 6)
		v4 = 1 << W_A61A[9];
	if ((TBL_4B15[a0] & 4) != 0)
		return 0;
	switch (a0) {
	case 46:
		break;
	case 43:
		if (v6 == 6) {
			*W_A650 |= v4;
			v8 = 1;
		}
		else {
			++*W_A650;
			if (*W_A650 == W_BE94)
				*W_A650 = W_BE94 - 1;
			v8 = *W_A650;
		}
		r1 = v8;
		far_eea3a(*(int *)(W_BE92 + (r1 << 1)));
		B_5504 = 1;
		v2 = -0x8000;
		break;
	case 45:
		if (v6 == 6) {
			*W_A650 &= ~v4;
			v8 = 0;
		}
		else {
			--*W_A650;
			if (*W_A650 > 127)
				*W_A650 = 0;
			v8 = *W_A650;
		}
		r1 = v8;
		far_eea3a(*(int *)(W_BE92 + (r1 << 1)));
		B_5504 = 1;
		v2 = -0x8000;
		break;
	case 62:
		v2 = 0x800;
		break;
	case 60:
		v2 = 0x400;
		break;
	default:
		v2 = a0;
		break;
	}
	return v2;
}
