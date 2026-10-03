/* differs: XL v1.20 +4F, 9 bytes */
void __far disp_list_run(char __near *);

void __far draw_shadow_box(char p0, char p1, char p2, char p3)
{
	char l14[14];

	l14[0] = 0x11;
	l14[1] = p0;
	l14[2] = p1;
	l14[3] = p2;
	l14[4] = p3;
	l14[5] = 0xb;
	l14[6] = p0 + 1;
	l14[7] = p3 + p1;
	l14[8] = p2;
	l14[9] = 0xe;
	l14[10] = p2 + p0;
	l14[11] = p1 + 1;
	l14[12] = p3 - 1;
	l14[13] = 0;
	disp_list_run(l14);
}
