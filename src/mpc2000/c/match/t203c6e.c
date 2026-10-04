#if FW_VERSION == 150
extern char B_980A_V150;
#else
extern unsigned W_9A4A;
#endif
extern unsigned char G_PAD_BANK;
extern unsigned char G_PAD_INDEX;

void __far __pascal mpc_port_C1_5E(char far *p0)
{
#if FW_VERSION == 150
	int si_;

	if (!p0) goto L_03D4F;
	if (!B_980A_V150) {
		((int (__far __pascal *)(int))p0)((G_PAD_BANK << 4) + G_PAD_INDEX);
		return;
	}
	si_ = 0;
L_1179C:
	((int (__far __pascal *)(int))p0)((G_PAD_BANK << 4) + si_);
	si_++;
	if (si_ < 0x10) goto L_1179C;
L_03D4F:
	;
#else
	unsigned m; int i;

	if (p0)
		for (m = 1, i = 0; m; m += m, i++)
			if (W_9A4A & m)
				((int (__far __pascal *)(int))p0)((G_PAD_BANK << 4) + i);
#endif
}
