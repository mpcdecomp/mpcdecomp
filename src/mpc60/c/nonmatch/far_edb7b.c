/* differs: +69 bne $9 | jmp br_edd91 */
extern char B_8CCB;
extern unsigned char B_8E68;
extern char B_8E6A[];
extern char B_94A6;
extern char B_9D34;
extern unsigned char TBL_8E65;
extern int TBL_8E66;
extern int W_8D4E;
extern int W_8D50;
extern long W_94DC;
long far_ed6eb();

far_edb7b(a0, a1, a2, a3, a4)
char a0;
char a3;
char a4;
{
	long v4;
	long v8;
	int v10;
	int v12;
	int v14;
	char *v16;
	int v18;

	if (a2 == 0)
		return;
	if (B_94A6 < 0)
		return;
	v4 = W_94DC;
	v8 = far_ed6eb();
	far_d6a82(&B_94A6, a4, 0);
	far_eaf33(&B_94A6, W_8D4E, W_8D50);
	++B_8CCB;
	v18 = 0;
	while (v18 == 0) {
		v12 = far_03012(1, &TBL_8E65, 0x640);
		switch (TBL_8E65 & 248) {
		case 136:
			v8 -= (long)far_da912(TBL_8E66);
			if (v8 <= 0L)
				v18 = 1;
			break;
		case 152:
			if (TBL_8E66 == a3) {
				if (a0 != 0) {
					v14 = far_da912(B_8E6A[0]);
					v16 = B_8E6A;
					switch (a1) {
					case 0:
						v14 += a2;
						break;
					case 1:
						v14 -= a2;
						break;
					case 2:
						v14 = v14 * (long)a2 / 100L;
						if (v14 < 0)
							v14 = 0;
						if (v14 > 0x270f)
							v14 = 0x270f;
						break;
					case 3:
						v14 = a2;
						break;
					}
					if (v14 > 0x270f)
						v14 = 0x270f;
					if (v14 < 0)
						v14 = 0;
					*(int *)v16 = far_da949(v14);
				}
				else {
					v10 = B_8E68;
					switch (a1) {
					case 0:
						v10 += a2;
						break;
					case 1:
						v10 -= a2;
						break;
					case 2:
						v10 = v10 * a2 / 100;
						break;
					case 3:
						v10 = a2;
						break;
					}
					if (v10 > 127)
						v10 = 127;
					if (v10 < 0)
						v10 = 0;
					B_8E68 = v10;
				}
			}
			break;
		case 168:
			break;
		case 248:
			v18 = 1;
			break;
		}
		far_03ec1(1);
		far_05303(1, &TBL_8E65, v12);
	}
	far_d4855(B_9D34, 1);
	W_94DC = 0L;
	far_ec4ae(v4);
	--B_8CCB;
}
