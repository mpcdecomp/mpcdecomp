extern char STR_1C68[];
extern char STR_1C6C[];

far_c3308()
{
	far_d8827(7, 6);
	if (far_c32a7() == 0)
		far_d885c(STR_1C68);
	else
		far_d885c(STR_1C6C);
	return;
}
