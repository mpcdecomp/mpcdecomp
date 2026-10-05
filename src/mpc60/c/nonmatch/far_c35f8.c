/* differs: +17 bne $6 | jmp br_c37f8 */
extern char B_53DB;
extern char B_53DC;
extern char B_8CD3;
extern char B_A06E;

far_c35f8()
{
	int v2;
	int v4;
	char z0;
	char v6;
	char v7;

	v4 = 77;
	v2 = 0;
	while (v2 == 0) {
		far_d97f5();
		far_d880a();
		B_53DC = 0;
		if (B_8CD3 != 0) {
			switch (v4) {
			case 66:
			case 70:
			case 71:
			case 85:
				far_de533(-40);
				far_d880a();
				break;
			default:
				B_53DB = v4;
				break;
			}
		}
		else
			B_53DB = v4;
		switch (B_53DB) {
		case 77:
			if (B_A06E != 0)
				far_d7983();
			v4 = far_c22a2();
			break;
		case 71:
			if (B_A06E == 0)
				far_d7939();
			v4 = far_e3e65();
			break;
		case 47:
			far_d7939();
			v4 = far_e5b68();
			break;
		case 1:
			v4 = far_e65ab();
			break;
		case 70:
			far_d7983();
			v4 = far_c04f0();
			break;
		case 75:
			v4 = far_c9fb2();
			break;
		case 74:
			v4 = far_c49dd();
			break;
		case 76:
			v4 = far_c6637();
			break;
		case 85:
			far_d7983();
			v4 = far_e1a15();
			break;
		case 83:
			far_d7983();
			v4 = far_e34ec();
			break;
		case 108:
			far_d7983();
			v4 = far_e3c3a();
			break;
		case 79:
			v4 = far_c5aa2();
			break;
		case 66:
			far_d7939();
			v4 = far_e163b();
			break;
		case 115:
			v4 = far_c3833();
			break;
		case 65:
			far_d7983();
			v4 = far_e5879();
			break;
		case 116:
			v4 = far_e5cec();
			break;
		case 69:
			v4 = far_e4e18();
			break;
		case 82:
			v4 = far_e5551();
			break;
		case 32:
			v2 = 1;
			break;
		default:
			v7 = v4;
			v6 = 0;
			v4 = far_c37fc(&v7);
			break;
		}
	}
	return;
}
