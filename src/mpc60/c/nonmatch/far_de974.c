/* differs: +4f sub ah,ah | cbw */
extern int W_8CD1;

far_de974(a0, a1)
unsigned char *a0;
{
	char z0[3];
	char v4;

	far_daa7d(*(int *)(a0 + 2) + W_8CD1, &v4, 3, 48);
	far_d885c(&v4);
	far_d8837(46);
	far_daa7d(a0[1], &v4, 2, 48);
	far_d885c(&v4);
	far_d8837(46);
	if (a1 != 0)
		far_d885c(0x3ef5);
	else {
		far_daa7d(*a0, &v4, 2, 48);
		far_d885c(&v4);
	}
	return;
}
