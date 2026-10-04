/* MPC2000 SYS text2: waveform zoom and the start/end fine-edit screens. */

extern int G_WAVE_ZOOM;

void __fastcall __loadds wave_zoom_double(void)
{
	if (G_WAVE_ZOOM < 0x40)
		G_WAVE_ZOOM <<= 1;
}

void __fastcall __loadds wave_zoom_halve(void)
{
	if ((G_WAVE_ZOOM /= 2) == 0)
		G_WAVE_ZOOM = 1;
}

struct snd {
	char pad[0x14];
	long time;		/* start */
	long pos;		/* end */
};

extern struct snd far *SND_CURRENT;
extern char DL_START_FINE[1], DL_END_FINE[1];
extern char TRIM_LEN_FIX;
extern char TBL_LOOP_LEN_MODE_LABELS[2][5];

typedef void (__fastcall __far *key_fn)(void);

void __pascal disp_list_run(char far *list);
void __pascal cmd_write_caller(long v);
void __pascal display_draw_coord(long v, int x, int y);
void __far __pascal cmd_dispatch_1E(int, char, char __far *);
void __pascal mode_dispatch_index(int x, int y);
void field_redraw(void);
void __pascal install_handler(int key, key_fn f);
void edit_range_select(void);

/* the fine-edit screens draw the moved point, then the length */
void __fastcall __loadds L_09210(void)
{
	disp_list_run(DL_START_FINE);
	cmd_write_caller(SND_CURRENT->time);
	display_draw_coord(SND_CURRENT->time, 0xb5, 0xc);
	display_draw_coord(SND_CURRENT->pos - SND_CURRENT->time, 0xb5, 0x15);
	cmd_dispatch_1E(0xcd, 0x1f, TBL_LOOP_LEN_MODE_LABELS[TRIM_LEN_FIX]);
	mode_dispatch_index(0xb5, 0x28);
	field_redraw();
}

void __fastcall __loadds L_09292(void)
{
	install_handler(0x32, L_09210);
}

void __fastcall __loadds X_092A8(void)
{
	install_handler(0x32, L_09292);
	edit_range_select();
}

void __fastcall __loadds L_092C2(void)
{
	disp_list_run(DL_END_FINE);
	cmd_write_caller(SND_CURRENT->pos);
	display_draw_coord(SND_CURRENT->pos, 0xb5, 0xc);
	display_draw_coord(SND_CURRENT->pos - SND_CURRENT->time, 0xb5, 0x15);
	cmd_dispatch_1E(0xcd, 0x1f, TBL_LOOP_LEN_MODE_LABELS[TRIM_LEN_FIX]);
	mode_dispatch_index(0xb5, 0x28);
	field_redraw();
}

void __fastcall __loadds L_09344(void)
{
	install_handler(0x32, L_092C2);
}

void __fastcall __loadds X_0935A(void)
{
	install_handler(0x32, L_09344);
	edit_range_select();
}
