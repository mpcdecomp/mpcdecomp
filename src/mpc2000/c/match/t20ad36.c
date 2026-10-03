void far * __cdecl _fmemcpy(void far *, const void far *, unsigned);
#pragma intrinsic(_fmemcpy)
long __far __pascal sample_desc_init(char far *);

int __far __pascal sample_data_copy(char far *p2, char far *p0)
{
	sample_desc_init(p2);
	_fmemcpy(p2, p0, 0x20);
	*(long far *)(p2 + 32) = 0L;
	*(long far *)(p2 + 50) = 0L;
	p2[37] = 1;
	return 0;
}
