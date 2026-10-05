extern char TBL_7E6C[];
extern char TBL_7FEC[];

far_e7d22()
{
	far_04ed4();
	setmem(TBL_7E6C, 128, -1);
	setmem(TBL_7FEC, 128, -1);
	setmem(-0x7c94, 128, -1);
	return;
}
