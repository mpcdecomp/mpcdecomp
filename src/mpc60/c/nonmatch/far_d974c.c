/* differs: +11 mov ax,word ptr -2[bp] | mov bx, word ptr [bp - 2] */
far_d974c(a0)
char *a0;
{
	int v2;
	char v3;

	v2 = a0;
	v3 = 0;
	while (*(char *)v2++ != 0)
		++v3;
	if (v3 < 2)
		return;
	v2 = a0;
	--v3;
	for (; ; ) {
		--v3;
		if (v3 == 0)
			break;
		++a0;
		*(char *)v2++ = *a0;
	}
	*a0 = 46;
}
