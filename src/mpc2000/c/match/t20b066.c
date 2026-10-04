extern char P_3E48[1];

char __far __pascal midi_out_io(long r)
{
	if ((unsigned long)r >= 0x15888L) return 0x78;
	if ((unsigned long)r <= 0x5622) return 0x88;
	return P_3E48[(unsigned long)(r * 100 + 0x5622) / 0xac44];
}
