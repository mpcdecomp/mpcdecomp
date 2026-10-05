/* differs: +10 beq $6 | jz br_d86f7 */
far_d86d2(a0)
char *a0;
{
	for (; ; ) {
		if ((*a0 = far_d861e()) == 13)
			break;
		a0++;
		far_d8837(*a0++);
	}
	*a0 = 0;
	far_d8837(10);
	return;
}
