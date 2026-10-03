/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char EP_TRIM_SCREEN_DRAW_OFF[1];
extern char EP_TRIM_SCREEN_DRAW_SEG[1];
void __far far_55112(char __near *, char __near *);
void __far __fastcall __loadds trim_screen_refresh(void);

void __far __fastcall __loadds far_4A006(void)
{
	trim_screen_refresh();
	far_55112(EP_TRIM_SCREEN_DRAW_OFF, EP_TRIM_SCREEN_DRAW_SEG);
}
