/* differs: +13 mov al, byte ptr 1 [bx] | cbw */
extern char B_A61E;
extern char B_A61F;
extern char B_A620;
extern char B_A621;
extern char B_A622;
extern char B_A623;
extern char B_A64D;
extern char TBL_A624[];
extern char *W_A61A;
extern int W_A650;
extern int W_A652;
extern int W_A654;

far_d9fa5()
{
	B_A61F = W_A61A[4];
	B_A621 = W_A61A[2];
	B_A620 = W_A61A[1];
	far_d8827(B_A620, B_A621);
	W_A650 = *(int *)(W_A61A + 5);
	W_A652 = *(int *)(W_A61A + 7);
	W_A654 = *(int *)(W_A61A + 9);
	B_A623 = 0;
	TBL_A624[B_A623] = 0;
	B_A64D = 0;
	B_A622 = 1;
	B_A61E = W_A61A[3];
	return;
}
