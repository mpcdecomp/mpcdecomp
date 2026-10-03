/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char EP_FAR_4D36C_OFF[1];
extern char EP_FAR_4D36C_SEG[1];
void __far far_4C0D8(char __near *, char __near *);

void __far L_4D5A8(void)
{
	far_4C0D8(EP_FAR_4D36C_OFF, EP_FAR_4D36C_SEG);
}
