extern char A_B258[];
extern int W_AE68;
extern int W_AE6A;

fn_c5ff1()
{
	int v2;

	setmem(A_B258, 0x800, 0);
	W_AE6A = 0;
	W_AE68 = 0;
	v2 = 0;
	do {
		far_e01a3(0, A_B258, 0x400);
		++v2;
	} while (v2 < 512);
	return;
}
