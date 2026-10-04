typedef struct { long quot, rem; } ldiv_t;
ldiv_t __cdecl ldiv(long, long);
extern int G_WAVE_COLS_DONE;
extern long G_WAVE_SMEM_START;
extern long G_WAVE_SMEM_END;

long __far string_op_setup(void)
{
	ldiv_t q;

	q = ldiv(G_WAVE_SMEM_END - G_WAVE_SMEM_START, (long)(0xf5 - G_WAVE_COLS_DONE));
	if ((0xf5 - G_WAVE_COLS_DONE) / 2 < q.rem) q.quot++;
	return q.quot;
}
