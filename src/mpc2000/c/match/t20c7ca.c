void far * __cdecl _fmemcpy(void far *, const void far *, unsigned);
#pragma intrinsic(_fmemcpy)

int __far __pascal _memcpy_6(char far *p2, char far *p0)
{
	_fmemcpy(p2, p0, 0x28);
	return *(int *)&p0;
}
