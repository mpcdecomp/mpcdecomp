/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C1_SEG[1];
extern char C2_W_021FE[1];
extern char EP_L_4C3A6_OFF[1];
void __far disp_list_run(char far *);
void __far draw_confirm_window(char __near *, char __near *);

void __far __fastcall __loadds delete_all_sounds_paint(void)
{
	draw_confirm_window(EP_L_4C3A6_OFF, C1_SEG);
	disp_list_run(C2_W_021FE);
}
