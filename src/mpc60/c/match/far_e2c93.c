extern char B_53DB;
extern char B_9D34;
extern char STR_3D8A[];
extern char STR_3DA7[];
extern char STR_3DC2[];
extern char STR_3DD1[];
extern char STR_3DF4[];
extern char STR_3E17[];
extern char STR_3E21[];

far_e2c93()
{
	int v2;
	int v4;
	int v6;
	int v8;

	v4 = B_9D34;
	v6 = far_d77d7();
	far_c1f4e(STR_3D8A);
	far_d8827(2, 3);
	far_d936c(STR_3DA7, &v4, 2, 1, 99, 8);
	far_d8827(3, 3);
	far_d936c(STR_3DC2, &v6, 2, 1, 99, 8);
	far_d8827(4, 3);
	far_d885c(STR_3DD1);
	far_d8827(5, 3);
	far_d885c(STR_3DF4);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_3E17);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
	}
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(STR_3E21);
		if ((v8 = far_e9686(v4, v6)) != 0)
			far_de533(v8);
		v2 = B_53DB;
	}
	return v2;
}
