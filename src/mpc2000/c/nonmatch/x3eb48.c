/* differs: XL v1.20 +2D, 9 bytes */
void __far disp_list_run(char __near *);

void __far draw_unsigned_value(char p0, char p1, long p2, char p4)
{
	char l10[10];

	l10[0] = 0x17;
	l10[1] = p0;
	l10[2] = p1;
	l10[3] = p4;
	*(long *)(l10 + 4) = p2;
	l10[8] = 0;
	disp_list_run(l10);
}
