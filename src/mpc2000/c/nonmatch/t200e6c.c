/* differs: 150 size 86, image 112; +1 image `enter 6, 0` CL `enter 8, 0`; 172 size 86, image 112; +1 image `enter 6, 0` CL `enter 8, 0` */
extern char SMEM_POOL[1];
extern char SMEM_POOL_BASE_HI[1];
extern char SMEM_POOL_LEN[1];
extern char SMEM_POOL_NEXT[1];
extern int SMEM_POOL_USED;

long __far smem_alloc_top(void)
{
	long l4;
	int si_;
	int bx_;

	l4 = 0L;
	bx_ = SMEM_POOL_USED;
	if (bx_ == 0x82) goto br_00EF2;
L_00EA3:
	si_ = bx_;
	si_ += 5;
	si_ += 2;
	if (*(int *)(SMEM_POOL_BASE_HI + si_) & 0x100) goto br_00EE6;
	if (*(long *)(SMEM_POOL_LEN + si_) + *(long *)(SMEM_POOL + si_) <= l4) goto br_00EE6;
	l4 = *(long *)(SMEM_POOL_LEN + si_) + *(long *)(SMEM_POOL + si_);
br_00EE6:
	bx_ = *(int *)(SMEM_POOL_NEXT + si_);
	if (bx_ != 0x82) goto L_00EA3;
br_00EF2:
	return l4;
}
