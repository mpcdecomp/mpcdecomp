L_c9617(a0, a1, a2)
int *a0;
int *a1;
{
	if (*a0 > a2)
		*a0 = a2;
	if (*a0 < 1)
		*a0 = 1;
	if (*a1 <= *a0)
		*a1 = *a0 + 1;
	if (*a1 > a2 + 1)
		*a1 = a2 + 1;
	return;
}
