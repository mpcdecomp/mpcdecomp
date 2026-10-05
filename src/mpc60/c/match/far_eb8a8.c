extern char B_94A6[];
extern char TBL_954C[];
extern char TBL_95B0[];
extern char TBL_9614[];
extern char TBL_98C2[];
extern char TBL_9926[];
extern char TBL_998A[];

far_eb8a8(a0, a1)
{
	char v1;
	char z0[99];
	char v101;
	int v103;
	char z1[16];
	char v120;

	setmem(&v101, 100, -1);
	v1 = 1;
	for (; v1 < 100; ) {
		TBL_954C[v1] = TBL_98C2[v1];
		TBL_95B0[v1] = TBL_9926[v1];
		TBL_9614[v1] = TBL_998A[v1];
		v1++;
	}
	far_d55e8(B_94A6);
	v1 = 1;
	for (; v1 < 100; ) {
		if ((v103 = far_d6668(a0, v1, &v120)) == 0) {
			if ((v103 = far_d700c(a1, v1, &v120)) != 0)
				return v103;
		}
		++v1;
	}
	return 0;
}
