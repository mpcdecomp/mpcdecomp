void far * __cdecl _fmemset(void far *, int, unsigned);
#pragma intrinsic(_fmemset)

void __far __pascal _memset_2(char far *p0)
{
	_fmemset(p0, 0, 0x1d);
	p0[5] = 0;
	p0[6] = 0x2c;
	p0[8] = 0x58;
	p0[18] = 0x64;
	p0[23] = 0x64;
	p0[10] = 0;
	p0[17] = 0;
	p0[27] = 0;
}
