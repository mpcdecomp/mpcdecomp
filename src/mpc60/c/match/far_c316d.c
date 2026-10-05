extern char B_9D36;
extern char B_B23F;
extern char B_B242;
extern char B_B243;
extern char B_B2A0_V112;

far_c316d()
{
	char *v2;

	v2 = (B_9D36 << 1) + 0x512e;
	B_B2A0_V112 = *v2 + 1;
	B_B23F = v2[1] + 1;
	far_c32d9(far_d65f7(B_9D36), 4);
	B_B242 = B_B2A0_V112;
	B_B243 = B_B23F;
	return;
}
