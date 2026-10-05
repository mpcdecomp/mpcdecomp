/* differs: +6 push di | push si */
extern char B_BE66;
extern char L_0640[];
extern char TBL_8E65[];
extern int W_BE5C;
extern char W_BE5E;
extern int W_BE60;
extern char W_BE62;
extern int W_BE64;

far_dc2ae(a0)
char *a0;
{
	int v2;
	char *v4;
	int v6;
	int v8;
	char z0[26];
	char v35;
	char v36;
	char v37;
	register int r1;

	far_d7b8c(0);
	v6 = far_d7b8c(9, 0xf95, &v35);
	if (v6 == 0)
		return -0x800;
	if (v6 != -768)
		return v6;
	v8 = a0[11] != 0 ? 16 : 8;
	r1 = a0;
	*(char *)(v8 + r1) = 83;
	(a0 + v8)[1] = 84;
	(a0 + v8)[2] = 50;
	if ((W_BE5C = far_d7b8c(1, a0)) < 0)
		return W_BE5C;
	v37 = 6;
	v36 = 1;
	if ((v6 = far_d7b8c(5, &v37, W_BE5C, 2)) != 0)
		return v6;
	if ((v6 = far_d7b8c(5, &W_BE62, W_BE5C, 3)) != 0)
		return v6;
	if ((v6 = far_d7b8c(5, &W_BE5E, W_BE5C, 3)) != 0)
		return v6;
	if ((v6 = far_d7b8c(5, &B_BE66, W_BE5C, 1)) != 0)
		return v6;
	v2 = 0xbf7;
	setmem(TBL_8E65, 0x640, 0);
	while (v2 > 0) {
		v4 = L_0640;
		if (v2 < v4)
			v4 = v2;
		v2 -= v4;
		if ((v6 = far_d7b8c(5, TBL_8E65, W_BE5C, v4)) != 0)
			return v6;
	}
	if ((v6 = far_dc012(W_BE5C, W_BE5E, W_BE60, W_BE62, W_BE64)) != 0)
		return v6;
	far_d49f3(-1, 0);
	return far_d7b8c(3, 0, W_BE5C);
}
