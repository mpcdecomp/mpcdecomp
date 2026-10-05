extern char STR_2A52[];
extern char STR_2A58[];

far_c7387(a0, a1)
{
	char z0[3];
	char v4;

	strcpy(a0, STR_2A52);
	far_daa7d(a1, &v4, 3, 48);
	strcat(a0, &v4);
	strcat(a0, STR_2A58);
	return;
}
