/* differs: +6e bne $5 | jmp near tgt_c6756 */
extern char B_53DB;
extern char B_53DC;
extern char B_8CD3;
extern char STR_26B6[];
extern char STR_272B[];

far_c6637()
{
	char v1;
	char v2;

	far_da730(STR_26B6);
	far_d885c(0x234d);
	far_d885c(0x2371);
	far_d885c(0x2393);
	far_d885c(STR_272B);
	far_d8827(7, 0);
	v2 = far_da533(&v1, 8, 0);
	if (v2 == 0) {
		B_53DC = v1;
		switch (B_53DC) {
		case 1:
			far_d7983();
			if (B_8CD3 != 0) {
				far_de533(-40);
				v2 = B_53DB;
				break;
			}
			v2 = far_c6bf9();
			break;
		case 2:
			far_d7983();
			v2 = far_c73d5();
			break;
		case 3:
			v2 = far_cb291();
			break;
		case 4:
			v2 = far_c4d37();
			break;
		case 5:
			v2 = far_c675e();
			break;
		case 6:
			far_d7983();
			v2 = far_c8141();
			break;
		case 7:
			far_d7983();
			v2 = far_c6b43();
			break;
		case 8:
			far_d7983();
			v2 = far_c68d9();
			break;
		}
	}
	return v2;
}
