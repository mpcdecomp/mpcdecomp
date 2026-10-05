/* differs: +e beq $5 | jmp near br_d9d9f */
extern char B_A61E;
extern char B_A61F;
extern char B_A620;
extern char B_A621;
extern char B_A622;
extern char B_A623;
extern char B_A64D;
extern char TBL_A624[];

far_d9d00(a0)
char *a0;
{
	char v1;

	if (B_A622 != 0) {
		far_d8810(2);
		B_A623 = 0;
		for (; B_A623 < B_A61F; far_d8837(v1), TBL_A624[B_A623] = v1, B_A623++) {
			if (*a0 != 0) {
				v1 = *a0++;
				continue;
			}
			v1 = 32;
		}
		TBL_A624[B_A61F] = 0;
		B_A623 = 0;
		far_d8827(B_A620, B_A621);
		B_A622 = 0;
		B_A64D = (B_A61E & 15) == 1;
	}
	return;
}
