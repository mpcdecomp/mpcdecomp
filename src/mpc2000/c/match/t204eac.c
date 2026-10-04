int __far __pascal lcd_init_setup(int v)
{
	return v / 256 * 100 + (v % 256 * 100 + 0x80) / 256;
}
