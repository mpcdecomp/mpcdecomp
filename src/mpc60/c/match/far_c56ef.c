extern int W_B256;

far_c56ef(a0)
{
	int v2;
	int v4;
	int v6;

	v2 = a0 * 15 + 3;
	v6 = 0x493;
	v4 = 0;
	do {
		far_de424(v6, v2, 0, 5, W_B256);
		v6 += 30;
		++v4;
	} while (v4 < 3);
	return;
}
