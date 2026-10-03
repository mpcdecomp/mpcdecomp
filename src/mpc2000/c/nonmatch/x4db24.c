/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C0_B_098B8;
extern char C2_W_02B0A[1];
extern char EP_L_4D23C_OFF[1];
extern char EP_L_4D23C_SEG[1];
void __far disp_list_run(char far *);
void __far draw_unsigned_value(int, int, long, int);
void __far field_engine_redraw(void);
void __far smem_proc_wrapper(char __near *, char __near *);

void __far __fastcall __loadds zone_count_paint(void)
{
	smem_proc_wrapper(EP_L_4D23C_OFF, EP_L_4D23C_SEG);
	disp_list_run(C2_W_02B0A);
	draw_unsigned_value(0x9d, 0xd, (long)C0_B_098B8, 2);
	field_engine_redraw();
}
