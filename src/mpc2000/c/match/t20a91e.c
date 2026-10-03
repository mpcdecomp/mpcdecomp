void far * __cdecl _fmemcpy(void far *, const void far *, unsigned);
#pragma intrinsic(_fmemcpy)

int __far __pascal _memcpy_1650C(char far *p2, char far *p0)
{
	_fmemcpy(p2 + 4, p0, 0x19);
	*(long far *)p2 = 0;
	return 0;
}
