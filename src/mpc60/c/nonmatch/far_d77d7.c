/* differs: +b jmp $8 | jmp br_d7811 */
extern int W_9B9A;
extern int W_9B9C;

far_d77d7()
{
	char v1;
	unsigned char v2;

	v2 = 1;
	for (; v2 < 99; ) {
		far_d602b(v2);
		v1 = peekb(W_9B9A, W_9B9C) & 127;
		if (v2 < v1)
			break;
		v2++;
	}
	return v2;
}
