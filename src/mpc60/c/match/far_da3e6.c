extern char B_A61F;
extern char TBL_4B15[];
extern int W_A650;

far_da3e6(a0)
char a0;
{
	int v2;
	unsigned char *v4;

	v2 = 0;
	if ((TBL_4B15[a0] & 4) != 0)
		return 0;
	v4 = W_A650;
	B_A61F = 4;
	switch (a0) {
	case 46:
		break;
	case 43:
		++*v4;
		if (*v4 >= 128)
			*v4 = 127;
		far_eea3a(far_da4bd(*v4));
		v2 = -0x8000;
		break;
	case 45:
		--*v4;
		if (*v4 >= 128)
			*v4 = 0;
		far_eea3a(far_da4bd(*v4));
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
