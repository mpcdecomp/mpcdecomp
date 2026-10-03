/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_B_PAD_DRUM;
extern char far *C2_W_DRUM_SELECT_HOOK_OFF;

void __far __fastcall __loadds mixer_select_pgm_drum_3(void)
{
	C2_B_PAD_DRUM = 2;
	((int (__far *)(void))C2_W_DRUM_SELECT_HOOK_OFF)();
}
