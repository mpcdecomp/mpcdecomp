extern long TBL_A668[];
extern long W_AE68;

far_ef913(a0)
{
	if ((unsigned)a0 >= 34)
		return;
	W_AE68 = *(long *)((char *)TBL_A668 + a0 * 59);
}
