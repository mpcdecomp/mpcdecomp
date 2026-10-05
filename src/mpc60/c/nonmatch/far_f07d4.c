/* differs: +87 sub dx,dx | cmp dx, word ptr [bp - 2] */
extern char B_94A6;
extern char B_981C;
extern char B_9D34;
extern int W_9822;
extern int W_9824;
extern int W_9826;
extern int W_9828;
extern long W_982E;
long far_daa02();

long far_f07d4(a0, a1, a2)
{
	long v4;
	long v8;
	long v12;

	if (B_9D34 == a0 && B_94A6 == 0)
		far_d55e8(&B_94A6);
	far_d55e8(&B_981C);
	if (far_d6a82(&B_981C, a0, 1) != 0)
		return 0;
	far_e8cd3(&B_981C, a1);
	v4 = W_982E;
	far_e8cd3(&B_981C, a2);
	v8 = W_982E;
	if ((unsigned)v8 < v4) {
		far_daa02(v8, W_9826, W_9828);
		v12 = far_daa02(W_9822, W_9824, v4) + far_daa02(v8, W_9826, W_9828);
	}
	else
		v12 = far_daa02(v8, v4);
	if (B_9D34 == a0)
		far_d6a82(&B_94A6, a0, 1);
	far_d55e8(&B_981C);
	return v12;
}
