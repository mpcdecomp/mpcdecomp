/* differs: XL v1.20 +27, 9 bytes */
void __far disp_list_run(char __near *);

void __far draw_string_at(char p0, char p1, long p2)
{
	char l8[8];

	l8[0] = 0x1e;
	l8[1] = p0;
	l8[2] = p1;
	*(long *)(l8 + 3) = p2;
	l8[7] = 0;
	disp_list_run(l8);
}
