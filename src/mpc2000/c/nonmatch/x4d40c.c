/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char EP_FAR_4D36C_OFF[1];
extern char EP_FAR_4D36C_SEG[1];
void __far far_55112(char __near *, char __near *);
void __far __fastcall __loadds zone_screen_refresh(void);

void __far __fastcall __loadds L_4D40C(void)
{
	zone_screen_refresh();
	far_55112(EP_FAR_4D36C_OFF, EP_FAR_4D36C_SEG);
}
