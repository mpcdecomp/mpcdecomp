extern char B_A61F;
extern char TBL_4B15[];
extern int W_A650;

far_eec91(a0)
char a0;
{
	int v2;
	unsigned char *v4;
	char z0[21];
	char v26;

	v2 = 0;
	if ((TBL_4B15[a0] & 4) != 0)
		return 0;
	B_A61F = 21;
	v4 = W_A650;
	switch (a0) {
	case 46:
		break;
	case 43:
		++*v4;
		if (*v4 >= 137)
			*v4 = 136;
		far_e9e6d(*v4, &v26);
		far_eea3a(&v26);
		v2 = -0x8000;
		break;
	case 45:
		--*v4;
		if (*v4 >= 137)
			*v4 = 0;
		far_e9e6d(*v4, &v26);
		far_eea3a(&v26);
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
