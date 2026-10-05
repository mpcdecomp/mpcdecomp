extern char B_5216;
extern char B_52AD;
extern char B_52AE;
extern char B_94A6;
extern char TBL_9FAC[];
extern long W_94A8;

far_d71fa()
{
	if (B_94A6 >= 0 && (B_52AD | B_52AE | B_5216) != 0)
		far_da993(TBL_9FAC, far_daa7a(), W_94A8 + 39L, 160);
	return;
}
