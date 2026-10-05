/* differs: +ca bne $6 | jnz br_e1761 */
extern char B_535A;
extern char B_A069;
extern char B_A61D;
extern char STR_382E[];
extern char STR_383B[];
extern char STR_3843[];
extern char STR_3851[];

far_e163b()
{
	int v2;
	char z0[16];
	char v19;

	far_da730(STR_382E);
	far_d916d(STR_383B, &B_A069, 0xb44, 3);
	far_d936c(STR_3843, &B_535A, 2, 1, 99, 8);
	far_d6668(B_535A, -1, &v19);
	far_d90a6(0x34d3, &v19, 16);
	far_d8827(2, 0);
	far_d885c(STR_3851);
	far_d885c(0x34fd);
	far_d8827(6, 0);
	far_d8894(61, 40);
	for (; ; ) {
		if ((v2 = far_d981a(0)) != 0)
			break;
		switch (B_A61D) {
		case 0:
			far_d4c91();
			break;
		case 2:
		case 1:
			far_d6668(B_535A, -1, &v19);
			far_da14f(2);
			far_d4c91();
			break;
		}
	}
	return v2;
}
