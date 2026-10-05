extern char STR_35CA[];
extern char STR_35CE[];

far_d67e8(a0, a1)
{
	char z0[2];
	char v3;

	strcpy(a0, STR_35CA);
	far_daa7d(a1, &v3, 2, 48);
	strcat(a0, &v3);
	strcat(a0, STR_35CE);
	return;
}
