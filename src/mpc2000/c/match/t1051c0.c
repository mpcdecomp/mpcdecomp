extern unsigned char G_PAD_NOTE_BASE;
void __far __pascal status_read_6A_3(char far *, unsigned char, int, int, int, int, long, long);
char far * __near __pascal track_calc_offset(int);

void __near X_05140(void)
{
	char far *v0;

	v0 = track_calc_offset(G_PAD_NOTE_BASE);
	status_read_6A_3(v0 + 8, (char)(v0[6] + 1), 0x64, 3, 0x92, 0x27, 0L, 0L);
}
