/* differs: XL v1.20; the oracle matches it, the check cannot place it: callee frame */
extern char EP_FAR_4EC12_OFF[1];
extern char EP_FAR_4EC12_SEG[1];
void __far far_4DBAA(char __near *, char __near *);
void __far __fastcall __loadds pgm_midi_refresh(void);

void __far __fastcall __loadds pgm_midi_f3(void)
{
	pgm_midi_refresh();
	far_4DBAA(EP_FAR_4EC12_OFF, EP_FAR_4EC12_SEG);
}
