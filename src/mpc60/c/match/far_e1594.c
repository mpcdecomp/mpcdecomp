extern char B_52A4;
extern char B_8E68;

far_e1594(a0)
{
	int v2;

	while (1) {
		for (; ; ) {
			if ((v2 = far_e15ef(B_52A4)) != 0)
				break;
			far_e1617(1);
			if (a0-- < 0)
				return -2;
		}
		if (v2 == -20)
			return -20;
		if (B_8E68 != 6)
			break;
	}
	return v2;
}
