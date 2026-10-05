extern char B_52AD;
extern char B_5504;
extern char TBL_5196[];
extern char TBL_9FCC[];

far_ddf1b(a0, a1)
{
	if (B_52AD != 0)
		TBL_9FCC[a0] = a1;
	else {
		TBL_5196[a0] = a1;
		B_5504 = 1;
	}
	return;
}
