/* differs: 150 size 58, image 60; +1 image `enter 4, 0` CL `enter 2, 0`; 172 size 58, image 60; +1 image `enter 4, 0` CL `enter 2, 0` */
extern char PGM_TABLE[1];
int __far far_05700(void);

int __far smem_io_helper(void)
{
	int l2;
	int l4;
	int si_;

	l2 = far_05700();
	*(int *)PGM_TABLE = 0;
	*(int *)(PGM_TABLE + 2) = l2;
	si_ = PGM_TABLE;
	l4 = 0x17;
loop_057A6:
	l2 += *(int far *)*(char far * __near *)(char __near *)si_;
	*(int __near *)((char __near *)si_ + 4) = 0;
	*(int __near *)((char __near *)si_ + 6) = l2;
	si_ += 4;
	l4--;
	if (l4) goto loop_057A6;
	return l2;
}
