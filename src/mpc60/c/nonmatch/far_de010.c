/* differs: +10 push bx | push word ptr [bp + 6] */
extern char TBL_5284[];

far_de010(a0, a1)
{
	TBL_5284[a0] = a1;
	far_ddf9a(a0, a1);
	return;
}
