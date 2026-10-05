far_c5047(a0, a1, a2)
{
	int v2;

	if (a0 != 0) {
		v2 = 0;
		do {
			far_c5144(a1, v2);
			++v2;
		} while (v2 < 16);
	}
	else {
		v2 = 0;
		do {
			if (v2 != a2)
				far_c56ef(v2);
			++v2;
		} while (v2 < 16);
	}
	far_c5144(a1, a2);
	return;
}
