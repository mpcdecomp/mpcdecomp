/* differs: 172 matches */
extern char PAD_INPUT_MODE;
extern char TBL_WINKEYS_PURGE[1];
void __far __fastcall __loadds note_release_latched(void);
void __far __pascal win_keys_merge(char far *);

void __far __fastcall __loadds L_06206(void)
{
	note_release_latched();
	PAD_INPUT_MODE = 2;
	win_keys_merge(TBL_WINKEYS_PURGE);
}
