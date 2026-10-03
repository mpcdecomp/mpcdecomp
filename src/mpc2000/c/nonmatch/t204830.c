/* blocked: its else arm jumps into X_049C8, which jumps into the middle of X_049DA: one body with three entries, not C; differs: 150 size 146, image 140; +6 image `je +4E` CL `je +4C`; 172 size 146, image 140; +6 image `je +4E` CL `je +4C` */
extern char EDIT_CURSOR_H;
extern unsigned char EDIT_CURSOR_X;
extern char EDIT_CURSOR_Y;
extern unsigned char EDIT_FIELD_Y;
extern char G_FLAG_8CA8;
extern char G_SEQ_MODE;
extern int NUM_ENTRY_VALUE;
extern char WIN_FIELD_BOX_W;
extern unsigned char WIN_FIELD_BOX_R;
extern unsigned char WIN_FIELD_BOX_B;
extern char WIN_FIELD_DIGITS;
extern unsigned char WIN_FIELD_X;
void __far __pascal cmd_exec_pair(int, int, int, int);
void __far __pascal cmd_param_setup(int, char, char, char);
void __far __pascal cmd_ratio_setup(int, unsigned char, int);

void __far num_entry_draw(void)
{
	if (G_FLAG_8CA8) {
		cmd_param_setup(WIN_FIELD_BOX_R + 6, WIN_FIELD_BOX_B, 6, 0);
		cmd_ratio_setup(WIN_FIELD_X, EDIT_FIELD_Y, 0x20);
		cmd_exec_pair(WIN_FIELD_X + 6, EDIT_FIELD_Y, NUM_ENTRY_VALUE, WIN_FIELD_DIGITS);
		return;
	}
	WIN_FIELD_BOX_W = (G_SEQ_MODE < 2 ? WIN_FIELD_DIGITS - G_SEQ_MODE + 2 : WIN_FIELD_DIGITS - G_SEQ_MODE + 1) * 6;
	cmd_param_setup(EDIT_CURSOR_X, EDIT_CURSOR_Y, WIN_FIELD_BOX_W, EDIT_CURSOR_H);
}
