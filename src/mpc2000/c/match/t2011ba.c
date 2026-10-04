void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(memset)
extern int BUF_XFER[26];
void __far __pascal flash_write_words(unsigned long, int __far *, int);

void __far __pascal smem_fill(unsigned long base, char v, long n)
{
	unsigned k;

	memset(BUF_XFER, v, 0x800);
	do {
		k = n > 0x400 ? 0x400 : (unsigned)n;
		n -= k;
		flash_write_words(base + n, BUF_XFER, k);
	} while (n);
}
