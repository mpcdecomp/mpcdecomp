extern int G_ERRNO;
extern int BUF_XFER[512];
int __far int2F_call_fn6(int __far *, int);
void __far __pascal flash_write_words(unsigned long, int __far *, int);

long __far __pascal far_memop_caller(unsigned long dst, long n)
{
	unsigned long p;
	int k;
	int b;

	p = dst;
	while (n) {
		k = n > 0x400 ? 0x400 : (int)n;
		if (int2F_call_fn6(BUF_XFER, b = k + k) != b) {
			G_ERRNO = 2;
			return -1;
		}
		flash_write_words(p, BUF_XFER, k);
		p += k;
		n -= k;
	}
	return p - dst;
}
