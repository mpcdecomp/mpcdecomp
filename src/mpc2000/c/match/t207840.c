void far * __cdecl _fmemcpy(void far *, const void far *, unsigned);
#pragma intrinsic(_fmemcpy)
typedef struct { int quot, rem; } div_t;
extern unsigned char B_2D7F;
extern char STR_DEFAULT_SOUND_NAME[1];
div_t __far div(int, int);
long __far __pascal sample_ptr_access(char far *);

void __far __pascal timer_fdc_sync(char far *p0)
{
	div_t d;

	_fmemcpy(p0, STR_DEFAULT_SOUND_NAME, 0x11);
	for (;;) {
		d = div(B_2D7F, 100);
		p0[5] = d.quot + '0';
		d = div(d.rem, 10);
		p0[6] = d.quot + '0';
		p0[7] = d.rem + '0';
		if (!sample_ptr_access(p0)) break;
		B_2D7F++;
	}
}
