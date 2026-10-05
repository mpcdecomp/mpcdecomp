extern char B_53DB;
extern char B_53DC;
extern char B_5504;
extern char B_A61C;
extern char TBL_5328[];

far_da3ad(a0)
{
	int v2;

	B_A61C = a0;
	if ((v2 = far_da367(B_53DB, B_53DC)) >= 0) {
		TBL_5328[v2] = B_A61C;
		B_5504 = 1;
	}
	return;
}
