/* differs: placement +2a9 */
extern char B_52AD;
extern char B_52AE;
extern char B_52AF;
extern char B_52B0;
extern char B_52B2;
extern char B_52B4;
extern char B_52B5;
extern char B_A61D;
extern char STR_2785[];
extern char STR_2791[];
extern char STR_279E[];
extern char STR_27AB[];
extern char STR_27C9[];
extern char STR_27D8[];
extern char STR_27EA[];
extern char STR_27F0[];
extern char STR_2813[];
extern char TBL_52B1[];

far_c68d9()
{
	char v1;

	far_c1f4e(STR_2785);
	far_d8827(1, 0);
	far_d916d(STR_2791, &B_52AD, 0xb52, 8);
	far_d88b2(37);
	far_d916d(0x279d, &B_52AF, 0xb36, 3);
	far_d8827(2, 0);
	far_d916d(STR_279E, &B_52AE, 0xb52, 8);
	far_d88b2(37);
	far_d916d(0x27aa, &B_52B0, 0xb36, 3);
	far_d8827(3, 0);
	far_da730(STR_27AB);
	far_d8827(4, 0);
	far_d936c(STR_27C9, TBL_52B1, 3, 1, 127, 8);
	far_d936c(STR_27D8, &B_52B2, 3, 1, 127, 8);
	far_d8827(5, 0);
	far_da730(STR_27EA);
	far_d8827(6, 0);
	far_d936c(STR_27F0, &B_52B4, 3, 1, 127, 8);
	far_d8827(7, 0);
	far_d916d(STR_2813, &B_52B5, 0x268a, 10);
	far_c6ac2();
	for (; ; ) {
		if ((v1 = far_d981a(0)) != 0)
			break;
		switch (B_A61D) {
		case 0:
		case 1:
		case 2:
		case 3:
			far_c6ac2();
			far_de02f();
			break;
		case 4:
		case 5:
			if (TBL_52B1[0] > B_52B2) {
				B_52B2 = TBL_52B1[0];
				far_da14f(5);
			}
			break;
		}
	}
	return v1;
}
