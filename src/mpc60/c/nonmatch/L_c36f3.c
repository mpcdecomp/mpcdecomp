/* differs: +63 bne $5 | jmp br_c1d45 */
extern char B_53DC;
extern char B_8FCB_V112;

L_c36f3(a0)
char *a0;
{
	int v2;
	int v4;
	char z0[13];
	char v18;

	B_53DC = 52;
	L_c4063(0x1762);
	far_d8827(2, 0);
	far_d885c(0x1781);
	far_d8827(7, 0);
	far_d885c(0x17b1);
	v2 = far_d981a(1);
	if (v2 == 120) {
		far_d8810(0);
		far_d8827(7, 0);
		far_d885c(0x17bd);
		far_d8850();
		++B_8FCB_V112;
		if ((v4 = far_db626(a0)) != 0)
			far_de533(v4);
		else {
			far_d8827(0, 33);
			far_d8837(50);
			far_d8850();
			v4 = 1;
			while (v4 != 0) {
				if (v4 == 10)
					far_de639(102, 3, 38);
				else {
					far_de639(102, 3, 37);
					far_d8827(3, 6);
					a0[10] = 50;
					L_c3fcc(a0, &v18);
					far_d885c(&v18);
				}
				v2 = far_da610(1);
				if (v2 != 120) {
					far_d8765();
					--B_8FCB_V112;
					return v2;
				}
				v4 = far_db6bd(a0);
				switch (v4) {
				case 0:
					strncpy(-0x6fe6, a0, 8);
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
		--B_8FCB_V112;
		v2 = 0;
	}
	return v2;
}
