/* differs: XL v1.20 +1, 31 bytes */
extern unsigned char C2_B_PAD_DRUM;
extern char C2_B_PAD_NOTE;
char far * __far ivt_get_vector(int);

void __far L_4E47A(int p0)
{
	char far *v0;

	v0 = ivt_get_vector(C2_B_PAD_DRUM + 0x5c);
	if ((unsigned char)(v0 + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a)[3] > p0) goto br_4E4B7;
	(v0 + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a)[3] = (char)(p0 + 1);
br_4E4B7:
	;
}
