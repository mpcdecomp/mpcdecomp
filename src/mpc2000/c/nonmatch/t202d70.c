/* differs: 150 size 102, image 108; +10 image `je +40` CL `jne +34` */
extern unsigned char EDIT_CURSOR_H;
extern unsigned char EDIT_CURSOR_X;
extern char EDIT_CURSOR_Y;
extern char EDIT_FIELD_Y;
extern char G_FLAG_8CA8;
extern char G_SEQ_MODE;
extern int NUM_ENTRY_MIN_HI;
extern long NUM_ENTRY_VALUE;
extern int NUM_ENTRY_VALUE_HI;
extern unsigned char WIN_FIELD_BOX_W;
extern unsigned char WIN_FIELD_BOX_R;
extern char WIN_FIELD_BOX_B;
extern char WIN_FIELD_DIGITS;
extern unsigned char WIN_FIELD_X;
void __far __pascal cmd_param_setup(int, char, unsigned char, int);
void __far __pascal draw_unsigned_value(int, char, long, int);

void __far field_draw_default(void)
{
	int cx_;

	cx_ = 0;
	if (NUM_ENTRY_MIN_HI >= cx_) goto br_02E01;
	cx_ = 1;
br_02E01:
	if (!G_FLAG_8CA8) goto br_02E36;
	draw_unsigned_value(WIN_FIELD_X, EDIT_FIELD_Y, NUM_ENTRY_VALUE, WIN_FIELD_DIGITS + cx_);
	cmd_param_setup(WIN_FIELD_BOX_R, WIN_FIELD_BOX_B, 6, 0);
	return;
br_02E36:
	cmd_param_setup(EDIT_CURSOR_X, EDIT_CURSOR_Y, WIN_FIELD_BOX_W - G_SEQ_MODE * 6, EDIT_CURSOR_H);
}
