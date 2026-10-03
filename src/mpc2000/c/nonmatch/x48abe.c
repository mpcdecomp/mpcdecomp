/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_B_08FCA;

void __far __fastcall __loadds sample_record_stop(void)
{
	C2_B_08FCA = 1;
}
