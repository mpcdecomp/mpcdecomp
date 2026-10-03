/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char EP_PGM_ASSIGN_SCREEN_DRAW_OFF[1];
extern char EP_PGM_ASSIGN_SCREEN_DRAW_SEG[1];
void __far far_4DBAA(char __near *, char __near *);
void __far __fastcall __loadds pgm_assign_refresh(void);

void __far __fastcall __loadds far_4E092(void)
{
	pgm_assign_refresh();
	far_4DBAA(EP_PGM_ASSIGN_SCREEN_DRAW_OFF, EP_PGM_ASSIGN_SCREEN_DRAW_SEG);
}
