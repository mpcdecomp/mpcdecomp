/* differs: +17 cmp word ptr -2[bp],0 | or dx, ax */
long far_d7820();

far_c945e(a0)
{
	long v4;

	v4 = far_d7820(a0);
	if (v4 != 0)
		v4 += 2L;
	return (v4 + 0x3ffL) / 0x400L;
}
