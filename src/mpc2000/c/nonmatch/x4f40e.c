/* differs: XL v1.20; the oracle matches it, the check cannot place it: callee frame */
extern char C0_B_098B8;
extern char C1_W_08FCB[1];
extern char C2_W_03558[1];
extern char EP_L_4EB2C_OFF[1];
extern char EP_L_4EB2C_SEG[1];
void __far disp_list_run(char far *);
void __far draw_confirm_window(char __near *, char __near *);
void __far draw_string_at(long, char far *);
void __far draw_unsigned_value(int, int, long, int);
void __far field_engine_redraw(void);

void __far __fastcall __loadds new_pgm_paint(void)
{
	draw_confirm_window(EP_L_4EB2C_OFF, EP_L_4EB2C_SEG);
	disp_list_run(C2_W_03558);
	draw_string_at(0x13007fL, C1_W_08FCB);
	draw_unsigned_value(0xc1, 0x25, (long)(C0_B_098B8 + 1), 3);
	field_engine_redraw();
}
