extern char B_53DB;
extern char B_53DC;
extern char B_54FA;
extern char B_8D4C;
extern char TBL_8CEC[];
extern char TBL_8D0C[];
extern char TBL_8D2C[];

far_f0225(a0, a1, a2)
char a0;
char a1;
char a2;
{
	switch (a1) {
	case 1:
		far_ddef2(a0, a2);
		if (B_53DB == 74) {
			TBL_8CEC[a0] = a2;
			B_8D4C = a1;
			B_54FA = 80;
		}
		break;
	case 2:
		far_ddf1b(a0, a2);
		if (B_53DB == 74) {
			TBL_8D0C[a0] = a2;
			B_8D4C = a1;
			B_54FA = 80;
		}
		break;
	case 3:
		far_ddf44(a0, a2);
		if (B_53DB == 76 && B_53DC == 4) {
			TBL_8D2C[a0] = a2;
			B_8D4C = a1;
			B_54FA = 80;
		}
		break;
	case 4:
		far_ddf6d(a0, a2 * 20 + 0x2000);
		if (B_53DB == 76 && B_53DC == 3) {
			B_8D4C = a1;
			B_54FA = 80;
		}
		break;
	}
	return;
}
