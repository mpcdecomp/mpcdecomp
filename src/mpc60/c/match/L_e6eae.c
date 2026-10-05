L_e6eae(a0)
char *a0;
{
	int v2;

	v2 = 0;
	if (*a0 >= 0)
		v2 = 1 << *a0;
	a0++;
	if (*a0 >= 0)
		v2 |= 1 << *a0;
	return v2;
}
