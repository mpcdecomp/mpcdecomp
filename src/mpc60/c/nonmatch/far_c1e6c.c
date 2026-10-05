/* differs: +20 mov ax,word ptr -4[bp] | mov byte ptr [bp - 1], al */
far_c1e6c(a0, a1)
char *a0;
{
	char v1;
	char v2;
	int v4;
	register int r1;
	register int r2;

	v4 = a0[11] != 0 ? 16 : 8;
	v2 = 0;
	v1 = v4;
	while (v1-- != 0) {
		r1 = v1;
		if (a0[r1] != 32) {
			v2 = v1 + 1;
			do {
				r1 = v1;
				r2 = v1;
				*(char *)(a1 + r2) = a0[r1];
				v1--;
			} while (v1-- != 0);
			break;
		}
	}
	r1 = v2++;
	*(char *)(a1 + r1) = 46;
	v1 = v4;
	for (; v1 < v4 + 3; ) {
		r1 = v1;
		r2 = v2++;
		*(char *)(a1 + r2) = a0[r1];
		++v1;
	}
	r1 = v2;
	*(char *)(a1 + r1) = 0;
	return;
}
