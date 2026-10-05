extern char B_5218[];
extern char STR_28A4[];
extern char STR_28B5[];
extern char STR_28BB[];
extern char STR_28C5[];
extern char STR_28EC[];
extern char STR_2912[];
extern char STR_2939[];
extern char STR_294B[];
extern char TBL_0CF1[];
extern char TBL_AE2C[];

far_c6bf9()
{
	int v2;
	char z0[16];
	char v19;

	far_c1f4e(STR_28A4);
	far_d8827(1, 0);
	far_d916d(STR_28B5, B_5218, TBL_0CF1, 9);
	far_d885c(STR_28BB);
	far_dfeec(TBL_AE2C[B_5218[0]], &v19);
	far_d885c(&v19);
	far_d8827(2, 0);
	far_d885c(STR_28C5);
	far_d8827(3, 0);
	far_d885c(STR_28EC);
	far_d8827(4, 0);
	far_d885c(STR_2912);
	far_d8827(5, 0);
	far_d885c(STR_2939);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_294B);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
		far_d8827(1, 23);
		far_dfeec(TBL_AE2C[B_5218[0]], &v19);
		far_d885c(&v19);
	}
	if (v2 == 120)
		v2 = far_c6d66();
	return v2;
}
