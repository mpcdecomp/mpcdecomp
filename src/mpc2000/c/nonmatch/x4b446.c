/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
void __far __fastcall __loadds trim_screen_draw(void);
void __far voices_release_all(void);

void __far __fastcall __loadds end_fine_open(void)
{
	voices_release_all();
	trim_screen_draw();
}
