/* differs: +48 mov byte ptr 9 [bx],84 | mov bx, word ptr [bp + 6] */
extern int W_BEE2_V112;
extern int W_BEE4_V112;
extern int W_BEE6_V112;
extern int W_BEE8_V112;
extern int W_BEEA_V112;

L_e008b(a0)
char *a0;
{
	int v2;
	int v4;
	char z0[18];
	char v23;

	far_d7b8c(0);
	v4 = far_d7b8c(9, 0x3ea0, &v23);
	if (v4 == 0)
		return -0x800;
	if (v4 != -768)
		return v4;
	a0[8] = 83;
	a0[9] = 84;
	a0[10] = 50;
	if ((W_BEE2_V112 = far_d7b8c(1, a0)) < 0)
		return;
	v2 = 6;
	if ((v4 = far_d7b8c(5, &v2, W_BEE2_V112, 2)) != 0)
		return;
	if ((v4 = far_d7b8c(5, -0x4118, W_BEE2_V112, 3)) != 0)
		return;
	if ((v4 = far_d7b8c(5, -0x411c, W_BEE2_V112, 3)) != 0)
		return;
	if ((v4 = far_d7b8c(5, -0x4114, W_BEE2_V112, 1)) != 0)
		return;
	v2 = 0xbf7;
	setmem(-0x6fc1, v2, 0);
	if ((v4 = far_d7b8c(5, -0x6fc1, W_BEE2_V112, v2)) != 0)
		return;
	if ((v4 = far_dc012(W_BEE2_V112, W_BEE4_V112, W_BEE6_V112, W_BEE8_V112, W_BEEA_V112)) != 0)
		return;
	far_d7b8c(3, 0, W_BEE2_V112);
}
