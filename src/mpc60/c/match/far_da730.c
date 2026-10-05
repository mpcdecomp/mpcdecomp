far_da730(a0)
{
	int v2;
	int v4;

	v2 = strlen(a0);
	v4 = 38 - v2 >> 1;
	far_d8894(61, v4);
	far_d8837(32);
	far_d885c(a0);
	far_d8837(32);
	far_d8894(61, (v2 & 1) + v4);
	return;
}
