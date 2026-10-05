extern char B_501C;
extern char STR_1C84[];
extern char STR_1C8D[];

far_c3404(a0, a1, a2)
{
	int v2;

	v2 = far_c35da(a0, a1);
	if (v2 == -1) {
		strcpy(a2, STR_1C84);
		return;
	}
	if (B_501C == (v2 & 15)) {
		strcpy(a2, STR_1C8D);
		return;
	}
	strcpy(a2, v2 * 9 + 0x4c33);
}
