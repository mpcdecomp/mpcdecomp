void far * __cdecl _fmemcpy(void far *, const void far *, unsigned);
#pragma intrinsic(_fmemcpy)

int __far __pascal lcd_line_copy(char far *p2, char far *p0)
{
	_fmemcpy(p2 + 4, p0, 0x18);
	p2[28] = 0;
	*(long far *)p2 = 0;
	return 0;
}
