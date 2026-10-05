extern char STR_42AF[];

far_e4b91(a0, a1, a2)
{
	if (a1 != 0)
		far_d6668(a0, -1, a2);
	else
		strcpy(a2, STR_42AF);
	return;
}
