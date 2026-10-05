/* differs: +2c cmp byte ptr B_BE48_,0 | mov ax, 1 */
extern char B_94A6;
extern char B_981C;
extern char B_BE48;
extern char B_BE49;
extern int W_BE4A;
extern int W_BE4C;
extern int W_BE4E;
extern int W_BE50;

far_d7185()
{
	if (B_BE49 != -1)
		far_d6a82(&B_981C, W_BE4C, 1);
	else
		far_d55e8(&B_981C);
	if (B_BE48 >= 0)
		far_ec4ae(W_BE4E, W_BE50);
	return;
}
