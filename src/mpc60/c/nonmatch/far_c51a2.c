/* differs: +11 jmp $8 | jmp br_c5228 */
extern int TBL_0BC4[];
extern int W_B256;

far_c51a2(a0)
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;
	int v12;
	int v14;

	v2 = 0;
	v8 = 0;
	for (; v2 < 16; ) {
		v14 = 0x517;
		v12 = TBL_0BC4[v2 + a0];
		v4 = 0;
		do {
			v10 = far_c5846(*(char *)v12++);
			v6 = 0;
			do {
				v10++;
				far_de424(v14, v8, *(char *)v10++, 5, W_B256);
				v14 += 30;
				++v6;
			} while (v6 < 9);
			v14 += 120;
			++v4;
		} while (v4 < 4);
		++v2;
		v8 += 15;
	}
	return;
}
