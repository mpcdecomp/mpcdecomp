extern char G_FLAG_1589;
extern char G_STATE_9D8B;
extern unsigned char G_UI_MODE;
void __far L_03808(void);
void __far fx_redraw(void);
void __far X_04E24(void);
char far * __far channel_validate(int);
void __far __pascal field_register_s8(char far *, int, int, int, int, int, int, int);
void __far __pascal status_read_6A_3(char far *, int, int, int, int, int, long, void (far *)(void));

void __near fx_mod_arm_field(void)
{
	char far *v0;

	if (G_FLAG_1589) goto X_03FF9;
	G_FLAG_1589++;
	v0 = channel_validate(G_STATE_9D8B);
	switch (G_UI_MODE) { case 0: goto X_03FF0; case 1: goto br_03F94; case 2: goto br_03FB8; case 3: goto br_03FCE; }
	G_UI_MODE = 0;
	goto X_03FF0;
br_03F94:
	status_read_6A_3(v0 + 0x18, 0, 0x63, 2, 0xbb, 0x15, L_03808, fx_redraw);
	goto br_03FF5;
br_03FB8:
	status_read_6A_3(v0 + 0x19, 0, 0x63, 2, 0xbb, 0x1f, 0L, fx_redraw);
	goto br_03FF5;
br_03FCE:
	field_register_s8(v0 + 0x1a, -0x32, 0x32, 2, 0xbb, 0x29, 0, 0, fx_redraw);
	goto br_03FF5;
X_03FF0:
	X_04E24();
br_03FF5:
	G_FLAG_1589--;
X_03FF9:
	;
}
