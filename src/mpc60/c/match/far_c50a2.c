extern int W_B256;

far_c50a2(a0, a1, a2)
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;

	v2 = a0 * 15 + 7;
	v10 = 0x50b;
	v8 = (a2 * 3 + 4) / 8;
	v6 = 0;
	for (; v6 < 48 - v8; ) {
		far_de424(v10, v2, 0, 3, W_B256);
		v10 += 30;
		++v6;
	}
	v6 = 0;
	for (; v6 < v8; ) {
		v4 = far_de424(v10, v2, 7, 3, W_B256);
		if (v4 == 0)
			break;
		v10 += 30;
		++v6;
	}
	return;
}
