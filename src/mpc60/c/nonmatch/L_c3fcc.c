/* differs: +11 jmp $8 | jmp L_c4007 */
L_c3fcc(a0, a1)
{
	char v1;
	char v2;
	register int r1;
	register int r2;

	v2 = 0;
	v1 = 0;
	for (; v1 < 8; ) {
		r1 = v1;
		if (*(char *)(a0 + r1) == 32)
			break;
		r2 = v1;
		r1 = v2++;
		*(char *)(a1 + r1) = *(char *)(a0 + r2);
		++v1;
	}
	r1 = v2++;
	*(char *)(a1 + r1) = 46;
	v1 = 8;
	for (; v1 < 11; ) {
		r1 = v1;
		if (*(char *)(a0 + r1) == 32)
			break;
		r2 = v1;
		r1 = v2++;
		*(char *)(a1 + r1) = *(char *)(a0 + r2);
		++v1;
	}
	r1 = v2;
	*(char *)(a1 + r1) = 0;
	return;
}
