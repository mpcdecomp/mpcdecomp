/* differs: 150 size 40, image 39; +27 image `retf` CL `nop`; 172 size 40, image 39; +27 image `retf` CL `nop` */
extern char G_KEEP_RETRY_FOCUS;
extern char G_NOTE_IN;
extern char G_PAD_NOTE_BASE;
void __far cmd_far_stub2(void);
void __near __pascal ui_sound_dialog_draw(char);

void __far __fastcall __loadds keep_or_retry_key_33(void)
{
	char v0;

	if (!G_KEEP_RETRY_FOCUS) goto br_0B7B3;
	v0 = G_NOTE_IN;
	if (v0 == G_PAD_NOTE_BASE) goto br_0B7B3;
	G_PAD_NOTE_BASE = v0;
	ui_sound_dialog_draw(G_KEEP_RETRY_FOCUS);
	cmd_far_stub2();
br_0B7B3:
	;
}
