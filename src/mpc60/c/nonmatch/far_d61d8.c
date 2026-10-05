/* differs: +35 mov ax,word ptr -4[bp] | mov dx, word ptr [bp - 2] */
long far_d61d8(a0)
long a0;
{
	int v2;
	int v4;

	v2 = 0;
	v4 = 0;
	L_de8d2(a0 + 1L, &v4, far_daa7a(), 3);
	return v4;
}
