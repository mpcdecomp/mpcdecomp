/* differs: 150 size 80, image 76; +8 image `mov di, word ptr [bp + 8]` CL `mov di, word ptr [bp + 0xa]`; 172 size 80, image 76; +8 image `mov di, word ptr [bp + 8]` CL `mov di, word ptr [bp + 0xa]` */
void __far __pascal cmd_exec_pair(int, int, int, int);
void __far __pascal cmd_ratio_setup(int, int, char);
int __far __pascal lcd_init_setup(int);

void __far __pascal lcd_init_display(int p2, int p1, int p0)
{
	int l2;
	int l4;

	l2 = p2;
	l4 = p1;
	cmd_ratio_setup(p2, p1, (char)(p0 >= 0 ? 0x20 : 0x2d));
	cmd_exec_pair(l2 + 6, l4, lcd_init_setup((p0 ^ (int)((unsigned long)(long)p0 >> 16)) - (int)((unsigned long)(long)p0 >> 16)), 4);
}
