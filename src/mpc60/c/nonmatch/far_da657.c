/* differs: +1e jmp $7 | jmp near br_da713 */
extern char TBL_4B15[];

far_da657(a0, a1)
{
	int v2;

	v2 = 0;
	if ((TBL_4B15[a0] & 4) != 0)
		return v2;
	switch (a0) {
	case 120:
		if (a1 != 0)
			v2 = a0;
		break;
	case 121:
		if (a1 > 1)
			v2 = a0;
		break;
	case 122:
		if (a1 > 2)
			v2 = a0;
		break;
	case 117:
		if (a1 > 3)
			v2 = a0;
		break;
	case 13:
	case 33:
	case 43:
	case 45:
	case 46:
	case 60:
	case 62:
	case 68:
	case 72:
	case 78:
	case 91:
	case 93:
	case 94:
	case 100:
	case 104:
	case 123:
	case 125:
		break;
	default:
		v2 = a0;
		break;
	}
	return v2;
}
