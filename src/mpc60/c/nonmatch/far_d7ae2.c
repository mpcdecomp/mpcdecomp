/* differs: +94 mov al,byte ptr -15[bp] | mov dx, word ptr [bp - 0dh] */
extern char B_5064_V112;
extern char B_5759_V112;

long far_d7ae2(a0)
{
	char *v2;
	unsigned char v3;
	unsigned char v4;
	char z0[2];
	unsigned char v7;
	int v9;
	int v11;
	int v13;
	char z1;
	char v15;

	if (B_5759_V112 == 0 && B_5064_V112 == 0) {
		far_031ea(1, &v7, 5);
		if (v7 == 168)
			L_de80e(v4, v3);
		else
			L_de80e(4, 4);
		return 0;
	}
	v11 = 256;
	v9 = a0;
	v2 = far_d4153(v11, v9, &v15);
	L_de80e(*v2, v2[1]);
	return v15;
}
