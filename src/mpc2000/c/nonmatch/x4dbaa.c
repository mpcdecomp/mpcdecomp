/* differs: XL v1.20 +3, 23 bytes */
extern char C2_TBL_WINKEYS_MIXER_SELECT_PGM[1];
extern long C2_W_DRUM_SELECT_HOOK_OFF;
void __far handler_set_install(char __near *);

int __far far_4DBAA(long p0)
{
	handler_set_install(C2_TBL_WINKEYS_MIXER_SELECT_PGM);
	C2_W_DRUM_SELECT_HOOK_OFF = p0;
	return (int)C2_W_DRUM_SELECT_HOOK_OFF;
}
