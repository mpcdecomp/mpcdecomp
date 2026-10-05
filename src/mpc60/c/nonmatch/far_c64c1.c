/* differs: +1c beq $5 | jmp near br_c655f */
far_c64c1()
{
	int v2;

	L_df04f(4);
	if (far_d870d() != 0) {
		v2 = far_d861e();
		switch (v2) {
		case 47:
		case 68:
		case 78:
		case 80:
		case 81:
		case 91:
		case 93:
		case 98:
		case 123:
		case 125:
			return 0;
		case 77:
			return 77;
		case 86:
		case 87:
		case 88:
		case 89:
		case 90:
			return far_d4cd8(v2);
		default:
			return 79;
		}
	}
}
