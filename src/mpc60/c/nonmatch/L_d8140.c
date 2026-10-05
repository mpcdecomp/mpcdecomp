/* differs: +6b jmp $6 | xor ax, ax */
extern char B_8DFC;

L_d8140(a0)
char *a0;
{
	char v14[14];
	char z0[7];
	char v22;
	int v24;
	register int r1;

	setmem(&v22, 22, 0);
	if (L_d7e33(B_8DFC, 0, 21, &v22) != 0)
		return 0;
	v24 = 0;
	for (; (unsigned)v24 < 22; ) {
		if (*a0 == 0)
			return 1;
		r1 = v24;
		if (*a0 != v14[r1])
			return 0;
		a0++;
		++v24;
	}
}
