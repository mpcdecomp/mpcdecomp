extern char TBL_86A2[];
extern char TBL_8AA4[];

far_f0496()
{
	far_f04ce();
	far_04f7e();
	setmem(TBL_86A2, 0x400, 0);
	setmem(TBL_8AA4, 20, -1);
	return;
}
