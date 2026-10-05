/* differs: +7 mov ax,word ptr 10[bp] | mov dx, word ptr [bp + 0ah] */
extern char B_94A6[];
extern char B_A06E;
extern int W_8CD1;
extern int W_A06F;

long far_eae2e(a0, a1, a2)
char *a0;
{
	int v2;
	int v4;
	int v6;
	char *v8;
	int v10;
	char v11;
	char v12;

	v10 = a2;
	v12 = a1;
	v11 = 1;
	v12 = 0;
	if (*a0 < 0 || v10 < W_8CD1 + 1) {
		v10 = W_8CD1 + 1;
		return v12;
	}
	if (a0 == B_94A6 && B_A06E != 0) {
		v8 = -0x5f7b;
		v6 = W_A06F;
	}
	else {
		v8 = a0 + 570;
		v6 = *(int *)(a0 + 48);
	}
	if (v10 > v6 + W_8CD1) {
		v10 = v6 + W_8CD1 + 1;
		return v12;
	}
	far_d7241(a0);
	v10 = a2;
	v12 = a1;
	v2 = 1;
	v4 = 0;
	while ((unsigned)v10 >= *(int *)v8)
		v8 += 4;
	v8 += 0xfffc;
	v2 = v8[2];
	v4 = 384 / v8[3];
	if (v11 < 1)
		v11 = 1;
	if (v11 > v2)
		v11 = v2;
	if (v12 >= v4)
		v12 = v4 - 1;
	return v12;
}
