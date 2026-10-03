/* MPC2000 SYS text2: the trim screen's DISCARD window. */

extern char far *SND_CURRENT;
extern char far *PTR_DL_PROCESSING;
extern char P_358B[1], DL_DISCARD[1], TBL_WINKEYS_DISCARD[1];

void __pascal voice_release_all_if(char far *snd);
void __pascal disp_list_run(char far *list);
void sample_event_handler(void);
void smem_compact(void);
void __pascal voice_buffer_init(char far *snd);
void trim_screen_enter(void);
int __pascal sample_check_active(char far *snd);
void __pascal win_keys_merge(char far *keys);

void __fastcall __loadds discard_do_it(void)
{
	voice_release_all_if(SND_CURRENT);
	disp_list_run(PTR_DL_PROCESSING);
	sample_event_handler();
	smem_compact();
	voice_buffer_init(SND_CURRENT);
	disp_list_run(P_358B);
	trim_screen_enter();
}

void __fastcall __loadds discard_paint(void)
{
	disp_list_run(DL_DISCARD);
}

/* DISCARD only while the sound is not playing */
void __fastcall __loadds L_09544(void)
{
	if (SND_CURRENT && !sample_check_active(SND_CURRENT))
		win_keys_merge(TBL_WINKEYS_DISCARD);
}
