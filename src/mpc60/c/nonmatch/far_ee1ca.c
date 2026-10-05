/* differs: +f beq $5 | jz br_ee1fd */
extern char B_515E;

far_ee1ca(a0)
{
	char v1;

	if ((v1 = B_515E) != 0) {
		v1++;
		if (a0 == 0)
			v1 = v1 >> 1;
		outport(416, v1);
	}
	return;
}
