/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C2_W_FE_DESC_OFF;

void __far __fastcall __loadds field_nav_up(void)
{
	char far *l4;

	l4 = *(long far *)(C2_W_FE_DESC_OFF + 18);
	if (!l4) goto br_48115;
	((int (__far *)(void))l4)();
br_48115:
	;
}
