/* differs: +19 inc word ptr W_5C2F_V112_ | mov ax, word ptr [W_5C2F_V112] */
extern int W_5C2F_V112;

far_c733d(a0)
{
	int v2;

	v2 = 0;
	do {
		if (W_5C2F_V112 > 999)
			W_5C2F_V112 = 0;
		W_5C2F_V112++;
		far_c949c(a0, W_5C2F_V112++);
		if (far_df8b4(a0) < 0)
			break;
		++v2;
	} while (v2 < 34);
	return;
}
