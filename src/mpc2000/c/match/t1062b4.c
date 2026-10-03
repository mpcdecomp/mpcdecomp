extern char G_MUTE_ASSIGN_FIELD;
extern char G_PAD_NOTE_BASE[1];
extern char WIN_FIELD_BOX_W;
void __far __pascal timer_value_read_1(char far *, int, int, int);
char far * __near __pascal track_calc_offset2(int);

void __near mute_assign_row_dispatch(void)
{
	char far *v0;

	v0 = track_calc_offset2((unsigned char)G_PAD_NOTE_BASE[0]);
	switch (G_MUTE_ASSIGN_FIELD) { case 0: goto br_06256; case 1: goto L_0626E; case 2: goto br_06262; }
	G_MUTE_ASSIGN_FIELD = 1;
	goto L_0626E;
br_06256:
	timer_value_read_1(G_PAD_NOTE_BASE, 0x37, 0xb, 0);
	WIN_FIELD_BOX_W = 0xa2;
	return;
br_06262:
	timer_value_read_1(v0 + 0xc, 0x37, 0x27, 1);
	WIN_FIELD_BOX_W = 0xa2;
	return;
L_0626E:
	timer_value_read_1(v0 + 0xb, 0x37, 0x1e, 1);
	WIN_FIELD_BOX_W = 0xa2;
}
