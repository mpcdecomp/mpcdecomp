extern char B_53DB;
extern char B_8E03;
extern char STR_3008[];
extern char STR_3018[];
extern char W_0022[];

far_c9682(a0, a1, a2)
{
	int v2;
	int v4;

	far_d8850();
	if (a1 <= a2) {
		if ((v2 = far_db97e(a0)) != 0) {
			far_de533(v2);
			return B_53DB;
		}
	}
	else {
		if (B_8E03 != 0) {
			far_de533(-0x700);
			return B_53DB;
		}
		if (a1 <= 793) {
			far_de533(-33);
			return B_53DB;
		}
		far_de639(102, 3, W_0022);
		v4 = far_da610(1);
		far_d8856();
		if (v4 != 120)
			return v4;
		while (1) {
			far_d7b8c(0);
			a2 = far_c955a();
			far_c98a5(a2);
			if ((v2 = far_dc104(a0)) == 0)
				break;
			if (v2 == -0x800) {
				far_de639(102, 3, 36);
				far_d8827(7, 0);
				far_d885c(STR_3008);
				v4 = far_da610(1);
				far_d8856();
				if (v4 != 120)
					return v4;
			}
			else {
				far_de533(v2);
				return B_53DB;
			}
		}
		far_de639(102, 3, 35);
		v4 = far_da610(1);
		far_d8856();
		if (v4 != 120)
			return v4;
		while (1) {
			far_d7b8c(0);
			a2 = far_c955a();
			far_c98a5(a2);
			if ((v2 = far_dc213(a0)) == 0)
				break;
			if (v2 == -0x800) {
				far_de639(102, 3, 36);
				far_d8827(7, 0);
				far_d885c(STR_3018);
				v4 = far_da610(1);
				far_d8856();
				if (v4 != 120)
					return v4;
			}
			else {
				far_de533(v2);
				return B_53DB;
			}
		}
	}
	return B_53DB;
}
