/* differs: XL v1.20 +1, 334 bytes */
extern unsigned char C2_B_PAD_DRUM;
extern unsigned char C2_B_PAD_NOTE;
extern unsigned char C2_B_PAD_VELOCITY;
extern char C2_W_03BA2[1];
extern char EP_FAR_50662_OFF[1];
extern char EP_FAR_50662_SEG[1];
extern char EP_L_50654_OFF[1];
extern char EP_L_50654_SEG[1];
void __far L_47CFE(int, int, int, char far *, char far *);
void __far disp_list_run(char far *);
void __far draw_fixed_decimal(int, int, long, int, int);
void __far draw_signed_value(int, int, long, int);
void __far draw_string_at(long, char __near *, char __near *);
void __far draw_unsigned_value(int, int, long, int);
int __far far_486D8(long, int, int);
void __far field_engine_redraw(void);
char far * __far ivt_get_vector(int);
void __far smem_proc_wrapper(char __near *, char __near *);

void __far __fastcall __loadds velo_pitch_paint(void)
{
	char far *l4;
	char far *l8;
	int l18;
	int di_;
	char far *v0;

	l4 = ivt_get_vector(C2_B_PAD_DRUM + 0x5c);
	l18 = C2_B_PAD_NOTE;
	l8 = l4 + l18 * 0x18 - 0x32a;
	v0 = *(long far *)(l4 + l18 * 4 + 1874);
	smem_proc_wrapper(EP_L_50654_OFF, EP_L_50654_SEG);
	disp_list_run(C2_W_03BA2);
	L_47CFE(0x37, 0xb, C2_B_PAD_NOTE, ivt_get_vector(C2_B_PAD_DRUM + 0x60), v0);
	draw_signed_value(0x61, 0x1c, (long)*(int far *)(l8 + 8), 3);
	if (!v0) goto br_50531;
	if (!(v0 + 0x12)[36]) goto br_50531;
	di_ = (v0 + 0x12)[18];
	di_ += *(int far *)(l8 + 8);
	if (di_ <= 0xf0) goto br_504D5;
	di_ = 0xf0;
br_504D5:
	if (di_ >= -0xf0) goto br_504DE;
	di_ = -0xf0;
br_504DE:
	((int *)&l4)[1] = far_486D8(*(long far *)(v0 + 0x12 + 32), (unsigned char)(v0 + 0x12)[37], di_);
	draw_string_at(0x28001fL, EP_FAR_50662_OFF, EP_FAR_50662_SEG);
	if (((int *)&l4)[1] <= 0) goto br_50531;
	if (((int *)&l4)[1] >= 0x2710) goto br_50531;
	draw_fixed_decimal(0x61, 0x28, (long)((int *)&l4)[1], 3, 1);
br_50531:
	draw_signed_value(0xcd, 0x1c, (long)l8[23], 3);
	draw_unsigned_value(0xcd, 0x28, (long)C2_B_PAD_VELOCITY, 3);
	field_engine_redraw();
}
