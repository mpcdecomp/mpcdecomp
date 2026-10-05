extern int TBL_A6D6_V112;
extern int TBL_A6D8_V112;

L_c57bd()
{
	int v2;

	setmem(-0x4d38, 0x800, 0);
	TBL_A6D8_V112 = 0;
	TBL_A6D6_V112 = 0;
	v2 = 0;
	do {
		far_e01a3(0, -0x4d38, 0x400);
		++v2;
	} while (v2 < 512);
	return;
}
