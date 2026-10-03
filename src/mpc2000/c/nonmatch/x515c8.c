/* differs: XL v1.20 +4, 127 bytes */
extern char C2_B_PAD_DRUM;
char far * __far ivt_get_vector(int);
char far * __far pgm_indiv_fx_mix_ptr(int, int);

void __far L_515C8(int p0)
{
	int dx_;
	char far *v0;

	if (ivt_get_vector(C2_B_PAD_DRUM + 0x60)[p0] < 0x23) goto br_515FA;
	if (ivt_get_vector(C2_B_PAD_DRUM + 0x60)[p0] > 0x62) goto br_515FA;
	dx_ = 1;
	goto br_515FC;
br_515FA:
	dx_ = 0;
br_515FC:
	if (!dx_) goto br_51620;
	v0 = pgm_indiv_fx_mix_ptr(C2_B_PAD_DRUM, ivt_get_vector(C2_B_PAD_DRUM + 0x60)[p0]);
	if ((unsigned char)v0[5] >= 4) goto br_51620;
	v0[5]++;
br_51620:
	;
}
