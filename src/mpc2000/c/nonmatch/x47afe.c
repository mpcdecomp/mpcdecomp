/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
void __far __fastcall __loadds change_disk_refresh(void);
void __far far_3E99C(void);

void __far __fastcall __loadds change_disk_f4(void)
{
	change_disk_refresh();
	far_3E99C();
}
