extern unsigned char FILTER4_CURSOR;
extern char G_FLAG_1589;
extern char G_STATE_9D8B;
extern char WIN_FIELD_BOX_W;
void __far L_03808(void);
void __far fx_redraw(void);
char __far * __far channel_validate(int);
void __far __pascal field_register_s8();
void __far __pascal status_read_6A_3();
void __far win_keys_merge_disable(void);

void __near midi_note_handler(void)
{
	char far *v0;

	if (G_FLAG_1589) goto L_03E2E;
	G_FLAG_1589++;
	v0 = channel_validate(G_STATE_9D8B);
	switch (FILTER4_CURSOR) { case 0: goto X_03E00; case 1: goto X_03CF4; case 2: goto X_03D16; case 3: goto X_03D28; case 4: goto X_03D3A; case 5: goto X_03D5C; case 6: goto X_03D74; case 7: goto X_03D84; case 8: goto L_03D96; case 9: goto X_03DA8; case 10: goto X_03DBA; case 11: goto L_03DCC; case 12: goto X_03DDC; case 13: goto X_03DEE; default: goto br_03CEC; }
br_03CEC:
	FILTER4_CURSOR = 0;
	goto X_03E00;
X_03CF4:
	field_register_s8(v0 + 0xf, -0x25, 0xc, 2, 0x55, 0xb, 0, 0, fx_redraw);
	goto L_03E2A;
X_03D16:
	status_read_6A_3(v0 + 0xb, 0xc, 0x38, 2, 0x31, 0x15, 0L, fx_redraw);
	win_keys_merge_disable();
	WIN_FIELD_BOX_W = 0x12;
	goto L_03E2A;
X_03D28:
	field_register_s8(v0 + 0xc, -0x25, 0xc, 2, 0x55, 0x15, 0, 0, fx_redraw);
	goto L_03E2A;
X_03D3A:
	status_read_6A_3(v0 + 0xd, 0, 0x63, 2, 0x7f, 0x15, 0L, fx_redraw);
	goto L_03E2A;
X_03D5C:
	status_read_6A_3(v0 + 0x12, 0, 0x63, 2, 0x9d, 0x15, L_03808, fx_redraw);
	goto L_03E2A;
X_03D74:
	status_read_6A_3(v0 + 0x13, 0, 0x63, 2, 0xd3, 0x15, 0L, fx_redraw);
	goto L_03E2A;
X_03D84:
	status_read_6A_3(v0 + 8, 0xc, 0x38, 2, 0x31, 0x1f, 0L, fx_redraw);
	win_keys_merge_disable();
	WIN_FIELD_BOX_W = 0x12;
	goto L_03E2A;
L_03D96:
	field_register_s8(v0 + 9, -0x25, 0xc, 2, 0x55, 0x1f, 0, 0, fx_redraw);
	goto L_03E2A;
X_03DA8:
	status_read_6A_3(v0 + 0xa, 0, 0x63, 2, 0x7f, 0x1f, 0L, fx_redraw);
	goto L_03E2A;
X_03DBA:
	status_read_6A_3(v0 + 0x10, 0, 0x63, 2, 0x9d, 0x1f, L_03808, fx_redraw);
	goto L_03E2A;
L_03DCC:
	status_read_6A_3(v0 + 0x11, 0, 0x63, 2, 0xd3, 0x1f, 0L, fx_redraw);
	goto L_03E2A;
X_03DDC:
	status_read_6A_3(v0 + 6, 4, 0x22, 2, 0x31, 0x29, 0L, fx_redraw);
	win_keys_merge_disable();
	WIN_FIELD_BOX_W = 0x12;
	goto L_03E2A;
X_03DEE:
	field_register_s8(v0 + 7, -0x25, 0xc, 2, 0x55, 0x29, 0, 0, fx_redraw);
	goto L_03E2A;
X_03E00:
	status_read_6A_3(v0 + 0xe, 0x22, 0x40, 2, 0x31, 0xb, 0L, fx_redraw);
	win_keys_merge_disable();
	WIN_FIELD_BOX_W = 0x12;
L_03E2A:
	G_FLAG_1589--;
L_03E2E:
	;
}
