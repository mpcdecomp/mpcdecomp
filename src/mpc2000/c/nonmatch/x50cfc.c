/* differs: XL v1.20 +5, 37 bytes */
extern long C0_B_098B8;
extern unsigned char C2_B_PAD_DRUM;
char far * __far ivt_get_vector(int);

int __far L_50CFC(int p0)
{
	char far *v0;

	v0 = ivt_get_vector(C2_B_PAD_DRUM + 0x5c);
	C0_B_098B8 = *(long far *)(v0 + p0 * 4 + 1874);
	return (int)C0_B_098B8;
}
