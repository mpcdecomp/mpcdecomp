/* differs: +57 add word ptr -2[bp],4 | mov bx, word ptr [bp - 2] */
extern char B_A61C;
extern char *W_A61A;

far_d956b(a0)
unsigned char *a0;
{
	int *v2;
	int v4;
	char v5;
	char v6;
	char z0[23];
	char v30;
	char *v32;

	far_d8880(&v5, &v6);
	*W_A61A++ = 8;
	*W_A61A++ = v5;
	*W_A61A++ = v6;
	*W_A61A++ = 8;
	*W_A61A++ = 21;
	v2 = W_A61A;
	v2 += 2;
	*v2 = a0;
	W_A61A = v2;
	*W_A61A++ = 8;
	*W_A61A = 0;
	far_e9e6d(*a0, &v30);
	v32 = &v30;
	v4 = 0;
	do {
		if (*v32 != 0) {
			v32++;
			far_d8837(*v32++);
		}
		else
			far_d8837(32);
		++v4;
	} while (v4 < 21);
	B_A61C = 0;
	return;
}
