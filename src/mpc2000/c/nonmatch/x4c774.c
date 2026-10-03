/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C0_B_098B8;
extern char far *C0_W_0D7C2;
extern int C0_W_0D7C4;
extern char C1_W_08FCB[1];
extern char C2_W_0236E[1];
extern int C2_W_098BA;
extern char EP_FAR_47ABE_OFF[1];
extern char EP_FAR_47ABE_SEG[1];
extern char EP_L_4BD16_OFF[1];
extern char EP_L_4BD16_SEG[1];
void __far disp_list_run(char far *);
void __far draw_confirm_window(char __near *, char __near *);
void __far draw_softkey_label(int, int, char __near *, char __near *);
void __far draw_string_at(long, char far *);
void __far field_engine_redraw(void);

void __far __fastcall __loadds mono_to_stereo_paint(void)
{
	draw_confirm_window(EP_L_4BD16_OFF, EP_L_4BD16_SEG);
	disp_list_run(C2_W_0236E);
	draw_string_at(0xf008bL, C0_W_0D7C2 + 0x12);
	draw_string_at(0x1e008bL, C0_B_098B8 + 0x12);
	draw_string_at(0x28008bL, C1_W_08FCB);
	if (C0_W_0D7C2[37]) goto br_4C7FF;
	if (C0_B_098B8[37]) goto br_4C7FF;
	draw_softkey_label(5, 1, EP_FAR_47ABE_OFF, EP_FAR_47ABE_SEG);
br_4C7FF:
	field_engine_redraw();
}
