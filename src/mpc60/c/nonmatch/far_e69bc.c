/* differs: +78 jmp $8 | jmp br_e6b03 */
extern char B_53DB;
extern char B_8CCB;
extern char STR_48C7[];
extern char TBL_8E1F[];

far_e69bc(a0)
char *a0;
{
	int v2;
	int v4;
	int v6;

	far_d8810(0);
	far_d8827(7, 0);
	far_d885c(STR_48C7);
	far_d8850();
	if ((v4 = far_c20ed(a0, 1)) != 0) {
		far_de533(v4);
		return B_53DB;
	}
	++B_8CCB;
	if ((v4 = far_db626(a0)) != 0)
		far_de533(v4);
	else {
		far_d8850();
		v6 = a0[11] != 0 ? 16 : 8;
		v4 = 1;
		while (v4 != 0) {
			if (v4 == 10) {
				far_de639(102, 3, 38);
				v2 = far_da610(1);
			}
			else
				v2 = far_e784a(a0, 2);
			if (v2 != 120) {
				far_d8765();
				--B_8CCB;
				return v2;
			}
			v4 = far_db6bd(a0);
			switch (v4) {
			case 0:
				strncpy(TBL_8E1F, a0, v6);
				TBL_8E1F[v6] = 0;
				break;
			case -768:
			case 10:
				break;
			default:
				far_de533(v4);
				break;
			}
		}
	}
	far_d8765();
	--B_8CCB;
	return 0;
}
