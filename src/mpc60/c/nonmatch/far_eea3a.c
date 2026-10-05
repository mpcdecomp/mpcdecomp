/* differs: +29 jmp $8 | jmp br_eea8c */
extern char B_A61F;
extern char B_A620;
extern char B_A621;
extern char B_A622;

far_eea3a(a0)
char *a0;
{
	char v1;

	far_d8810(3);
	far_d8827(B_A620, B_A621);
	v1 = 0;
	for (; v1 < B_A61F; ++v1) {
		if (*a0 != 0) {
			a0++;
			far_d8837(*a0++);
			continue;
		}
		far_d8837(32);
	}
	far_d8827(B_A620, B_A621);
	B_A622 = 1;
	return;
}
