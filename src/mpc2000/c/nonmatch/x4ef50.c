/* differs: XL v1.20; the oracle matches it, the check cannot place it: callee frame */
extern char EP_FAR_4EF20_OFF[1];
extern char EP_FAR_4EF20_SEG[1];
void __far far_4DBAA(char __near *, char __near *);

void __far __fastcall __loadds purge_f4(void)
{
	far_4DBAA(EP_FAR_4EF20_OFF, EP_FAR_4EF20_SEG);
}
