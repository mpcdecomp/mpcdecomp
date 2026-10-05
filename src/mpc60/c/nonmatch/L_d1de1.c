/* differs: +86 bne $5 | jmp near tgt_c6756 */
extern char B_53DB;
extern char B_53DC;
extern char B_8FD3_V112;

L_d1de1()
{
	char v1;
	char v2;

	L_de62c(0x3539);
	far_d885c(0x3540);
	far_d885c(0x3569);
	far_d885c(0x358f);
	far_d885c(0x35b3);
	far_d885c(0x35dc);
	far_d885c(0x3601);
	far_d8827(7, 0);
	v2 = far_da533(&v1, 9, 0);
	if (v2 == 0) {
		B_53DC = v1;
		switch (B_53DC) {
		case 1:
			far_d7983();
			v2 = L_d1f32();
			break;
		case 2:
			far_d7983();
			if (B_8FD3_V112 != 0) {
				far_de533(-40);
				v2 = B_53DB;
				break;
			}
			v2 = far_c6bf9();
			break;
		case 3:
			far_d7983();
			v2 = L_d28e4();
			break;
		case 4:
			v2 = L_d2c35();
			break;
		case 5:
			v2 = far_c4d37();
			break;
		case 6:
			v2 = far_c675e();
			break;
		case 7:
			far_d7983();
			v2 = far_c8141();
			break;
		case 8:
			far_d7983();
			v2 = far_c6b43();
			break;
		case 9:
			far_d7983();
			v2 = L_d3842();
			break;
		}
	}
	return v2;
}
