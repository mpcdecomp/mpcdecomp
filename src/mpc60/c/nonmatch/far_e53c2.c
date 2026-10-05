/* differs: +24 mov ax,word ptr -4[bp] | mov bx, word ptr [bp - 4] */
extern int TBL_0BC4[];

far_e53c2(a0)
{
	int v2;
	int v4;
	register int r1;

	far_d8827(5, 0);
	v2 = 0;
	v4 = 0;
	do {
		r1 = a0;
		if (*(char *)(v4 + r1) != 0) {
			if (v2 >= 8) {
				far_d8837(43);
				break;
			}
			if (v2++ % 8 != 0)
				far_d8837(32);
			else
				far_d8837(10);
			far_d885c(TBL_0BC4[v4]);
		}
		++v4;
	} while (v4 < 32);
	return;
}
