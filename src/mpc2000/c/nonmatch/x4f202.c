/* differs: XL v1.20 +36, 35 bytes */
extern char C0_B_098B8;
extern int C2_FP_PGM_ARRAY;
extern char C2_W_0344A[1];
extern int C2_W_PGM_ARRAY_SEG;
extern char EP_L_4E912_OFF[1];
extern char EP_L_4E912_SEG[1];
void __far disp_list_run(char far *);
void __far draw_confirm_window(char __near *, char __near *);
void __far draw_string_at(long, int, int);
void __far draw_unsigned_value(int, int, long, int);
void __far field_engine_redraw(void);

void __far __fastcall __loadds delete_pgm_paint(void)
{
	draw_confirm_window(EP_L_4E912_OFF, EP_L_4E912_SEG);
	disp_list_run(C2_W_0344A);
	draw_unsigned_value(0x61, 0x11, (long)(C0_B_098B8 + 1), 2);
	draw_string_at(0x110073L, C0_B_098B8 * 0x99e + C2_FP_PGM_ARRAY + 2, C2_W_PGM_ARRAY_SEG);
	field_engine_redraw();
}
