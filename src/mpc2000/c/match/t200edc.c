struct SMEM_POOL {
	long base;
	long len;
	int next;
};
extern struct SMEM_POOL SMEM_POOL[131];
extern int SMEM_POOL_USED;
void __far __pascal input_handler(long, long, long);

/* the used blocks, lowest first, moved down to sit end to end */
void __far smem_compact(void)
{
	unsigned char b[0x82];
	long a;
	int n;
	int i;
	int k;

	i = SMEM_POOL_USED;
	n = 0;
	for (; i != 0x82; i = SMEM_POOL[i].next)
		if (!(SMEM_POOL[i].base & 0x1000000L))
			b[0x82 - ++n] = i;
	k = 0x82 - n;
	a = SMEM_POOL[b[k]].len + SMEM_POOL[b[k]].base;
	for (k++; k < 0x82; k++) {
		if (SMEM_POOL[b[k]].base != a) {
			input_handler(SMEM_POOL[b[k]].base, a, SMEM_POOL[b[k]].len);
			SMEM_POOL[b[k]].base = a;
		}
		a += SMEM_POOL[b[k]].len;
	}
}
