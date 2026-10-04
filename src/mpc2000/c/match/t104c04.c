extern char TBL_WINKEYS_FX_MIXER[1];
void __far L_053BA(void);
void __far __pascal install_handler(int, char far *);
void __near midi_status_read(void);
void __near __pascal ui_screen_enter(char far *, void (far *)(void), long);

void __far __pascal audio_dispatch_table(char far *p0)
{
	ui_screen_enter(TBL_WINKEYS_FX_MIXER, L_053BA, 0L);
	if (!p0) goto br_04BB3;
	install_handler(5, p0);
	install_handler(0x15, p0);
br_04BB3:
	midi_status_read();
}
