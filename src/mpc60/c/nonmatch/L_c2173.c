/* differs: +41 cmp word ptr -2[bp],0 | cmp dx, 0 */
L_c2173(a0, a2, a3)
long a0;
int *a2;
int *a3;
{
	long v4;
	int v6;
	int v8;

	v6 = a0 / 0x1000L;
	if (*a2 > v6)
		*a2 = v6;
	v4 = a0 / (long)*a2;
	if (v4 > 0xea95L)
		v4 = 0xea95L;
	*a2 = a0 / v4;
	*a3 = 0;
	if (a0 - (long)*a2 * v4 > 0x1000L)
		*a3 = 1;
	if (*a2 >= 26)
		*a2 = 26;
	far_d8827(1, 33);
	far_d8837(*a2 + *a3 + 64);
	far_d8827(2, 24);
	v8 = (v4 / 2L + 500L) / 0x3e8L;
	far_d88e6(0x1b64, v8);
	return v4;
}
