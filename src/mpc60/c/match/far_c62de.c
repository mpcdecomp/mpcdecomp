extern char STR_2545[];
extern char STR_255E[];
extern char TBL_AE8F[];
extern char TBL_AE90[];
extern int TBL_AE91[];
extern int TBL_AE93[];
extern int TBL_AE95[];
extern int TBL_AE97[];

far_c62de(a0)
{
	far_d8827(4, 0);
	far_d88e6(STR_2545, TBL_AE8F[a0 * 10], TBL_AE90[a0 * 10]);
	far_d8827(6, 0);
	far_d88e6(STR_255E, TBL_AE91[a0 * 5], TBL_AE93[a0 * 5], TBL_AE95[a0 * 5], TBL_AE97[a0 * 5]);
	return;
}
