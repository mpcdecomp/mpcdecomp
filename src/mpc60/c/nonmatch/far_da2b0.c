/* differs: +16 beq $5 | jz br_da2dd */
extern char *W_A61A;

far_da2b0(a0, a1, a2)
{
	far_d9dec(a0);
	if (*W_A61A != 0 && (W_A61A[3] & 15) == 0) {
		*(int *)(W_A61A + 7) = a1;
		*(int *)(W_A61A + 9) = a2;
	}
	return;
}
