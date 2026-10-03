/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C2_W_FE_DESC_OFF;

void __far __fastcall __loadds field_nav_right(void)
{
	char far *l4;

	l4 = *(long far *)(C2_W_FE_DESC_OFF + 30);
	if (!l4) goto br_48187;
	((int (__far *)(void))l4)();
br_48187:
	;
}
