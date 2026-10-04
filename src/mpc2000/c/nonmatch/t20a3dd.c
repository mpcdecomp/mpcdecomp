/* differs: 150 size 118, image 275; +0 image `push ds` CL `enter 0x1e, 0`; 172 size 118, image 275; +0 image `push ds` CL `enter 0x1e, 0` */
char * __cdecl strcat(char *, const char *);
char * __cdecl strcpy(char *, const char *);
#pragma intrinsic(strcat, strcpy)
extern char STR_EXT_SND_2[1];
extern char STR_EXT_SND_3[1];
int __far int2F_bcd_wrapper(void);
long __far __pascal memcpy_far_handler(char far *);
long __far __pascal sample_name_lookup(char far *);

int __far __pascal T2_br_0A7E1(char far *p3, long p1, int x0)
{
	char l26[26];
	int si_;
	char far *v0;

	strcpy(l26, p3);
	strcat(l26, STR_EXT_SND_2);
	*(long *)(l26 + 22) = memcpy_far_handler(l26);
loop_0A847:
	si_ = *(int *)(l26 + 22);
	goto br_0A8E9;
	*(long *)(l26 + 22) = p1;
	if (*(long *)(l26 + 22)) goto br_0A8CE;
	if (int2F_bcd_wrapper() == 2) goto br_0A8CE;
	strcpy(l26, p3);
	strcat(l26, STR_EXT_SND_3);
	*(long *)(l26 + 22) = memcpy_far_handler(l26);
br_0A8CE:
	if (*(char far * *)(l26 + 22)) goto loop_0A847;
	v0 = sample_name_lookup(p3);
br_0A8E9:
	return *(int *)&v0;
}
