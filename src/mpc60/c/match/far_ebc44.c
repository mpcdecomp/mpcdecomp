extern char B_8D64;
extern char B_94A6;
extern char B_981C;
extern long W_8D5A;
extern long W_94B4;
extern long W_94BC;
extern long W_94C8;
extern int W_94D6;
extern int W_94E0;
extern int W_94E4;
extern int W_A059;
long far_d6216();

far_ebc44()
{
	int v2;
	int v4;
	int v6;
	char v7;

	far_d55e8(&B_981C);
	far_d55e8(&B_94A6);
	if ((v4 = far_f0ace(B_8D64, 0)) != 0)
		return v4;
	far_ed328(&B_94A6, 4, 4);
	v2 = (W_8D5A + 383L) / 384L;
	if ((long)((v2 << 3) + 0x5dc) > far_d6216())
		return -3;
	W_A059 = W_94E0 = 0;
	B_94A6 = W_A059;
	W_94D6 = v2;
	W_94C8 = 0L;
	v6 = 1;
	for (; v6 <= v2; ) {
		far_e7daf(1, v6);
		W_94C8 += (long)W_94E4;
		W_A059 = W_94E4;
		far_03ec1(1);
		++v6;
	}
	v7 = -1;
	far_05303(1, &v7, 1);
	W_94B4 = W_94BC;
	return 0;
}
