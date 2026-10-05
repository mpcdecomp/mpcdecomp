extern char STR_36CF[];

far_dea4f(a0, a1)
char *a0;
{
	if (a1 != 0)
		far_d88e6(STR_36CF, a0[4], a0[3], a0[2]);
	else
		far_dea25(a0);
	return;
}
