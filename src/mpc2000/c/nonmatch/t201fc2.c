/* differs: 150 size 104, image 102; +17 image `ja +61` CL `ja +63`; 172 size 104, image 102; +17 image `ja +61` CL `ja +63` */
extern char G_NOTE_CAPTURE;
extern char G_NOTE_IN;
extern char G_VELOCITY_IN;
extern char MIDI_LOCAL_MODE;
extern char PAD_INPUT_MODE;
void __far __pascal pad_note_trigger(char far *);

void __far __pascal pad_event_dispatch(char far *p0)
{
	if ((unsigned)((unsigned char)p0[1] - 0x23) > 0x3f) goto T2_br_020A9;
	if (p0[3]) goto br_02094;
	if (!G_NOTE_CAPTURE) goto br_0207C;
	G_NOTE_IN = p0[1];
	G_VELOCITY_IN = p0[2];
br_0207C:
	if (PAD_INPUT_MODE == 1) goto br_020A2;
	if (PAD_INPUT_MODE != 2) goto T2_br_020A9;
	if (!MIDI_LOCAL_MODE) goto T2_br_020A9;
	goto br_020A2;
br_02094:
	G_NOTE_IN = p0[1];
	G_VELOCITY_IN = p0[2];
br_020A2:
	pad_note_trigger(p0);
T2_br_020A9:
	;
}
