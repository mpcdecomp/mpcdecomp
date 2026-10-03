/* differs: 150 size 362, image 368; +19 image `lea cx, [bp - 0x3a]` CL `lea ax, [bp - 0x3a]`; 172 size 362, image 368; +19 image `lea cx, [bp - 0x3a]` CL `lea ax, [bp - 0x3a]` */
struct s54 { char b[54]; };
char * __cdecl strcpy(char *, const char *);
#pragma intrinsic(strcpy)
extern char SMEM_POOL[1];
extern char SMEM_POOL_BASE_HI[1];
long __far addr_calc_segment(int, int, int);
int __far __pascal mem_io_handler(char far *, int, int, int);
int __far __pascal sample_access_caller(char far *, int);
long __far __pascal sample_desc_init(char far *);
long __far __pascal sample_pool_add(struct s54);
void __far __pascal smem_copy_buffered(long, long, int, int);

int __near __pascal zone_action_new_sample(char far *p6, long p4, long p2, char far *p0)
{
	char l10[10];
	char l58[48];
	int si_;

	*(long *)(l10 + 6) = p2 - p4;
	sample_desc_init(l58);
	*(long *)(l58 + 20) = 0L;
	*(long *)(l58 + 28) = *(long *)(l10 + 6);
	*(long *)(l58 + 24) = *(long *)(l58 + 28);
	*(long *)(l10 + 2) = addr_calc_segment(*(int *)(l58 + 32), *(int *)(l58 + 34), 0);
	l58[19] = p6[19];
	strcpy(l58, p0);
	if (sample_access_caller(p0, 1)) goto br_07F30;
loop_07F28:
	return 0;
br_07F30:
	switch (mem_io_handler(l10, *(int *)(l10 + 8), *(int *)(l10 + 6), l58[19])) { case 0: goto loop_07F28; }
	sample_pool_add(*(struct s54 *)l58);
	si_ = *(int far *)(p6 + 48);
	si_ += 5;
	si_ += 2;
	p4 += *(long *)(SMEM_POOL + si_);
	si_ = *(int *)l10;
	si_ += 5;
	si_ += 2;
	smem_copy_buffered(p4, *(int *)(SMEM_POOL_BASE_HI + si_), *(int *)(SMEM_POOL + si_), *(int *)(l58 + 30), *(int *)(l58 + 28));
	if (!p6[19]) goto L_07FFC;
	p4 += *(long far *)(p6 + 28) + 0xfL & 0xfffffff0L;
	smem_copy_buffered(p4, (*(long *)(l58 + 28) + 0xfL & 0xfffffff0L) + *(long *)(SMEM_POOL + *(int *)l10 * 10), *(int *)(l58 + 30), *(int *)(l58 + 28));
L_07FFC:
	return 1;
}
