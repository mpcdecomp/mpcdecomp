extern char B_A61C;
extern char B_A61D;

far_d9e1e(a0)
{
	B_A61C = B_A61D;
	switch (a0 & 0xf00) {
	case 2048:
		far_d9e7f(1);
		break;
	case 1024:
		far_d9e7f(-1);
		break;
	case 256:
		far_d9ebd(-1);
		break;
	case 512:
		far_d9ebd(1);
		break;
	}
	return;
}
