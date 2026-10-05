extern char B_52AD;
extern char B_5504;
extern char TBL_5176[];
extern char TBL_9FAC[];

far_ddef2(a0, a1)
{
	if (B_52AD != 0)
		TBL_9FAC[a0] = a1;
	else {
		TBL_5176[a0] = a1;
		B_5504 = 1;
	}
	return;
}
