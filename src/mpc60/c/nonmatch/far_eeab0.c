/* differs: +31 beq $5 | jz br_eeb02 */
extern char B_4A83;
extern char B_A623;
extern char STR_4A82[];
extern char TBL_A624[];
extern int W_A650;

far_eeab0(a0)
{
	char v1;
	int v3;
	register int r1;

	far_d9d00(W_A650);
	if ((v3 = index(STR_4A82, TBL_A624[B_A623])) != 0) {
		r1 = v3;
		if ((v1 = *(char *)(a0 + r1)) == 62)
			v1 = B_4A83;
		if (v1 == 60)
			v1 = 95;
	}
	else
		v1 = B_4A83;
	far_d8837(v1);
	far_d8837(8);
	TBL_A624[B_A623] = v1;
	return;
}
