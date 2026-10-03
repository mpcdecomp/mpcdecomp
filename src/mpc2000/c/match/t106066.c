extern char G_PAD_NOTE_BASE[1];
extern char G_VELOCITY_MAX[1];
extern char VELO_PITCH_CURSOR;
extern char WIN_FIELD_BOX_W;
void __far __pascal field_register_s8(char far *, int, int, int, int, int, int, int);
void __far __pascal status_read_6A_2(char far *, int, int, int, int, int, long, long);
void __far __pascal status_read_6A_3(char far *, int, int, int, int, int, long, long);
void __far __pascal timer_value_read_1(char far *, int, int, int);
char far * __near __pascal track_calc_offset2(int);

void __near velo_pitch_arm_field(void)
{
	char far *v0;

	v0 = track_calc_offset2((unsigned char)G_PAD_NOTE_BASE[0]);
	switch (VELO_PITCH_CURSOR) { case 0: goto br_0600A; case 1: goto X_0605E; case 2: goto br_06020; case 3: goto br_06040; }
	VELO_PITCH_CURSOR = 1;
	goto X_0605E;
br_0600A:
	timer_value_read_1(G_PAD_NOTE_BASE, 0x37, 0xb, 0);
	WIN_FIELD_BOX_W = 0xa2;
	return;
br_06020:
	field_register_s8(v0 + 0x1c, -0x78, 0x78, 3, 0xcd, 0x1c, 0, 0, 0L);
	return;
br_06040:
	status_read_6A_3(G_VELOCITY_MAX, 1, 0x7f, 3, 0xcd, 0x28, 0L, 0L);
	return;
X_0605E:
	status_read_6A_2(v0 + 0xd, -0xf0, 0xf0, 3, 0x61, 0x1c, 0L, 0L);
}
