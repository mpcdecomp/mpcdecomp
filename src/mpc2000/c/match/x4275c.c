void __far __fstrncpy(char far *, long, int);
int __far far_3FE9E(char far *, char far *);

int __far far_4275C(long p0)
{
	char far *l4;
	char l22[18];

	__fstrncpy(l22, p0, 0x10);
	l22[16] = 0;
	switch (far_3FE9E(&l4, l22)) { case 0: goto br_4279E; }
	if (l4[13] & 1) {
		return 1;
	}
br_4279E:
	return 0;
}
