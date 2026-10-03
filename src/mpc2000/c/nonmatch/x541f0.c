/* differs: XL v1.20; the oracle matches it, the check cannot place it: callee frame */
extern char C0_B_0D7C7;
extern char C2_SEG[1];
extern char C2_W_0549E[1];
extern char C2_W_054A0[1];
extern char C2_W_054EC[1];
extern char C2_W_0551C[1];
extern char EP_L_5455E_OFF[1];
void __far disp_list_run(char far *);
void __far draw_string_at(long, int, int);
void __far draw_unsigned_value(int, int, unsigned long, int);
void __far far_529AC(char __near *, char __near *);
void __far far_530E8(int, int, char);
void __far field_engine_redraw(void);
char far * __far pgm_fx_reverb_ptr(int);

void __far __fastcall __loadds fx_reverb_paint(void)
{
	char far *v0;

	v0 = pgm_fx_reverb_ptr(C0_B_0D7C7);
	far_529AC(EP_L_5455E_OFF, C2_SEG);
	disp_list_run(C2_W_054EC);
	draw_string_at(0xb0031L, *(int *)(C2_W_0549E + *v0 * 4), *(int *)(C2_W_054A0 + *v0 * 4));
	draw_unsigned_value(0x61, 0x15, (unsigned long)(unsigned)*(int far *)(v0 + 2), 2);
	draw_unsigned_value(0x61, 0x29, (unsigned long)(unsigned char)v0[8], 2);
	if (*v0 <= 3) {
		disp_list_run(C2_W_0551C);
		draw_unsigned_value(0x61, 0x1f, (unsigned long)(unsigned char)v0[7], 2);
		draw_unsigned_value(0xc7, 0x15, (unsigned long)(unsigned char)v0[4], 2);
		far_530E8(0xc7, 0x1f, v0[5]);
		far_530E8(0xc7, 0x29, v0[6]);
	} else {
		draw_unsigned_value(0x61, 0x1f, (unsigned long)(unsigned char)v0[9], 2);
	}
	field_engine_redraw();
}
