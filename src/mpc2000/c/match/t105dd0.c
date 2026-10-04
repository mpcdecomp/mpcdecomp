extern char G_PAD_NOTE_BASE[1];
extern char G_VELOCITY_MAX[1];
extern char WIN_FIELD_BOX_W;
extern char VELO_FILTER_CURSOR;
void __far __pascal status_read_6A_3();
void __far __pascal timer_value_read_1(char far *, int, int, int);
char far * __near __pascal track_calc_offset2(int);

void __near timer_poll_wait_4(void)
{
	char far *v0;

	v0 = track_calc_offset2((unsigned char)G_PAD_NOTE_BASE[0]);
	switch (VELO_FILTER_CURSOR) { case 0: goto X_05D88; case 1: goto X_05DE8; case 2: goto X_05DA0; case 3: goto X_05DB2; case 4: goto L_05DC4_1; case 5: goto L_05DD6_1; default: goto br_05D80; }
br_05D80:
	VELO_FILTER_CURSOR = 1;
	goto X_05DE8;
X_05D88:
	timer_value_read_1(G_PAD_NOTE_BASE, 0x37, 0xb, 0);
	WIN_FIELD_BOX_W = 0xa2;
	return;
X_05DA0:
	status_read_6A_3(v0 + 0x15, 0, 0x64, 3, 0x3d, 0x21, 0L, 0L);
	return;
X_05DB2:
	status_read_6A_3(v0 + 0x16, 0, 0x64, 3, 0x3d, 0x2b, 0L, 0L);
	return;
L_05DC4_1:
	status_read_6A_3(v0 + 0x1a, 0, 0x64, 3, 0xd3, 0x1c, 0L, 0L);
	return;
L_05DD6_1:
	status_read_6A_3(G_VELOCITY_MAX, 1, 0x7f, 3, 0xd3, 0x28, 0L, 0L);
	return;
X_05DE8:
	status_read_6A_3(v0 + 0x14, 0, 0x64, 3, 0x3d, 0x17, 0L, 0L);
}
