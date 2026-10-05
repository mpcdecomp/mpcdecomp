extern char B_A61E;
extern char TBL_4B15[];

far_d9c99(a0)
{
	char v1;
	char *v3;
	int v5;

	v5 = atoi(a0);
	if ((B_A61E & 64) != 0) {
		v5 = v5 * 10;
		if ((v3 = index(a0, 46)) != 0) {
			v3++;
			v1 = *v3;
			if ((TBL_4B15[v1] & 4) != 0)
				v5 += v1 + -48;
		}
	}
	return v5;
}
