/* differs: +ea jmp $6 | xor ax, ax */
extern char B_94A6;
extern char B_9D32;
extern int W_9B9A;
extern int W_9B9C;
extern long W_9B9E;
long far_d61d8();
long far_da9df();
long far_daa02();

far_e9d7e(a0)
{
	int v2;
	long v6;

	if (B_94A6 >= 0)
		return -4;
	if ((v2 = far_d602b(a0)) != 0)
		return;
	far_d4855(a0, 0);
	B_9D32 = 0;
	v6 = far_da9df(W_9B9A, W_9B9C, far_d61d8(W_9B9A, W_9B9C) + (long)far_d617f(W_9B9A, W_9B9C));
	far_eee37(v6, W_9B9A, W_9B9C, far_daa02(W_9B9E, v6) + 1L);
	W_9B9E = far_da9df(W_9B9E, -far_daa02(v6, W_9B9A, W_9B9C));
}
