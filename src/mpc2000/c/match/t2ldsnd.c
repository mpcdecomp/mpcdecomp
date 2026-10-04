/* MPC2000 SYS text2: the LOAD SOUND window. */

typedef void (far *fn)(void);

extern char G_MPC60_PAD_SEL, B_56C0;
extern signed char TBL_MPC60_PAD_SND[1];
extern char TBL_MPC60_SND_HDR[1][0x3b];
extern char DL_LOADING[1];
extern fn W_56A6;

void __far __pascal voice_trigger_full();
void __pascal disp_list_run(char far *list);
int __pascal sample_load_entry(char far * far *snd, int i);
void __pascal ui_enter_pad_assign(char far *snd);
void __far __pascal install_handler(int, void (__far *)(void));
void __pascal int43_wrapper(int n);
void X_0C236(void);

void __fastcall __loadds load_sound_up(void)
{
	voice_trigger_full(&G_MPC60_PAD_SEL, 0x21, 0x7d, 0x14, 0x0a, 0, 0);
}

void __fastcall __loadds load_sound_down(void)
{
	voice_trigger_full(&G_MPC60_PAD_SEL, 0x21, 0x7d, 0x24, 0x11, 0, 0);
}

void __fastcall __loadds load_sound_refresh(void)
{
}

void __fastcall __loadds smem_read_handler(void)
{
	char far *snd;
	int i;

	disp_list_run(DL_LOADING);
	B_56C0 = 1;
	i = TBL_MPC60_PAD_SND[G_MPC60_PAD_SEL];
	if (i == -1 || TBL_MPC60_SND_HDR[i][0] == 0)
		return;
	switch (sample_load_entry(&snd, i)) {
	default:
		ui_enter_pad_assign(snd);
		install_handler(5, W_56A6);
		return;
	case 0:
		int43_wrapper(5);
		return;
	case 1:
		load_sound_refresh();
		X_0C236();
	}
}
