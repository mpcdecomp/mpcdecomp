void __far * __cdecl _fmemset(void __far *, int, unsigned);
#pragma intrinsic(_fmemset)
extern char TBL_FILENAME_CHARSET[1];

char __far * __near __pascal lcd_screen_helper(char __far *dst, char __far *src)
{
	int i;

	for (i = 0; i < 12; i++)
		dst[i] = TBL_FILENAME_CHARSET[src[i]];
	for (i = 11; i >= 0; i--)
		if (dst[i] != ' ') break;
	for (; i >= 0; i--)
		if (dst[i] == ' ') dst[i] = '_';
	for (i = 12; i < 16; i++) dst[i] = ' ';
	dst[16] = 0;
	return dst;
}
