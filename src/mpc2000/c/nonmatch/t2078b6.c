/* differs: 150 size 250, image 254; +14 image `je +24` CL `je +18`; 172 size 250, image 254; +14 image `je +24` CL `je +18` */
struct s54 { char b[54]; };
void far * __cdecl _fmemcpy(void far *, const void far *, unsigned);
char * __cdecl strcpy(char *, const char *);
#pragma intrinsic(_fmemcpy, strcpy)
extern int G_ERRNO;
extern char SMEM_POOL[1];
extern char SMEM_POOL_BASE_HI[1];
extern char SMEM_POOL_LEN[1];
extern char SMEM_POOL_LEN_HI[1];
int __far sample_caller_setup(void);
long __far __pascal sample_pool_add(struct s54);
long __far __pascal sample_ptr_access(char far *);
int __far __pascal smem_alloc(int, int);
void __far __pascal smem_copy_buffered(int, int, int, int, int, int);

long __far __pascal sample_ptr_accessor(char far *p2, char far *p0)
{
	char l56[56];
	int si_;
	int di_;

	if (!sample_ptr_access(p2)) goto T2_br_07CB8;
	G_ERRNO = 8;
loop_07CAF:
	return 0L;
T2_br_07CB8:
	if (sample_caller_setup()) goto br_07CCA;
	G_ERRNO = 9;
	goto loop_07CAF;
br_07CCA:
	*(int *)(l56 + 54) = smem_alloc(*(int *)(SMEM_POOL_LEN_HI + *(int far *)(p0 + 48) * 10), *(int *)(SMEM_POOL_LEN + *(int far *)(p0 + 48) * 10));
	if (*(int *)(l56 + 54) + 1) goto br_t2_07CF6;
	G_ERRNO = 1;
	goto loop_07CAF;
br_t2_07CF6:
	si_ = *(int far *)(p0 + 48);
	si_ += 5;
	si_ += 2;
	di_ = *(int *)(l56 + 54);
	di_ += 5;
	di_ += 2;
	smem_copy_buffered(*(int *)(SMEM_POOL_BASE_HI + si_), *(int *)(SMEM_POOL + si_), *(int *)(SMEM_POOL_BASE_HI + di_), *(int *)(SMEM_POOL + di_), *(int *)(SMEM_POOL_LEN_HI + si_), *(int *)(SMEM_POOL_LEN + si_));
	_fmemcpy((char far *)l56, p0, 0x36);
	strcpy(l56, p2);
	*(int *)(l56 + 48) = *(int *)(l56 + 54);
	return sample_pool_add(*(struct s54 *)l56);
}
