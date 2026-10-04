int cmd_far_stub2();
extern char MIDI_VOLUME_VAL;
extern char B_4FE4;

void __far __fastcall __loadds pgm_midi_key_33(void)
{
	if (B_4FE4 == MIDI_VOLUME_VAL) goto L_05F2D;
	B_4FE4 = MIDI_VOLUME_VAL;
	cmd_far_stub2();
L_05F2D:
	return;
}
