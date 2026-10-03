/* differs: XL v1.20 +A, 2 bytes */
void __far __fastcall __loadds far_4EF20(void);
void __far __fastcall __loadds pgm_midi_refresh(void);

void __far far_4EDD2(void)
{
	pgm_midi_refresh();
	far_4EF20();
}
