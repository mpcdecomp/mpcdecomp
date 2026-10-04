extern long NUM_ENTRY_MIN;
extern long NUM_ENTRY_VALUE;
extern char G_FLAG_8CA8;
extern char WIN_FIELD_DIGITS;
extern char G_SEQ_MODE;
extern unsigned char WIN_FIELD_X;
extern char EDIT_FIELD_Y;
extern unsigned char EDIT_CURSOR_X;
extern char EDIT_CURSOR_Y;
extern unsigned char WIN_FIELD_BOX_W;
extern unsigned char EDIT_CURSOR_H;
extern unsigned char WIN_FIELD_BOX_R;
extern char WIN_FIELD_BOX_B;
void __far __pascal draw_unsigned_value(int, char, unsigned long, int);
void __far __pascal cmd_param_setup(int, char, int, int);

void __far field_draw_default(void)
{
	int neg;

	neg = 0;
	if (NUM_ENTRY_MIN < 0) neg = 1;
	if (G_FLAG_8CA8) {
		draw_unsigned_value(WIN_FIELD_X, EDIT_FIELD_Y, NUM_ENTRY_VALUE, WIN_FIELD_DIGITS + neg);
		cmd_param_setup(WIN_FIELD_BOX_R, WIN_FIELD_BOX_B, 6, 0);
	} else
		cmd_param_setup(EDIT_CURSOR_X, EDIT_CURSOR_Y, WIN_FIELD_BOX_W - G_SEQ_MODE * 6, EDIT_CURSOR_H);
}
