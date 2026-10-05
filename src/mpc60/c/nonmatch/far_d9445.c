/* differs: +55 jmp $11 | jmp br_d94c3 */
far_d9445(a0, a1, a2)
char a1;
char a2;
{
	char z0[42];
	char v43;
	char v44;
	char v45;
	char *v47;

	if ((a2 & 8) != 0)
		a0 &= 255;
	v44 = 32;
	if ((a2 & 2) != 0)
		v44 = 48;
	far_daa7d(a0, &v43, a1, v44);
	if ((a2 & 4) != 0)
		far_d974c(&v43);
	v47 = &v43;
	v45 = 0;
	for (; v45 < a1; ++v45) {
		if (*v47 != 0) {
			v47++;
			far_d8837(*v47++);
			continue;
		}
		far_d8837(32);
	}
	return;
}
