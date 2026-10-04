long __far __pascal midi_out_io3(unsigned);

int __far __pascal midi_io_chain(int a, int b)
{
	if (b) return (int)midi_out_io3(a * 2);
	return (a * a + 1) / 2;
}
