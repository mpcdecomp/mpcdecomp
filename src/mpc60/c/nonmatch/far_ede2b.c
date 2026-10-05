/* differs: +2b mov ax, word ptr W_52CE_V112_ | mov dx, word ptr [W_52CE_V112] */
extern char B_4CBE_V112;
extern char B_52B5_V112;
extern char B_8FCB_V112;
extern unsigned char B_903F_V112;
extern unsigned char B_9041_V112;
extern char TBL_50CA_V112[];
extern unsigned char TBL_8E66;
extern long W_52CC_V112;
extern int W_52CE_V112;

far_ede2b(a0, a1, a2, a3)
{
	int v2;
	int v4;
	long v8;
	int v10;

	if (B_52B5_V112 < 0)
		return;
	if (a1 != 0 && (TBL_50CA_V112[a1] & 4) != 0)
		return;
	if (a0 == 0)
		return;
	v2 = W_52CE_V112;
	v4 = W_52CC_V112;
	far_d6a82(B_4CBE_V112, 0);
	L_e535c(a2);
	++B_8FCB_V112;
	while (a2 <= a3) {
		v8 = (long)far_03012(1, -0x6fc1, 0x1401);
		switch (B_903F_V112 & 248) {
		case 152:
			if (TBL_8E66 == a1 || a1 == 0) {
				if ((TBL_50CA_V112[TBL_8E66] & 4) != 0)
					break;
				v10 = B_9041_V112 + a0;
				if (v10 > 127)
					v10 = 127;
				if (v10 < 0)
					v10 = 0;
				B_9041_V112 = v10;
			}
			break;
		case 168:
		case 248:
			++a2;
			break;
		}
		far_05303(1, -0x6fc1, v8);
	}
	L_dc484(B_4CBE_V112, 1);
	--B_8FCB_V112;
	L_d97d2(v4, v2);
}
