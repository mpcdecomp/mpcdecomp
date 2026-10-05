/* differs: +5a jmp $6 | xor ax, ax */
extern char B_A61F;
extern char B_A623;
extern char TBL_A624[];

far_da0f1(a0)
char a0;
{
	char v1;
	char v2;

	far_d8880(&v1, &v2);
	far_d8837(a0);
	TBL_A624[B_A623++] = a0;
	if (B_A623 >= B_A61F) {
		far_d8827(v1, v2);
		--B_A623;
		return -1;
	}
}
