/* MPC2000 SYS text2: mixer channel-settings cursor keys and page switch. */

extern char B_8D43, B_8D42;
extern unsigned char G_PAD_INDEX, G_PAD_BANK;
extern char G_PAD_NOTE_BASE;
extern char far *PTR_TRACK_DATA;

void timer_str_handler(void);
unsigned char pad_bank_get(void);
void __far __fastcall __loadds mixer_stereo_page(void);
void __far __fastcall __loadds mixer_fxsend_page(void);
void __far __fastcall __loadds mixer_indiv_page(void);

void __fastcall __loadds channel_settings_up(void)
{
	switch (B_8D43) {
	case 0:
		return;
	case 2:
	case 4:
	case 6:
		B_8D43--;
		break;
	default:
		B_8D43 = 0;
	}
	timer_str_handler();
}

void __fastcall __loadds channel_settings_down(void)
{
	switch (B_8D43) {
	case 2:
	case 4:
	case 6:
	case 7:
		break;
	default:
		B_8D43++;
		timer_str_handler();
	}
}

void __fastcall __loadds channel_settings_left(void)
{
	switch (B_8D43) {
	case 3:
	case 4:
	case 5:
	case 6:
		B_8D43--;
	case 7:
		B_8D43--;
		timer_str_handler();
	}
}

void __fastcall __loadds channel_settings_right(void)
{
	switch (B_8D43) {
	case 1:
	case 2:
	case 3:
	case 4:
	case 5:
		B_8D43++;
	case 6:
		B_8D43++;
		timer_str_handler();
	}
}

/* key: pad number in the low byte, pad index in the high */
void __fastcall __loadds pad_note_select_5(unsigned key)
{
	char n;

	if ((char)key) {
		G_PAD_INDEX = key >> 8;
		G_PAD_BANK = pad_bank_get();
		n = PTR_TRACK_DATA[G_PAD_BANK * 16 + G_PAD_INDEX];
		if ((unsigned)(n - 0x23) <= 0x3f) {
			G_PAD_NOTE_BASE = n;
			timer_str_handler();
		}
	}
}

void __fastcall __loadds channel_settings_close(void)
{
	switch (B_8D42) {
	case 3:
	case 4:
		mixer_fxsend_page();
		break;
	case 5:
	case 6:
		mixer_indiv_page();
		break;
	default:
		mixer_stereo_page();
	}
}
