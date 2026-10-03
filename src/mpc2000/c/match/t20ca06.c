void __far __fstrncpy(char far *, long, int);
int __far __pascal sample_check_active(char far *);
char far * __far __pascal sample_ptr_access(char far *);
void __far __pascal sample_validate_ptr(char far *);
void __far __pascal smem_proc_wrapper(char far *);

void __far __pascal sample_access_triple(long p0)
{
	char l22[18];
	char far *v0;

	__fstrncpy(l22, p0, 0x10);
	l22[16] = 0;
	v0 = sample_ptr_access(l22);
	switch (sample_check_active(v0)) { case 0: goto tgt_0CEB2; }
	smem_proc_wrapper(v0);
	sample_validate_ptr(v0);
tgt_0CEB2:
	;
}
