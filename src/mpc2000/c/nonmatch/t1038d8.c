/* differs: 150 size 6, image 62; +6 image `push ds` CL `ret`; 172 size 6, image 62; +6 image `push ds` CL `ret` */
extern char EDIT_CURSOR_H;
extern int FXEDIT_CURSOR;
extern char G_EDIT_FIELD_VAL[1];
extern char WIN_FIELD_BOX_W;
extern char TBL_1360[1];
extern char TBL_1361[1];
void __far X_04428(void);
void __far __pascal status_read_6A_3(char far *, int, int, int, char, char, long, long);
void __far win_keys_merge_disable(void);

void __near X_03852(void)
{
	X_04428();
	return;
	status_read_6A_3(G_EDIT_FIELD_VAL, 0, 0, 1, TBL_1360[(FXEDIT_CURSOR + 1) * 2], TBL_1361[(FXEDIT_CURSOR + 1) * 2], 0L, 0L);
	win_keys_merge_disable();
	WIN_FIELD_BOX_W = 0x1f;
	EDIT_CURSOR_H = 0x26;
}
