/* differs: +16 beq $5 | jz br_cb28d */
far_cb258()
{
	int v2;

	if ((inport(290) & 2) != 0) {
		v2 = inport(288);
		return v2 == 64;
	}
	return 0;
}
