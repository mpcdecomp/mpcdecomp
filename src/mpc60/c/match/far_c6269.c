extern char STR_2529[];
extern char STR_253E[];

far_c6269()
{
	int v2;
	int v4;

	far_c1f4e(STR_2529);
	far_d8827(2, 0);
	v4 = 0;
	far_d936c(STR_253E, &v4, 3, 0, 80, 0);
	far_c62de(v4);
	for (; ; ) {
		if ((v2 = far_d981a(0)) != 0)
			break;
		far_c62de(v4);
	}
	return v2;
}
