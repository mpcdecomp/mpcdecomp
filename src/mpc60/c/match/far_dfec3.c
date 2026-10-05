extern int TBL_A670[];

far_dfec3(a0, a1)
{
	if ((unsigned)a0 > 34)
		return;
	*(int *)((char *)TBL_A670 + a0 * 59) = a1;
}
