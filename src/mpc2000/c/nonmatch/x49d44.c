/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern long C0_W_0D7C2;
extern int C0_W_0D7C4;
void __far sound_list_unlink(long);

void __far __fastcall __loadds keep_or_retry_refresh(void)
{
	sound_list_unlink(C0_W_0D7C2);
}
