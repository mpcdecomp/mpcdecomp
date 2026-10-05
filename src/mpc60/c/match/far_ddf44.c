extern char B_52AE;
extern char B_5504;
extern char TBL_51B6[];
extern char TBL_9FEC[];

far_ddf44(a0, a1)
{
	if (B_52AE != 0)
		TBL_9FEC[a0] = a1;
	else {
		TBL_51B6[a0] = a1;
		B_5504 = 1;
	}
	return;
}
