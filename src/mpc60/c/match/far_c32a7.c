extern char B_9D36;
extern char TBL_954C[];

far_c32a7()
{
	if ((TBL_954C[B_9D36] & 1) != 0)
		return 0;
	return 1;
}
