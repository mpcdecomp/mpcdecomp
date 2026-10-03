struct smem_pool { long base; long len; int rest; };
struct smem_req {
	char pad[0x14];
	unsigned long a_start, b_start, a_end, b_end;
	char pad2[0x16];
	unsigned char flags;
};
extern int G_ERRNO;
extern char P_9D42[1];
extern struct smem_pool SMEM_POOL[1];
void __far _longjmp(char far *, int);
int __far __pascal mem_io_handler(int far *, unsigned long, int);
long __far __pascal far_memop_caller(long, unsigned long);
void __near __pascal status_smem_read(long);
void __far __pascal smem_free(int);
int __far __pascal smem_alloc(long);

int __near __pascal smem_access_setup(struct smem_req far *p)
{
	int h;
	unsigned long n2;
	unsigned long n1;
	long size;
	long base;
	unsigned long len;

	switch (p->flags & 0x60) {
	default:
		n1 = ((p->a_end - p->a_start) >> 1) + 1;
		n2 = ((p->b_end - p->b_start) >> 1) + 1;
		len = n1 > n2 ? n2 : n1;
		if (!mem_io_handler(&h, len, 1)) _longjmp(P_9D42, G_ERRNO);
		base = SMEM_POOL[h].base;
		size = SMEM_POOL[h].len;
		smem_free(h);
		if (p->a_start < p->b_start) {
			if (far_memop_caller(base, len) != len) _longjmp(P_9D42, G_ERRNO);
			status_smem_read((n1 - len) * 2);
			if (far_memop_caller(size / 2 + base, len) != len) _longjmp(P_9D42, G_ERRNO);
		} else {
			if (far_memop_caller(size / 2 + base, len) != len) _longjmp(P_9D42, G_ERRNO);
			status_smem_read((n2 - len) * 2);
			if (far_memop_caller(base, len) != len) _longjmp(P_9D42, G_ERRNO);
		}
		break;
	case 0x20:
		len = ((p->a_end - p->a_start) >> 1) + 1;
		goto one;
	case 0x40:
		len = ((p->b_end - p->b_start) >> 1) + 1;
	one:
		if (!mem_io_handler(&h, len, 0)) _longjmp(P_9D42, G_ERRNO);
		base = SMEM_POOL[h].base;
		size = SMEM_POOL[h].len;
		smem_free(h);
		if (far_memop_caller(base, len) != len) _longjmp(P_9D42, G_ERRNO);
		break;
	}
	h = smem_alloc(size);
	if (h == -1 || SMEM_POOL[h].base != base) {
		if (h != -1) smem_free(h);
		_longjmp(P_9D42, 5);
	}
	return h;
}
