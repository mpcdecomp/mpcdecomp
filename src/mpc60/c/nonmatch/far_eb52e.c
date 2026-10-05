/* differs: +50 sub dx,dx | cmp dx, word ptr [bp - 6] */
extern char B_981C;
extern int W_8CCD;
extern int W_8CCF;
extern int W_9822;
extern int W_9824;
extern int W_9826;
extern int W_9828;
extern long W_982E;
long far_d6216();
long far_daa02();

far_eb52e()
{
	long v4;
	long v8;
	long v12;
	long v16;
	int v18;

	v4 = W_982E;
	v8 = v4;
	v18 = W_8CCF + W_8CCD;
	far_e8cd3(&B_981C, v18);
	v12 = W_982E;
	W_982E = v4;
	if ((unsigned)v12 < v8) {
		far_daa02(v12, W_9826, W_9828);
		v16 = far_daa02(W_9822, W_9824, v8) + far_daa02(v12, W_9826, W_9828);
	}
	else
		v16 = far_daa02(v12, v8);
	if (v16 + 200L > far_d6216())
		return -3;
	return 0;
}
