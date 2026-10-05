/* differs: +e shl ax,1 | mov dx, ax */
extern char B_5503;
extern int TBL_0BC4[];
extern char TBL_347E[];

far_cb4b4(a0)
{
	far_d8827(a0 / 4 + 1, (a0 % 4 << 2) + a0 % 4 << 1);
	far_d885c(TBL_0BC4[TBL_347E[a0] + B_5503]);
	far_d885c(0x3136);
	return;
}
