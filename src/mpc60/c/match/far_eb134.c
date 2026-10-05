extern char B_94A6[];
extern char B_981C[];
extern int W_94DC;
extern int W_94DE;

far_eb134(a0)
char a0;
{
	int v2;

	far_d7241(B_94A6);
	far_d7241(B_981C);
	switch (a0) {
	case 93:
		far_e8cd3(B_94A6, W_94DE + 1);
		break;
	case 125:
		far_eb1c8();
		break;
	case 91:
		v2 = W_94DE;
		if (W_94DC == 256)
			v2--;
		far_e8cd3(B_94A6, v2);
		break;
	case 123:
		far_eb28c();
		break;
	}
	far_d78a2();
	far_ec4cc();
	far_de758(0);
	return;
}
