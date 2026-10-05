/* differs: +c mov ax, offset SEG_D880_ | mov dx, SEG_D880 */
extern char SEG_D880[];

far_d88e6(a0, a1)
char a1;
{
	register int r1;

	r1 = a0;
	format(58, SEG_D880, r1, &a1);
	return;
}
