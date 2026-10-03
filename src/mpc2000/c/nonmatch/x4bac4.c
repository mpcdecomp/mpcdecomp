/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_TBL_01E3C[1];
extern char C2_TBL_01E3E[1];
extern int C2_W_LOOP_CURSOR;
void __far __fastcall __loadds loop_screen_refresh(void);

void __far __fastcall __loadds loop_screen_open(void)
{
	if (!(*(int *)(C2_TBL_01E3E + C2_W_LOOP_CURSOR * 42) | *(int *)(C2_TBL_01E3C + C2_W_LOOP_CURSOR * 42))) goto br_4BAE7;
	loop_screen_refresh();
	((int (__far *)(void))*(long *)(C2_TBL_01E3C + C2_W_LOOP_CURSOR * 42))();
br_4BAE7:
	;
}
