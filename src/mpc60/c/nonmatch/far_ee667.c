/* differs: +33 mov ax,word ptr 8[bp] | mov dx, word ptr [bp + 8] */
extern char B_5504;
extern char TBL_A624[];
extern int W_8CD1;
extern int W_A650;

far_ee667(a0, a1)
{
	int *v2;

	far_ee6ad(a0, a1, TBL_A624);
	far_eea3a(TBL_A624);
	a1 -= W_8CD1;
	v2 = W_A650;
	v2[1] = a1;
	*v2 = a0;
	B_5504 = 1;
	return;
}
