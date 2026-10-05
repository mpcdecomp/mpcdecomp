/* differs: +f mov byte ptr 61 [bx],al | mov bx, word ptr [bp + 6] */
far_ed328(a0, a1, a2)
char *a0;
{
	a0[60] = a1;
	a0[61] = a2;
	*(int *)(a0 + 62) = a1 * 384 / a2;
	*(int *)(a0 + 64) = 384 / a2;
	return;
}
