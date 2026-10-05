far_d6533()
{
	int v2;
	int v4;
	char z0[2];

	v4 = v2 = 0;
	for (; ; ) {
		if ((v4 = far_ec448(v2)) <= v2)
			break;
		far_d6474(v4);
		v2 = v4;
	}
	return;
}
