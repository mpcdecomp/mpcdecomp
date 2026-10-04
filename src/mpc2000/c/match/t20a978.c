struct s26 { char b[26]; };
struct s64 { char b[64]; };
unsigned __far __cdecl _fstrlen(const char __far *);
void __far * __far __cdecl _fmemset(void __far *, int, unsigned);
#pragma intrinsic(_fstrlen, _fmemset)
void __far __pascal lcd_line_copy(char __far *, char __far *);
void __far __pascal lcd_region_helper(char __far *, char __far *);

/* a program record from a file's older layout: the name padded out to 16, then as lcd_region_copy */
void __far __pascal lcd_buffer_copy(char __far *dst, char __far *src)
{
	int n;
	int i;

	*(struct s26 __far *)(dst + 2) = *(struct s26 __far *)src;
	n = _fstrlen(dst + 2);
	if (n < 16) _fmemset(dst + 2 + n, ' ', 16 - n);
	dst[0x12] = 0;
	*(struct s64 __far *)(dst + 0x8de) = *(struct s64 __far *)(src + 0x73e);
	for (i = 0; i < 64; i++) {
		lcd_line_copy(dst + 0x1e + i * 0x1d, src + 0x3e + i * 0x18);
		lcd_region_helper(dst + 0x75e + i * 6, src + 0x63e + i * 4);
	}
}
