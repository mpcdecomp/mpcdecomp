/* differs: +88 mov al,byte ptr -4[bp] | mov ax, word ptr [bp - 4] */
extern char B_53DC;

far_e1a15()
{
	int v2;
	char z0;
	char v4;

	L_de62c(0x21f0);
	far_d885c(0x21fe);
	far_d885c(0x2226);
	far_d885c(0x224c);
	far_d885c(0x226f);
	far_d885c(0x2298);
	far_d885c(0x22bc);
	far_d8827(7, 0);
	v2 = far_da533(&v4, 9, 0);
	if (v2 == 0) {
		B_53DC = v4;
		switch (B_53DC) {
		case 1:
			v2 = far_e1b2a();
			break;
		case 2:
			v2 = far_e1d7f();
			break;
		case 3:
			v2 = far_e2197();
			break;
		case 4:
			v2 = far_e23db();
			break;
		case 5:
			v2 = far_e2591();
			break;
		case 6:
			v2 = far_e290c();
			break;
		case 7:
			v2 = far_e2c93();
			break;
		case 8:
			v2 = far_e2de5();
			break;
		case 9:
			v2 = far_e3014();
			break;
		}
	}
	return v2;
}
