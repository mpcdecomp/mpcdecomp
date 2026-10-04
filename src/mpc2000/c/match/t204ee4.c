typedef struct { int quot, rem; } div_t;
div_t __cdecl div(int, int);

int __far __pascal voice_ratio_calc(int v)
{
	div_t d;

	d = div(v, 100);
	return (d.quot << 8) + (d.rem << 8) / 100;
}
