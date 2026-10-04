/* differs: 150 +8 image `lea ax, [bp - 0x1e]` CL `lea ax, [bp - 0x24]`; 172 +8 image `lea ax, [bp - 0x1e]` CL `lea ax, [bp - 0x24]` */
struct s54 { char b[54]; };
char * __cdecl strcpy(char *, const char *);
#pragma intrinsic(strcpy)
extern int G_ERRNO;
int __far _setjmp(char far *);
void __far _longjmp(char far *, int);
void __far err_msg_report(void);
int __far int2F_call_fn6(char far *, int);
long __far __pascal sample_desc_init(char far *);
long __far __pascal sample_pool_add(struct s54);
int __far __pascal smem_block_alloc(char far *, int, int);

int __far __pascal sample_create(int p0)
{
	char l12[12];
	char l30[18];
	char l60[30];
	char l66[6];
	char l114[48];

	G_ERRNO = _setjmp(l30);
	if (G_ERRNO) goto br_0C452;
	if (int2F_call_fn6(l60, 0x1d) == 0x1d) goto br_0C326;
	_longjmp(l30, 4);
br_0C326:
	if (p0 != 1) goto br_0C34F;
	if (int2F_call_fn6(l12, 8) == 8) goto br_0C34F;
	_longjmp(l30, 4);
br_0C34F:
	sample_desc_init(l114);
	strcpy(l114, l60);
	*(long *)(l114 + 20) = (unsigned long)0x28 * (unsigned)*(int *)(l60 + 21);
	*(long *)(l114 + 24) = (unsigned long)0x28 * (unsigned)*(int *)(l60 + 23);
	l114[18] = 0xef;
	*(long *)(l114 + 28) = *(long *)(l60 + 17);
	if (*(long *)(l114 + 20) <= *(long *)(l114 + 28)) goto tgt_0C3BE;
	*(long *)(l114 + 20) = *(long *)(l114 + 28);
tgt_0C3BE:
	if (*(int *)(l114 + 26) < *(int *)(l114 + 30)) goto br_0C3D6;
	if (*(int *)(l114 + 26) > *(int *)(l114 + 30)) goto br_0C3D0;
	if ((unsigned)*(int *)(l114 + 24) <= (unsigned)*(int *)(l114 + 28)) goto br_0C3D6;
br_0C3D0:
	*(long *)(l114 + 24) = *(long *)(l114 + 28);
br_0C3D6:
	if (p0 != 1) goto br_0C3EA;
	l114[18] = l12[1] - 0x11;
	l114[17] = l12[0];
br_0C3EA:
	if (smem_block_alloc(l66, *(int *)(l60 + 19), *(int *)(l60 + 17))) goto br_0C40F;
	_longjmp(l30, G_ERRNO);
br_0C40F:
	*(long *)(l12 + 8) = sample_pool_add(*(struct s54 *)l114);
	if (*(long *)(l12 + 8)) goto br_0C447;
	_longjmp(l30, 9);
br_0C447:
	return (int)*(long *)(l12 + 8);
br_0C452:
	err_msg_report();
	return 0;
}
