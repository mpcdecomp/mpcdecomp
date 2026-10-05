/* differs: +137 mov bx,si | shl si, 1 */
far_e73c1(a0, a1, a2, a3, a4)
int *a3;
char *a4;
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;
	int v74[32];
	char v108[34];
	char v109;
	char v110;
	register int r1;
	register int r2;

	far_d7b8c(0);
	if ((v6 = far_d7b8c(2, a0)) < 0)
		return v6;
	if ((v4 = far_d7b8c(4, a4, v6, 2)) != 0)
		return v4;
	if (*a4 != 2 && *a4 != 5 || a4[1] > 1)
		return -9;
	a3[1] = 0;
	*a3 = 0;
	if ((v4 = far_d7b8c(4, a3, v6, 3)) != 0)
		return v4;
	if ((v4 = far_d7b8c(4, a1, v6, 0x7d6)) != 0)
		return v4;
	if (*a4 == 5) {
		if ((v4 = far_d7b8c(4, &v110, v6, 1)) != 0)
			return v4;
	}
	if ((v4 = far_d7b8c(4, a2, v6, 34)) != 0)
		return v4;
	v109 = 1;
	if (*a4 == 2 || a4[1] == 0) {
		if ((v4 = far_d7b8c(4, &v109, v6, 1)) != 0)
			return v4;
	}
	v2 = 0;
	do {
		r1 = v2;
		v74[r1] = 0x2000;
		++v2;
	} while (v2 < 32);
	if (v109 != 0) {
		if ((v4 = far_d7b8c(4, v74, v6, 32)) != 0)
			return v4;
		if ((v4 = far_d7b8c(4, v74, v6, 32)) != 0)
			return v4;
		if ((v4 = far_d7b8c(4, v74, v6, 32)) != 0)
			return v4;
		if ((v4 = far_d7b8c(4, v74, v6, 64)) != 0)
			return v4;
	}
	setmem(v108, 34, -1);
	v10 = 0;
	do {
		r1 = a2;
		if (*(char *)(v10 + r1) >= 0 && *(char *)(v10 + r1) < 34) {
			r2 = *(char *)(v10 + r1);
			v108[r2] = v10;
		}
		v10++;
	} while (v10 < 34);
	v2 = 0;
	do {
		v8 = 0;
		r1 = v2;
		if ((v10 = v108[r1]) >= 0) {
			v10 -= 2;
			if (v10 < 0)
				v10 = 0;
			r2 = v10;
			v8 = v74[r2];
		}
		*(int *)((char *)(r1 * 59 + a1) + 26) = v8;
		((char *)(v2 * 59 + a1))[58] = v10;
		if (a4[1] < 1) {
			((char *)(v2 * 59 + a1))[44] = 100;
			*(int *)((char *)(v2 * 59 + a1) + 28) = 0;
			*(int *)((char *)(v2 * 59 + a1) + 50) = 0;
			*(int *)((char *)(v2 * 59 + a1) + 48) = 0;
			((char *)(v2 * 59 + a1))[45] = 100;
		}
		v2++;
	} while (v2 < 34);
	return 0;
}
