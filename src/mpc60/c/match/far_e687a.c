extern char B_53DB;
extern char B_8CCB;
extern char STR_485B[];
extern char TBL_8E1F[];

far_e687a(a0)
char *a0;
{
	int v2;
	int v4;

	far_d8827(7, 0);
	far_d885c(STR_485B);
	far_d88b2(40);
	if ((v4 = far_c20ed(a0, 1)) != 0) {
		far_de533(v4);
		return B_53DB;
	}
	++B_8CCB;
	if ((v4 = far_dac40(a0)) != 0)
		far_de533(v4);
	else {
		v2 = a0[11] != 0 ? 16 : 8;
		strncpy(TBL_8E1F, a0, v2);
		TBL_8E1F[v2] = 0;
	}
	far_d8765();
	--B_8CCB;
	return 0;
}
