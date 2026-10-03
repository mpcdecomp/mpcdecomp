/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern int C2_W_08B20;
extern char EP_FAR_483FC_OFF[1];
extern char EP_FAR_483FC_SEG[1];
extern long FE_VALUE;
void __far far_3EE00(long, char __near *, char __near *);

void __far __fastcall __loadds L_47A80(void)
{
	far_3EE00(FE_VALUE, EP_FAR_483FC_OFF, EP_FAR_483FC_SEG);
}
