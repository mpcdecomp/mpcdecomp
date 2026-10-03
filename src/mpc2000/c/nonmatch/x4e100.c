/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_TBL_02CB4[1];
extern char C2_TBL_02CB6[1];
extern int C2_W_PGM_ASSIGN_CURSOR;
void __far __fastcall __loadds pgm_assign_refresh(void);

void __far __fastcall __loadds pgm_assign_open_window(void)
{
	if (!(*(int *)(C2_TBL_02CB6 + C2_W_PGM_ASSIGN_CURSOR * 42) | *(int *)(C2_TBL_02CB4 + C2_W_PGM_ASSIGN_CURSOR * 42))) goto br_4E123;
	pgm_assign_refresh();
	((int (__far *)(void))*(long *)(C2_TBL_02CB4 + C2_W_PGM_ASSIGN_CURSOR * 42))();
br_4E123:
	;
}
