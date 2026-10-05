/* differs: +64 add word ptr -2[bp],4 | mov bx, word ptr [bp - 2] */
extern char B_A61C;
extern char *W_A61A;

fn_d9254(a0, a1, a2, a3, a4)
char *a1;
char a2;
int *a3;
char a4;
{
	int *v2;
	char *v4;
	char v5;
	char v6;
	char v7;
	char v8;
	char v9;

	far_d885c(a0);
	far_d8880(&v6, &v7);
	*W_A61A++ = 11;
	*W_A61A++ = v6;
	*W_A61A++ = v7;
	*W_A61A++ = 6;
	*W_A61A++ = a4;
	v2 = W_A61A;
	v2 += 2;
	*v2 = a1;
	v2 += 2;
	*v2 = a3;
	W_A61A = v2;
	*W_A61A = a2 & 7;
	v8 = *W_A61A++;
	v8 = far_d97a3(v8);
	*W_A61A++ = 11;
	*W_A61A = 0;
	v9 = *a1;
	if ((v8 & v9) != 0)
		v4 = a3[1];
	else
		v4 = *a3;
	v5 = 0;
	for (; v5 < a4; ++v5) {
		if (*v4 != 0) {
			v4++;
			far_d8837(*v4++);
			continue;
		}
		far_d8837(32);
	}
	B_A61C = 0;
	return;
}
