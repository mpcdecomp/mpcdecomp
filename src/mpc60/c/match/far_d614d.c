extern char B_9D32;
extern char TBL_9BA2[];

far_d614d()
{
	if (B_9D32 == 0) {
		setmem(TBL_9BA2, 400, 0);
		far_d602b(99);
		B_9D32 = 1;
	}
	return;
}
