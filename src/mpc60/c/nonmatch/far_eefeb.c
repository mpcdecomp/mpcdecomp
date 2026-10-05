/* differs: +2b mov ax, word ptr W_8BE3_ | mov ax, 3eh */
extern char B_521A;
extern char B_54FD;
extern int W_8BE3;
extern int W_8BE5;

far_eefeb()
{
	char v1;
	char v35[34];
	char v36;
	char v37;
	int v39;
	register int r1;

	if (B_54FD != 0)
		return;
	setmem(v35, 35, 32);
	v1 = 0;
	v39 = W_8BE3 / 964 + 1;
	setmem(v35, v39, 62);
	for (; ; ) {
		--v39;
		if (v39 <= 31)
			break;
		r1 = v39;
		v35[r1] = 33;
	}
	v39 = W_8BE5 / 964;
	if (v39 > 31) {
		r1 = v39;
		v35[r1] = 33;
	}
	else {
		r1 = v39;
		v35[r1] = 62;
	}
	r1 = (B_521A << 5) / 100;
	v35[r1] = 84;
	far_d8880(&v36, &v37);
	far_d8810(0);
	far_d8827(5, 6);
	far_d885c(v35);
	far_d8827(v36, v37);
	far_d8810(3);
}
