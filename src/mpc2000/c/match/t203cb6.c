#if FW_VERSION == 150
extern unsigned char G_PAD_INDEX;

void __far __fastcall __loadds L_03D56(void)
{
	if (G_PAD_INDEX >= 0xf) goto L_03D67;
	G_PAD_INDEX++;
L_03D67:
	;
}
#else
extern unsigned char G_PAD_INDEX;
extern int W_9A4A;
int __far L_03C6C(void);

void __far __fastcall __loadds L_03D56(void)
{
	if (G_PAD_INDEX >= 0xf) goto L_03D67;
	G_PAD_INDEX++;
L_03D67:
	if (L_03C6C() > 1) goto L_03D7D;
	W_9A4A = 1 << G_PAD_INDEX;
L_03D7D:
	;
}
#endif
