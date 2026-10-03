/* differs: 150 +35 image `push ds` CL `add si, 2`; 172 +35 image `push ds` CL `add si, 2` */
extern char EDIT_CURSOR_H;
extern int FXEDIT_CURSOR;
extern char G_EDIT_FIELD_VAL[1];
extern char WIN_FIELD_BOX_W;
extern char TBL_1360[1];
extern char TBL_1361[1];
void __far L_043EE(void);
void __far X_04428(void);
void __far X_0455A(void);
void __far __pascal status_read_6A_3(char far *, int, int, int, char, char, long, long);
void __far win_keys_merge_disable(void);

void __near fn_03724(void)
{
	int si_;

	switch (FXEDIT_CURSOR) { case 0: goto X_0378E; case 1: goto br_03740; case 2: goto br_03748; case 3: goto br_03750; case 4: goto L_03756; }
	FXEDIT_CURSOR = 0;
	goto X_0378E;
br_03740:
	X_04428();
	return;
br_03748:
	X_0455A();
	return;
br_03750:
	si_ = 7;
	goto L_03759;
L_03756:
	si_ = 8;
L_03759:
	si_ += 2;
	status_read_6A_3(G_EDIT_FIELD_VAL, 0, 0, 1, TBL_1360[si_], TBL_1361[si_], 0L, 0L);
	win_keys_merge_disable();
	WIN_FIELD_BOX_W = 0x1f;
	EDIT_CURSOR_H = 0x26;
	return;
X_0378E:
	L_043EE();
}
