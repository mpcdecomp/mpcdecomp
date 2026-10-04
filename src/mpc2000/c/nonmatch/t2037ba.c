/* differs: 150 size 60, image 56; +6 image `jne +E` CL `jne +10`; 172 size 60, image 56; +6 image `jne +E` CL `jne +10` */
extern char EDIT_CURSOR_H;
extern char EDIT_CURSOR_X;
extern char EDIT_CURSOR_Y;
extern char G_SEQ_MODE;
extern char WIN_FIELD_BOX_W;
extern char WIN_FIELD_DIGITS;
void __far __pascal cmd_param_setup(int, char, char, char);

void __far X_03840(void)
{
	WIN_FIELD_BOX_W = (!G_SEQ_MODE ? WIN_FIELD_DIGITS + 1 : WIN_FIELD_DIGITS - G_SEQ_MODE) * 6;
	cmd_param_setup(EDIT_CURSOR_X, EDIT_CURSOR_Y, WIN_FIELD_BOX_W, EDIT_CURSOR_H);
}
