/* differs: +c bne $5 | jnz br_c3491 */
extern int B_501C;

far_c3470(a0, a1)
{
	if (a0-- == 0)
		return a0--;
	if ((B_501C & 255) == a0)
		return B_501C & 255;
	strcpy(a0 * 9 + 0x5da3, a1);
}
