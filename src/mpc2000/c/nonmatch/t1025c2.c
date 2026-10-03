/* differs: 150 size 90, image 92; +1 image `enter 0xc, 0` CL `enter 0xa, 0`; 172 size 90, image 92; +1 image `enter 0xc, 0` CL `enter 0xa, 0` */
extern long SMEM_SIZE;
long __far smem_alloc_top(void);
int __near __pascal smem_pool_insert(int, int, int, int, int);

int __far __pascal smem_alloc(long p0)
{
	int l4;
	long l8;
	long l12;
	int v0;

	p0 += 0xfL;
	l12 = smem_alloc_top();
	l8 = p0 & 0xfffffff0L;
	if (l8 + l12 <= SMEM_SIZE) goto br_02574;
loop_0256D:
	return -1;
br_02574:
	v0 = smem_pool_insert(l4, ((int *)&l8)[1], *(int *)&l8, ((int *)&l12)[1], *(int *)&l12);
	if (v0 == 0x82) goto loop_0256D;
	return v0;
}
