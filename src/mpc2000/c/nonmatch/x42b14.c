/* differs: XL v1.20 +1, 97 bytes */
long __far fs_read(long, int, unsigned);
void __far smem_write_block(long, int, int, unsigned);

long __far fs_read_to_smem(long p0, char far *p2)
{
	long l4;
	unsigned si_;
	unsigned ax_;
	char far *v0;
	char far *v1;

	v0 = 0L;
	l4 = p0;
	if (!p2) goto br_42B8F;
loop_42B36:
	ax_ = *(int *)&p2;
	if (p2 < 0L) goto br_42B4A;
	if (p2 > 0L) goto br_42B47;
	if (ax_ <= 0x800) goto br_42B4A;
br_42B47:
	ax_ = 0x800;
br_42B4A:
	si_ = ax_;
	v1 = fs_read(0x7f000000L, 2, si_);
	v0 = v1;
	if (v0) goto br_42B8F;
	smem_write_block(l4, 0, 0x7f00, si_);
	l4 += (unsigned long)si_;
	p2 -= (unsigned long)si_;
	if (p2) goto loop_42B36;
br_42B8F:
	return v0;
}
