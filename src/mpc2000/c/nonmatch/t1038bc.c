/* differs: 150 +30 image `inc bx` CL `add bx, bx`; 172 +30 image `inc bx` CL `add bx, bx` */
extern char EDIT_CURSOR_H;
extern int FXEDIT_CURSOR;
extern char G_EDIT_FIELD_VAL[1];
extern char WIN_FIELD_BOX_W;
extern char TBL_1360[1];
extern char TBL_1361[1];
void __far L_043EE(void);
void __far X_04428(void);
void __far __pascal status_read_6A_3(char far *, int, int, int, char, char, long, long);
void __far win_keys_merge_disable(void);

void __near fn_03836(void)
{
	switch (FXEDIT_CURSOR) { case 0: goto X_03890; case 1: goto X_03852; case 2: case 3: case 4: case 5: case 6: case 7: goto br_03858; }
	FXEDIT_CURSOR = 0;
	goto X_03890;
X_03852:
	X_04428();
	return;
br_03858:
	status_read_6A_3(G_EDIT_FIELD_VAL, 0, 0, 1, TBL_1360[(FXEDIT_CURSOR + 1) * 2], TBL_1361[(FXEDIT_CURSOR + 1) * 2], 0L, 0L);
	win_keys_merge_disable();
	WIN_FIELD_BOX_W = 0x1f;
	EDIT_CURSOR_H = 0x26;
	return;
X_03890:
	L_043EE();
}
