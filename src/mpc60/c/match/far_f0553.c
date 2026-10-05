extern char B_5014;
extern char B_5015;
extern char B_501A;
extern char B_7E63;
extern char B_8B4F;
extern char B_8C08;
extern char B_8CC9;
extern char TBL_501E[];
extern char TBL_8C09[];

far_f0553(a0, a1)
unsigned char *a0;
{
	int v2;
	char v3;
	char v4;

	v3 = 0;
	v4 = B_8B4F;
	if ((B_501A | B_7E63) != 0) {
		if (*a0 <= 160) {
			if (TBL_501E[a0[2]] == 33) {
				v3 = 1;
				a0[2] = 0;
			}
			if (v3 == 0) {
				if ((a0[2] = TBL_501E[a0[2]] - 1) >= 32)
					return;
			}
		}
		switch (*a0) {
		case 144:
			TBL_8C09[a0[2]] = B_5014 != 0 ? B_5015 : a0[3];
			++B_8CC9;
			break;
		case 128:
			TBL_8C09[a0[2]] = 0;
			a0[3] = 64;
			if ((unsigned char)B_8CC9 > 0)
				--B_8CC9;
			break;
		case 208:
			if (B_5014 == 0) {
				v2 = 0;
				for (; (unsigned)v2 < 32; ) {
					if (TBL_8C09[v2] != 0)
						TBL_8C09[v2] = B_8C08;
					v2++;
				}
			}
			return;
		case 160:
			if (B_5014 == 0)
				TBL_8C09[a0[2]] = a0[3];
			return;
		}
		if (v3 != 0)
			B_8B4F = 127;
		far_f0694(a0, a1);
		B_8B4F = v4;
	}
}
