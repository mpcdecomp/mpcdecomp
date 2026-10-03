/* differs: XL v1.20 +20, 308 bytes */
extern long C0_B_098B8;
extern char C1_W_08FCB[1];
extern unsigned char C2_B_PAD_DRUM;
extern unsigned char C2_B_PAD_NOTE;
extern char C2_W_03D94[1];
extern unsigned C2_W_08D82;
extern char C2_W_08D84;
extern int C2_W_098BA;
extern char EP_BR_50EA4_OFF[1];
extern char EP_BR_50EA4_SEG[1];
extern char EP_L_5052A_OFF[1];
extern char EP_L_5052A_SEG[1];
extern char EP_L_50554_OFF[1];
extern char EP_L_50554_SEG[1];
extern char EP_L_50566_OFF[1];
extern char EP_L_50566_SEG[1];
extern char EP_L_50574_OFF[1];
extern char EP_L_50574_SEG[1];
void __far disp_list_run(char far *);
void __far draw_char_at(int, int, int);
void __far draw_signed_value(int, int, long, int);
void __far draw_string_at(long, char far *);
void __far draw_unsigned_value(int, int, long, int);
void __far far_47CB4(long, int, char far *);
void __far far_47D5E(long, long);
void __far field_engine_redraw(void);
char far * __far ivt_get_vector(int);
void __far smem_proc_wrapper(char __near *, char __near *);

void __far __fastcall __loadds auto_chromatic_paint(void)
{
	smem_proc_wrapper(EP_L_5052A_OFF, EP_L_5052A_SEG);
	disp_list_run(C2_W_03D94);
	draw_string_at(0xb0015L, EP_BR_50EA4_OFF, EP_BR_50EA4_SEG);
	far_47CB4(0xb003fL, C2_B_PAD_NOTE, ivt_get_vector(C2_B_PAD_DRUM + 0x60));
	far_47D5E(0xb0069L, C0_B_098B8);
	draw_string_at(0x15001bL, EP_L_50554_OFF, EP_L_50554_SEG);
	draw_unsigned_value(0x69, 0x15, (long)C2_W_08D84, 2);
	draw_char_at(0x7b, 0x15, (C2_W_08D84 - 0x23) / 0x10 + 0x41);
	draw_char_at(0x81, 0x15, ((C2_W_08D84 - 0x23) % 0x10 + 1) / 0xa + 0x30);
	draw_char_at(0x87, 0x15, ((C2_W_08D84 - 0x23) % 0x10 + 1) % 0xa + 0x30);
	draw_string_at(0x1f001bL, EP_L_50566_OFF, EP_L_50566_SEG);
	draw_signed_value(0x69, 0x1f, (long)C2_W_08D82, 3);
	draw_string_at(0x29001bL, EP_L_50574_OFF, EP_L_50574_SEG);
	draw_string_at(0x290069L, C1_W_08FCB);
	field_engine_redraw();
}
