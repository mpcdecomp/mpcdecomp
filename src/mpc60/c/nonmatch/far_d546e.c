/* differs: +e beq $5 | jmp br_d5597 */
extern char B_52B5_V112;
extern unsigned char B_5756_V112;
extern char B_5757_V112;
extern char B_5759_V112;
extern char B_9007_V112;
extern int W_575A_V112;

far_d546e()
{
	int v2;
	int v4;

	if (B_5759_V112 != 0) {
		if ((v4 = far_ec8a6()) != 0) {
			L_db5b5();
			far_d8850();
			far_d8810(0);
			far_de639(102, 3, 43);
			far_d8827(2, 5);
			far_d88e6(0x3dd8, v4);
			far_d8827(7, 0);
			far_d885c(0x3ddc);
			far_de723();
			far_d8810(3);
			B_9007_V112 = B_5757_V112 = 0;
			far_d8856();
			return 1;
		}
		if (B_9007_V112 != 0) {
			L_db5b5();
			far_d8850();
			far_de533(B_9007_V112);
			B_9007_V112 = B_5757_V112 = 0;
			far_d8856();
			return 1;
		}
	}
	if (B_52B5_V112 < 0) {
		if (B_5759_V112 != 0) {
			if ((v2 = far_d6fda(B_5756_V112)) <= W_575A_V112)
				L_d7288(v2);
			else
				return -1;
		}
		else {
			L_db5b5();
			return 1;
		}
	}
	return 0;
}
