/* differs: +2a bne $5 | jnz br_e7e8a */
extern int B_501C;
extern char B_8C07;
extern char B_9D37;

far_e7e29(a0, a1)
unsigned char *a0;
{
	int v2;

	v2 = (a0[1] ^ B_501C) & 15;
	a0[1] = B_9D37;
	if (B_8C07 != 0 || v2 == 0)
		far_f0553(a0, a1);
	else
		far_f077e(a0, a1);
	return;
}
