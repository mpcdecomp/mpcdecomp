extern char G_FLAG_8CA8;
extern char WIN_FIELD_DIGITS;
extern long NUM_ENTRY_VALUE;

void __far __fastcall __loadds seq_read_data(char key)
{
	char i;
	long m;

	if (!G_FLAG_8CA8) {
		G_FLAG_8CA8 = 1;
		NUM_ENTRY_VALUE = (unsigned char)key;
		return;
	}
	for (i = 1, m = 1; i < WIN_FIELD_DIGITS; i++)
		m *= 10;
	NUM_ENTRY_VALUE = NUM_ENTRY_VALUE % m * 10 + (unsigned char)key;
}
