void __far __fstrncpy(char far *, long, int);
int __far far_3FE9E(char far *, char far *);
void __far sound_list_unlink(char far *);

void __far far_427A2(long p0)
{
	char far *l4;
	char l22[18];

	__fstrncpy(l22, p0, 0x10);
	l22[16] = 0;
	switch (far_3FE9E(&l4, l22)) { case 0: goto br_427E6; }
	if (!(l4[13] & 1)) goto br_427E6;
	sound_list_unlink(l4);
br_427E6:
	;
}
