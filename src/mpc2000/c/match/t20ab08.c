extern char P_9DA0[386];
void __far __pascal lcd_region_helper(char __far *, char __far *);

/* the second of a program file's mix layouts: three flags as 0/1, three bytes, 64 mixes */
void __far __pascal lcd_line_clear(char __far *dst, char __far *src)
{
	int i;

	dst[0x16] = src[0x16];
	dst[0x17] = src[0x17] == 2;
	dst[0x18] = src[0x18] == 2;
	dst[0x19] = src[0x19] == 2;
	dst[0x1a] = src[0x1a];
	dst[0x1b] = src[0x1b];
	dst[0x1c] = src[0x1c];
	for (i = 0; i < 64; i++)
		lcd_region_helper(P_9DA0 + i * 6, src + 0x41 + i * 4);
}
