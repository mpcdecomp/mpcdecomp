/* differs: +b cmp word ptr 8[bp],0 | mov ax, 24h */
far_e4ab1(a0, a1)
{
	int v2;

	v2 = 0;
	if (a1 != 0)
		v2 = L_d88fd(a0);
	far_d88e6(0x2c20, v2);
	return;
}
