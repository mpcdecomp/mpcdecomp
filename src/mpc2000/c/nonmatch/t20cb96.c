/* differs: 150 +B image `lea ax, [bp - 0x3c]` CL `lea ax, [bp - 0x40]`; 172 +B image `lea ax, [bp - 0x3c]` CL `lea ax, [bp - 0x40]` */
void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(memset)
extern int G_ERRNO;
extern char SMEM_POOL[1];
extern char SMEM_POOL_BASE_HI[1];
extern char SMEM_POOL_LEN[1];
extern char SMEM_POOL_LEN_HI[1];
void __far __pascal _memcpy_6(char far *, char far *);
int __far __pascal bcd_display_calc(char far *, int);
int __far __pascal bcd_time_format(int, int, int, int);
int __far int2F_call_fn14(long);
void __far int2F_dispatch_10(void);
int __far __pascal mem_block_process(long, int);

int __far __pascal ctrl_io_setup(char far *p2, long p0)
{
	char l20[20];
	char l60[40];
	char l64[4];

	_memcpy_6(l60, p2);
	l64[0] = 0x81;
	l64[1] = 4;
	*(int *)(l64 + 2) = 0x38;
	*(long *)(l20 + 16) = *(long *)(SMEM_POOL_LEN + *(int far *)(p2 + 48) * 10);
	memset(l20, 0, 0x10);
	if (int2F_call_fn14(p0)) goto br_0D068;
	G_ERRNO = 0xd;
loop_0D05E:
	return 1;
br_0D068:
	switch (mem_block_process(p0, 0)) { case 0: goto br_0D0BF; }
	switch (bcd_display_calc(l64, 0x40)) { case 0: goto br_0D0BA; }
	switch (bcd_time_format(*(int *)(SMEM_POOL_BASE_HI + *(int far *)(p2 + 48) * 10), *(int *)(SMEM_POOL + *(int far *)(p2 + 48) * 10), *(int *)(SMEM_POOL_LEN_HI + *(int far *)(p2 + 48) * 10), *(int *)(SMEM_POOL_LEN + *(int far *)(p2 + 48) * 10))) { case 0: goto br_0D0BA; }
	int2F_dispatch_10();
	goto loop_0D05E;
br_0D0BA:
	int2F_dispatch_10();
br_0D0BF:
	return 0;
}
