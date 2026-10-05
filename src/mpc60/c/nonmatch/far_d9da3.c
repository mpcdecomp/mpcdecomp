/* differs: +25 pop si | mov ax, si */
extern char B_A61D;
extern char *W_A61A;

far_d9da3()
{
	register int r1;

	++B_A61D;
	W_A61A += *W_A61A;
	r1 = *W_A61A;
	if (r1 == 0)
		far_d9dcf();
	return;
}
