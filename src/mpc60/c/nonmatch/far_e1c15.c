/* differs: +94 beq $8 | jmp near br_e1d79 */
extern int TBL_4CC6_V112[];
extern char TBL_4CC8_V112[];
extern char TBL_4CC9_V112[];
extern int W_94D6;

far_e1c15(a0)
{
	int v2;
	int v4;
	int v6;
	int v8;

	v4 = 3;
	v6 = 0;
	v8 = 0;
	v2 = a0 * 6;
	far_d8827(3, 0);
	far_d8894(32, 120);
	far_d7268();
	far_d8827(3, 0);
	if (TBL_4CC6_V112[0] == -1) {
		far_d885c(0x233e);
		return L_dcb15(40);
	}
	L_dcb15(40);
	while (TBL_4CC6_V112[v2 * 2] != -1) {
		if (v8 == 6)
			break;
		switch (v6) {
		case 0:
			far_d8827(v4, 0);
			++v6;
			break;
		case 1:
			far_d8827(v4, 20);
			++v6;
			break;
		case 2:
			++v4;
			v6 -= 2;
			continue;
		}
		if (TBL_4CC6_V112[(v2 + 1) * 2] == -1)
			far_d88e6(0x234d, TBL_4CC6_V112[v2 * 2], W_94D6 + 1, TBL_4CC8_V112[v2 << 2], TBL_4CC9_V112[v2 << 2]);
		else
			far_d88e6(0x2361, TBL_4CC6_V112[v2 * 2], TBL_4CC6_V112[(v2 + 1) * 2], TBL_4CC8_V112[v2 << 2], TBL_4CC9_V112[v2 << 2]);
		++v2;
		++v8;
	}
	return v8;
}
