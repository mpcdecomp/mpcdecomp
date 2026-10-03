/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C1_SEG[1];
extern char C2_W_011B4[1];
extern char C2_W_07B98[1];
extern char EP_L_47B84_OFF[1];
void __far disp_list_run(char far *);
void __far draw_bitmap_ptr(int, int, char far *);
void __far draw_confirm_window(char __near *, char __near *);

void __far __fastcall __loadds change_disk_paint(void)
{
	draw_confirm_window(EP_L_47B84_OFF, C1_SEG);
	disp_list_run(C2_W_011B4);
	draw_bitmap_ptr(0x48, 0x14, C2_W_07B98);
}
