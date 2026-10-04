unsigned __far __pascal midi_out_io3(unsigned n)
{
	unsigned x;
	int i;

	if (n <= 1) return n;
	x = n >> 1;
	for (i = 9; i; i--)
		x = (n / x + x) >> 1;
	return x;
}
