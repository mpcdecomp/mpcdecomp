void __near __pascal int4A_sysex_wrapper(char __far *, int);

void __near __pascal string_scan_sysex(char ch, int v)
{
	char b[7];

	b[0] = 0xf0;
	b[1] = 0x7e;
	b[3] = 3;
	b[2] = ch;
	b[4] = v & 0x7f;
	b[5] = (v << 1) >> 8;
	b[6] = 0xf7;
	int4A_sysex_wrapper(b, 7);
}
