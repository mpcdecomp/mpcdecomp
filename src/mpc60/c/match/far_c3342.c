extern char B_4C32;
extern char STR_1C70[];
extern char STR_1C74[];

far_c3342()
{
	far_d8827(7, 16);
	if (B_4C32 == 0)
		far_d885c(STR_1C70);
	else
		far_d885c(STR_1C74);
	return;
}
