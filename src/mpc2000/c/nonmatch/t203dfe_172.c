/* differs: 172 size 38, image 132; +26 image `push ds` CL `retf` */
#if FW_VERSION == 150
extern char B_980A_V150;

void __far __fastcall __loadds L_03DFE(void)
{
	B_980A_V150 = (char)(B_980A_V150 ? 0 : 1);
}
#else
extern char G_PAD_INDEX;
extern int W_9A4A;
int __far L_03C6C(void);

void __far __fastcall __loadds L_03DFE(void)
{
	if (L_03C6C() <= 1) {
		W_9A4A = -1;
		return -1;
	}
	W_9A4A = 1 << G_PAD_INDEX;
	return W_9A4A;
}
#endif
