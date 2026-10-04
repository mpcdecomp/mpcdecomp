/* differs: XL v1.20 +0, 200 bytes */
extern char C0_B_098B8;
extern char C2_B_098B9;
extern unsigned char C2_B_COPY_FX_DST_SET;
extern int C2_FP_PGM_ARRAY;
extern char C2_TBL_043F2[1];
extern char C2_TBL_043F4[1];
extern char C2_W_0468A[1];
extern char C2_W_098BA;
extern int C2_W_PGM_ARRAY_SEG;
extern char EP_FAR_47ABE_OFF[1];
extern char EP_FAR_47ABE_SEG[1];
extern char EP_L_51DE2_OFF[1];
extern char EP_L_51DE2_SEG[1];
void __far disp_list_run(char far *);
void __far draw_softkey_label(int, int, char __near *, char __near *);
void __far draw_string_at(long, int, int);
void __far draw_unsigned_value(int, int, long, int);
void __far field_engine_redraw(void);
void __far smem_proc_wrapper(char __near *, char __near *);

void __far __fastcall __loadds copy_fx_paint(void)
{
	int si_;

	smem_proc_wrapper(EP_L_51DE2_OFF, EP_L_51DE2_SEG);
	disp_list_run(C2_W_0468A);
	draw_unsigned_value(0x55, 0xb, (long)(C0_B_098B8 + 1), 2);
	si_ = C0_B_098B8;
	draw_string_at(0xb0067L, si_ * 0x99e + C2_FP_PGM_ARRAY + 2, C2_W_PGM_ARRAY_SEG);
	draw_string_at(0x140055L, *(int *)(C2_TBL_043F2 + C2_W_098BA * 4), *(int *)(C2_TBL_043F4 + C2_W_098BA * 4));
	draw_unsigned_value(0x55, 0x20, (long)(C2_B_098B9 + 1), 2);
	draw_string_at(0x200067L, C2_B_098B9 * 0x99e + C2_FP_PGM_ARRAY + 2, C2_W_PGM_ARRAY_SEG);
	draw_string_at(0x290055L, *(int *)(C2_TBL_043F2 + C2_B_COPY_FX_DST_SET * 4), *(int *)(C2_TBL_043F4 + C2_B_COPY_FX_DST_SET * 4));
	if (C2_B_098B9 != C0_B_098B8) goto br_526B9;
	if (C2_W_098BA == C2_B_COPY_FX_DST_SET) goto br_526CB;
br_526B9:
	draw_softkey_label(5, 1, EP_FAR_47ABE_OFF, EP_FAR_47ABE_SEG);
br_526CB:
	field_engine_redraw();
}
