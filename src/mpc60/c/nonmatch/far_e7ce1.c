/* differs: +18 blo $5 | jc br_e7d1e */
far_e7ce1(a0)
unsigned char *a0;
{
	--*(int *)(a0 + 58);
	++*(int *)(a0 + 52);
	++a0[54];
	if (a0[54] >= *(int *)(a0 + 64)) {
		a0[54] = 0;
		++a0[55];
		if (a0[55] > a0[60]) {
			a0[55] = 1;
			*(int *)(a0 + 52) = 0;
			++*(int *)(a0 + 56);
		}
	}
	return;
}
