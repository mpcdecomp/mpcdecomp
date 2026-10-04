#if FW_VERSION == 150
extern char B_980B_V150;
extern char far *W_64D2;
extern int W_64D4;

void __far __fastcall __loadds L_03F68(void)
{
	if (!W_64D2) goto L_03F82;
	((int (__far __pascal *)(int))W_64D2)(B_980B_V150);
L_03F82:
	;
}
#else
extern char B_9A4C;
extern char far *W_64D2;
extern int W_64D4;

void __far __fastcall __loadds L_03F68(void)
{
	if (!W_64D2) goto L_03F82;
	((int (__far __pascal *)(int))W_64D2)(B_9A4C & 1);
L_03F82:
	;
}
#endif
