struct s27 { char b[27]; };
struct s64 { char b[64]; };
void __far __pascal _memcpy_1650C(char __far *, char __far *);
void __far __pascal lcd_region_helper(char __far *, char __far *);

/* a program record from a file's 2K layout: the name, the pad map, 64 pads and mixes */
void __far __pascal lcd_region_copy(char __far *dst, char __far *src)
{
	int i;

	*(struct s27 __far *)(dst + 2) = *(struct s27 __far *)src;
	*(struct s64 __far *)(dst + 0x8de) = *(struct s64 __far *)(src + 0x75b);
	for (i = 0; i < 64; i++) {
		_memcpy_1650C(dst + 0x1e + i * 0x1d, src + 0x1b + i * 0x19);
		lcd_region_helper(dst + 0x75e + i * 6, src + 0x65b + i * 4);
	}
}
