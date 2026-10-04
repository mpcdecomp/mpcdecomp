extern char G_FLAG_1589;
extern char G_STATE_9D8B;
extern unsigned char G_UI_FLAG;
extern char WIN_FIELD_BOX_W;
void __far fx_redraw(void);
void __far L_050DC(void);
char __far * __far channel_validate(int);
void __far __pascal status_read_6A(char __far *, int, int, int, int, int, long, void (__far *)(void));
void __far __pascal status_read_6A_3();
void __far __pascal field_register_s8();
void __far win_keys_merge_disable(void);

void __near fx_echo_arm_field(void)
{
	char far *v0;

	if (G_FLAG_1589) goto X_0467D;
	G_FLAG_1589++;
	v0 = channel_validate(G_STATE_9D8B);
	switch (G_UI_FLAG) { case 0: goto L_04674; case 1: goto br_045CC; case 2: goto br_045EE; case 3: goto br_04626; case 4: goto br_04652; default: goto br_045C3; }
br_045C3:
	G_UI_FLAG = 0;
	goto L_04674;
br_045CC:
	status_read_6A_3(v0 + 0x36, 0, 0x63, 2, 0xc1, 0xb, 0L, fx_redraw);
	goto br_04679;
br_045EE:
	if (v0[0x30] == 2)
		status_read_6A(v0 + 0x34, 0, 0x14f, 3, 0xc1, 0x15, 0L, fx_redraw);
	else
		status_read_6A(v0 + 0x32, 0, 0x29e, 3, 0xc1, 0x15, 0L, fx_redraw);
	goto br_04679;
br_04626:
	status_read_6A_3(v0 + 0x37, 0x14, 0x42, 2, 0xc1, 0x1f, 0L, fx_redraw);
	win_keys_merge_disable();
	WIN_FIELD_BOX_W = 0x12;
	goto br_04679;
br_04652:
	field_register_s8(v0 + 0x31, -0x32, 0x32, 2, 0xc1, 0x29, 0L, fx_redraw);
	goto br_04679;
L_04674:
	L_050DC();
br_04679:
	G_FLAG_1589--;
X_0467D:
	;
}
