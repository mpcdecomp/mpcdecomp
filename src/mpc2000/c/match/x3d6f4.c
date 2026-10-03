extern char P_647E;
void __near int4a_sysex_wrapper(char far *, int);

void __near fn_3D6F4(char p0, char p1)
{
	char l6[6];

	l6[0] = 0xf0;
	l6[1] = 0x7e;
	l6[2] = P_647E;
	l6[3] = p0;
	l6[4] = p1 & 0x7f;
	l6[5] = 0xf7;
	int4a_sysex_wrapper(l6, 6);
}
