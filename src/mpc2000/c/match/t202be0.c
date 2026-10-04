void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(memset)
extern int BUF_XFER[26];
void __far __pascal flash_write_words(unsigned long, int __far *, int);

void __far X_02C66(void)
{
	int i;

	memset(BUF_XFER, 0, 0x800);
	for (i = 0; i < 0x32; i++) BUF_XFER[i] = 0x7fff;
	flash_write_words(0x12280L, BUF_XFER, 0x400);
}
