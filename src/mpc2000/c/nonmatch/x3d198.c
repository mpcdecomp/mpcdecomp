/* differs: XL v1.20 +15, 69 bytes */
void __far draw_char_at(int, int, int);
void __far draw_fixed_decimal(int, int, long, int, int);
int __near lcd_init_setup(int);

void __near fn_3D198(int p0, int p1, int p2)
{
	int l2;
	int l4;

	l2 = p2;
	l4 = p1;
	draw_char_at(p0, l4, l2 >= 0 ? 0x20 : 0x2d);
	draw_fixed_decimal(p0 + 6, l4, (long)lcd_init_setup((l2 ^ (int)((unsigned long)(long)l2 >> 16)) - (int)((unsigned long)(long)l2 >> 16)), 2, 2);
}
