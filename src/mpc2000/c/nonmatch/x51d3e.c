/* differs: XL v1.20 +17, 15 bytes */
extern char C2_B_PAD_DRUM;
extern unsigned char C2_B_PAD_NOTE;
char far * __far pgm_indiv_fx_mix_ptr(char, int);

void __far L_51D3E(char p0)
{
	char far *v0;

	v0 = pgm_indiv_fx_mix_ptr(C2_B_PAD_DRUM, C2_B_PAD_NOTE);
	*(v0 + 3) &= 0x80;
	*(v0 + 3) = *(v0 + 3) + p0;
}
