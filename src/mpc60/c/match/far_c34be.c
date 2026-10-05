extern char B_94A6;
extern char B_9D35;
extern char STR_1C96[];
extern char STR_1CC0[];
extern char STR_1CDB[];

far_c34be()
{
	far_d8827(0, 0);
	if (B_9D35 > 0)
		far_d88e6(STR_1C96, B_9D35);
	else if (B_94A6 == 0 || B_94A6 == 2)
		far_da730(STR_1CC0);
	else
		far_da730(STR_1CDB);
	return;
}
