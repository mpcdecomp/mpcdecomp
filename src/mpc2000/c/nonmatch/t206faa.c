/* differs: 150 size 62, image 60; +0 image `mov al, byte ptr [0x8aa0]` CL `enter 2, 0`; 172 size 62, image 60; +0 image `mov al, byte ptr [0x8ce0]` CL `enter 2, 0` */
extern char G_EDIT_FIELD_VAL[1];
extern char G_PAD_NOTE_BASE;
void __far timer_poll_wait_5(void);
char far * __far __pascal note_range_clamp(int);
void __far __pascal voice_trigger_full(char far *, int, char, char, int, void (far *)(void));

void __far X_07388(void)
{
	char l1;
	char l2;

	G_EDIT_FIELD_VAL[0] = (char)(note_range_clamp(G_PAD_NOTE_BASE)[3] & 0x80 ? 1 : 0);
	voice_trigger_full(G_EDIT_FIELD_VAL, 1, l1, l2, 4, timer_poll_wait_5);
}
