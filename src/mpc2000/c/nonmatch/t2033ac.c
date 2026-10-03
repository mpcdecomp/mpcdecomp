/* differs: 150 size 86, image 88; +1A image `je +40` CL `jne +2E`; 172 size 86, image 88; +1A image `je +40` CL `jne +2E` */
extern char BUF_NAME_EDIT[1];
extern char EDIT_CURSOR_H;
extern unsigned char EDIT_CURSOR_X;
extern char EDIT_CURSOR_Y;
extern char EDIT_FIELD_Y;
extern char G_FLAG_8CA8;
extern char G_SEQ_MODE;
extern char WIN_FIELD_BOX_W;
extern unsigned char WIN_FIELD_BOX_R;
extern char WIN_FIELD_BOX_B;
extern unsigned char WIN_FIELD_X;
void __far __pascal cmd_dispatch_1E(int, char, char far *);
void __far __pascal cmd_param_setup(int, char, char, char);

void __far X_03432(void)
{
	EDIT_CURSOR_X = G_SEQ_MODE * 6 + WIN_FIELD_X;
	WIN_FIELD_BOX_R = EDIT_CURSOR_X;
	if (!G_FLAG_8CA8) goto X_03472;
	cmd_dispatch_1E(WIN_FIELD_X, EDIT_FIELD_Y, BUF_NAME_EDIT);
	cmd_param_setup(WIN_FIELD_BOX_R, WIN_FIELD_BOX_B, 6, 0);
	return;
X_03472:
	cmd_param_setup(EDIT_CURSOR_X, EDIT_CURSOR_Y, WIN_FIELD_BOX_W, EDIT_CURSOR_H);
}
