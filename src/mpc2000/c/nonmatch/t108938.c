/* differs: 150 size 64, image 68; +1B image `mov si, ax` CL `or ax, ax`; 172 size 64, image 68; +1B image `mov si, ax` CL `or ax, ax` */
extern long G_ZONE_END;
extern long G_ZONE_START;
extern int G_ZONE_START_HI;
extern char P_3AE4[1];
extern long SND_CURRENT;
extern int ZONE_END_HI;
void __far __pascal disp_list_run(char far *);
void __far err_msg_report(void);
void __far __pascal voice_buffer_init(long);
int __near __pascal zone_action_reverse(long, long, long);
void __far __fastcall __loadds zone_edit_cancel(void);

void __far br_088B8(void)
{
	int si_;

	si_ = zone_action_reverse(SND_CURRENT, G_ZONE_START, G_ZONE_END);
	if (si_) goto br_088DE;
	err_msg_report();
br_088DE:
	voice_buffer_init(SND_CURRENT);
	disp_list_run(P_3AE4);
	zone_edit_cancel();
}
