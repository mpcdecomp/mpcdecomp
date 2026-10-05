/* differs: +28 jne $8 | jnz br_de303 */
long far_da9b3();
long far_daa54();

far_de2d1(a0, a1, a3)
long a1;
long a3;
{
	char z0[1023];
	char v1024;
	int v1026;

	v1026 = 512;
	a1 = far_daa54(a1);
	while (a3 > 0L) {
		if (a3 < (long)v1026)
			v1026 = a3;
		L_de8d2(a1, &v1024, far_daa7a(), v1026 + v1026);
		far_e01a3(a0, &v1024, v1026);
		a1 = far_da9b3(a1, (long)(v1026 + v1026));
		a3 -= (long)v1026;
	}
	return;
}
