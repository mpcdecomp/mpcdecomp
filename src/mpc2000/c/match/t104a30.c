extern char G_FLAG_1589;
extern char G_STATE_9D8B;
extern unsigned char G_UI_SUBMODE;
extern char WIN_FIELD_BOX_W;
void __far far_04B42(void);
char __far * __far channel_get_ptr(int);
void __far __pascal status_read_6A(char __far *, int, int, char, char, char, long, void (__far *)(void));
void __far __pascal status_read_6A_3();
void __far __pascal voice_trigger_full();
void __far win_keys_merge_disable(void);

void __near fx_reverb_arm_field(void)
{
	char far *v0;

	if (G_FLAG_1589) goto X_04AE5;
	G_FLAG_1589++;
	v0 = channel_get_ptr(G_STATE_9D8B);
	if (v0[0] >= 4 && G_UI_SUBMODE >= 4) G_UI_SUBMODE = 0;
	switch (G_UI_SUBMODE) { case 0: goto br_04ACC; case 1: goto X_04A06; case 2: goto X_04A28; case 3: goto X_04A5E; case 4: goto X_04A74; case 5: goto X_04A8A; case 6: goto X_04AB6; default: goto br_049FE; }
br_049FE:
	G_UI_SUBMODE = 0;
	goto br_04ACC;
X_04A06:
	status_read_6A(v0 + 2, 0, 0x5a, 2, 0x61, 0x15, 0L, far_04B42);
	goto L_04AE1;
X_04A28:
	status_read_6A_3(v0[0] > 3 ? v0 + 9 : v0 + 7, 0, 0x63, 2, 0x61, 0x1f, 0L, far_04B42);
	goto L_04AE1;
X_04A5E:
	status_read_6A_3(v0 + 8, 0, 0x63, 2, 0x61, 0x29, 0L, far_04B42);
	goto L_04AE1;
X_04A74:
	status_read_6A_3(v0 + 4, 0, 0x63, 2, 0xc7, 0x15, 0L, far_04B42);
	goto L_04AE1;
X_04A8A:
	status_read_6A_3(v0 + 5, 0, 0x28, 2, 0xc7, 0x1f, 0L, far_04B42);
	win_keys_merge_disable();
	WIN_FIELD_BOX_W = 0x12;
	goto L_04AE1;
X_04AB6:
	status_read_6A_3(v0 + 6, 0x28, 0x42, 2, 0xc7, 0x29, 0L, far_04B42);
	win_keys_merge_disable();
	WIN_FIELD_BOX_W = 0x12;
	goto L_04AE1;
br_04ACC:
	voice_trigger_full(v0, 6, 0x31, 0xb, 0xb, far_04B42);
L_04AE1:
	G_FLAG_1589--;
X_04AE5:
	;
}
