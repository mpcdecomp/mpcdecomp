/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
void __far __fastcall __loadds far_4D36C(void);
void __far voices_release_all(void);

void __far __fastcall __loadds zone_start_fine_open(void)
{
	voices_release_all();
	far_4D36C();
}
