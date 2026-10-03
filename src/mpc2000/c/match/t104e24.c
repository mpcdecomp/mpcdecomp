extern char TBL_WINKEYS_FX_MIXER_LR[1];
void __far L_054E4(void);
void __near fx_mixer_arm_field(void);
void __far __pascal install_handler(int, char far *);
void __near __pascal ui_screen_enter(char far *, void (far *)(void), long);

void __far __pascal ui_screen_enter_edit(char far *p0)
{
	ui_screen_enter(TBL_WINKEYS_FX_MIXER_LR, L_054E4, 0L);
	if (!p0) goto br_04DD9;
	install_handler(5, p0);
	install_handler(0x15, p0);
br_04DD9:
	fx_mixer_arm_field();
}
