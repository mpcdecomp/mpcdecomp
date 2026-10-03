/* differs: XL v1.20 +1B, 27 bytes */
extern char C2_B_PAD_DRUM;
extern unsigned char C2_B_PAD_NOTE;
char far * __far pgm_indiv_fx_mix_ptr(char, int);

void __far L_51E04(int p0)
{
	char far *v0;

	v0 = pgm_indiv_fx_mix_ptr(C2_B_PAD_DRUM, C2_B_PAD_NOTE);
	*(v0 + 3) &= 0x7f;
	if (!p0) goto br_51E38;
	*(v0 + 3) |= 0x80;
br_51E38:
	;
}
