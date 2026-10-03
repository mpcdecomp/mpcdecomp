/* differs: 150 size 46, image 42; +0 image `mov byte ptr [0x8a74], 4` CL `push bp`; 172 size 46, image 42; +0 image `mov byte ptr [0x8cb4], 4` CL `push bp` */
extern char WIN_FIELD_VAR[1];
extern char WIN_FIELD_MODE;
extern char TBL_WINKEYS_00CBA[1];
void __far far_02DC8(void);
void __far __pascal win_keys_merge(char far *);

void __far __pascal X_0356A(long p11, int x10, int x9, int x8, int x7, char p6, int x5, int x4, int x3, int x2, int x1, int x0)
{
	WIN_FIELD_MODE = 4;
	*(long *)WIN_FIELD_VAR = p11;
	win_keys_merge(TBL_WINKEYS_00CBA);
	if (p6 != 1) goto br_03590;
	far_02DC8();
br_03590:
	;
}
