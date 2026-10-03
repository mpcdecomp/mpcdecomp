#if FW_VERSION == 150
extern unsigned char FX_MIXER_CURSOR;
extern char G_FLAG_1589;
extern char G_STATE_9D8B;
void __far fx_redraw(void);
char far * __far channel_validate(int);
void __far __pascal field_register_s8(char far *, int, int, int, int, int, int, int);
void __far __pascal status_read_6A_3(char far *, int, int, int, int, int, long, void (far *)(void));
void __far __pascal voice_trigger_full(char far *, int, int, int, int, void (far *)(void));

void __near midi_status_read(void)
{
	char far *v0;

	if (G_FLAG_1589) goto X_04CF0;
	G_FLAG_1589++;
	v0 = channel_validate(G_STATE_9D8B);
	switch (FX_MIXER_CURSOR) { case 0: goto L_04CD2; case 1: goto L_04C10; case 2: goto L_04C36; case 3: goto L_04C58; case 4: goto L_04C6A; case 5: goto L_04C7C; case 6: goto L_04C9E; case 7: goto L_04CB0_1; case 8: goto L_04CC2_1; default: goto L_04C08; }
L_04C08:
	FX_MIXER_CURSOR = 0;
	goto L_04CD2;
L_04C10:
	voice_trigger_full(v0 + 0x46, 2, 0x19, 0x24, 0xd, fx_redraw);
	goto L_04CEC;
L_04C36:
	status_read_6A_3(v0 + 0x14, 0, 0x63, 2, 0xa9, 0x15, 0L, fx_redraw);
	goto L_04CEC;
L_04C58:
	status_read_6A_3(v0 + 0x40, 0, 0x63, 2, 0xa9, 0x1f, 0L, fx_redraw);
	goto L_04CEC;
L_04C6A:
	status_read_6A_3(v0 + 0x43, 0, 0x63, 2, 0xa9, 0x29, 0L, fx_redraw);
	goto L_04CEC;
L_04C7C:
	field_register_s8(v0 + 0x15, -0x32, 0x32, 2, 0xbb, 0x15, 0, 0, fx_redraw);
	goto L_04CEC;
L_04C9E:
	field_register_s8(v0 + 0x41, -0x32, 0x32, 2, 0xbb, 0x1f, 0, 0, fx_redraw);
	goto L_04CEC;
L_04CB0_1:
	field_register_s8(v0 + 0x44, -0x32, 0x32, 2, 0xbb, 0x29, 0, 0, fx_redraw);
	goto L_04CEC;
L_04CC2_1:
	status_read_6A_3(v0 + 0x42, 0, 0x63, 2, 0xd3, 0x1f, 0L, fx_redraw);
	goto L_04CEC;
L_04CD2:
	voice_trigger_full(v0 + 5, 1, 0x55, 0xe, 4, fx_redraw);
L_04CEC:
	G_FLAG_1589--;
X_04CF0:
	;
}
#else
extern char B_9D8C[1];
extern unsigned char FX_MIXER_CURSOR;
extern char G_FLAG_1589;
extern char G_STATE_9D8B;
void __far L_04B2E_1(void);
void __far fx_redraw(void);
char far * __far channel_validate(int);
void __far __pascal field_register_s8(char far *, int, int, int, int, int, int, int);
void __far __pascal status_read_6A_3(char far *, int, int, int, int, int, long, void (far *)(void));
void __far __pascal voice_trigger_full(char far *, int, int, int, int, void (far *)(void));

void __near midi_status_read(void)
{
	char far *v0;

	if (G_FLAG_1589) goto X_04CF0;
	G_FLAG_1589++;
	v0 = channel_validate(G_STATE_9D8B);
	switch (FX_MIXER_CURSOR) { case 0: goto L_04CD2; case 1: goto L_04C10; case 2: goto L_04C20; case 3: goto L_04C36; case 4: goto L_04C58; case 5: goto L_04C6A; case 6: goto L_04C7C; case 7: goto L_04C9E; case 8: goto L_04CB0_1; case 9: goto L_04CC2_1; default: goto L_04C08; }
L_04C08:
	FX_MIXER_CURSOR = 0;
	goto L_04CD2;
L_04C10:
	voice_trigger_full(v0 + 0x46, 2, 0x19, 0x1f, 0xd, fx_redraw);
	goto L_04CEC;
L_04C20:
	voice_trigger_full(B_9D8C, 4, 0x3d, 0x29, 7, L_04B2E_1);
	goto L_04CEC;
L_04C36:
	status_read_6A_3(v0 + 0x14, 0, 0x63, 2, 0xa9, 0x15, 0L, fx_redraw);
	goto L_04CEC;
L_04C58:
	status_read_6A_3(v0 + 0x40, 0, 0x63, 2, 0xa9, 0x1f, 0L, fx_redraw);
	goto L_04CEC;
L_04C6A:
	status_read_6A_3(v0 + 0x43, 0, 0x63, 2, 0xa9, 0x29, 0L, fx_redraw);
	goto L_04CEC;
L_04C7C:
	field_register_s8(v0 + 0x15, -0x32, 0x32, 2, 0xbb, 0x15, 0, 0, fx_redraw);
	goto L_04CEC;
L_04C9E:
	field_register_s8(v0 + 0x41, -0x32, 0x32, 2, 0xbb, 0x1f, 0, 0, fx_redraw);
	goto L_04CEC;
L_04CB0_1:
	field_register_s8(v0 + 0x44, -0x32, 0x32, 2, 0xbb, 0x29, 0, 0, fx_redraw);
	goto L_04CEC;
L_04CC2_1:
	status_read_6A_3(v0 + 0x42, 0, 0x63, 2, 0xd3, 0x1f, 0L, fx_redraw);
	goto L_04CEC;
L_04CD2:
	voice_trigger_full(v0 + 5, 1, 0x55, 0xb, 4, fx_redraw);
L_04CEC:
	G_FLAG_1589--;
X_04CF0:
	;
}
#endif
