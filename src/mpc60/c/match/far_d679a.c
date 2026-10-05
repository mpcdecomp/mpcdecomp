extern char STR_35BA[];
extern char STR_35BE[];

far_d679a(a0, a1)
{
	char z0[2];
	char v3;

	strcpy(a0, STR_35BA);
	far_daa7d(a1, &v3, 2, 48);
	strcat(a0, &v3);
	strcat(a0, STR_35BE);
	return;
}
