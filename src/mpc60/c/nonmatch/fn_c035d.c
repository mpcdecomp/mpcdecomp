/* differs: +35 call far_da730_ | mov ax, STR_140B */
extern char B_53D9;
extern char B_53DA;
extern char B_8CCB;
extern char B_94A6;
extern char STR_140B[];
extern char STR_1416[];
extern char STR_142A[];
extern char STR_14AA[];
extern char STR_14B6[];
extern char TBL_8E1F[];
extern char TBL_8E30[];

fn_c035d()
{
	char z0[11];
	char v12;
	char z1[6];
	char v19;

	far_d4b6e();
	far_e5fa6();
	B_53D9 = 1;
	far_d880a();
	far_d6a82(&B_94A6, 1, 1);
	far_c01d0();
	far_c01df();
	far_da730();
	far_d8827(2, 10);
	far_d885c();
	far_d8827(3, 9);
	far_d885c();
	far_d8827(4, 14);
	far_d885c();
	far_d8827(7, 0);
	far_d885c();
	B_53DA = 1;
	if (far_d7b8c(12, 99, 0, 0) == -0x900)
		B_53DA = 0;
	if (far_d7be4() != 0) {
		++B_8CCB;
		if (far_d7b8c(9, 0x1255, &v19) == 0) {
			if (far_dac40() != 0)
				far_df8fc();
			else
				strncpy(TBL_8E1F, &v12, 8);
		}
		if (far_dc84f() != 0)
			far_d4b6e();
		else
			strcpy(TBL_8E30, STR_14B6);
		--B_8CCB;
	}
	far_d7cba();
	far_c35f8();
	return;
}
