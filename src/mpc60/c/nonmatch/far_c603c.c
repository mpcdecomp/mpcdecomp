/* differs: +2f mov al, byte ptr W_BA58_ | push word ptr [W_BA58] */
extern char STR_242E[];
extern char W_BA58;

far_c603c()
{
	int v2;

	far_d97f5();
	far_d880a();
	far_d936c(STR_242E, &W_BA58, 2, 0, 33, 2);
	far_c609e(W_BA58);
	for (; ; ) {
		if ((v2 = far_d981a(0)) != 0)
			break;
		far_c609e(W_BA58);
	}
	return v2;
}
