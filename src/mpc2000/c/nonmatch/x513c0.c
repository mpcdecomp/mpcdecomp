/* differs: XL v1.20 +1, 149 bytes */
extern char C2_B_PAD_DRUM;
char far * __far ivt_get_vector(int);
char far * __far pgm_indiv_fx_mix_ptr(int, int);

void __far L_513C0(int p0)
{
	unsigned di_;
	int dx_;
	char far *v0;

	if (ivt_get_vector(C2_B_PAD_DRUM + 0x60)[p0] < 0x23) goto br_513F2;
	if (ivt_get_vector(C2_B_PAD_DRUM + 0x60)[p0] > 0x62) goto br_513F2;
	dx_ = 1;
	goto br_513F4;
br_513F2:
	dx_ = 0;
br_513F4:
	if (!dx_) goto br_5142A;
	v0 = pgm_indiv_fx_mix_ptr(C2_B_PAD_DRUM, ivt_get_vector(C2_B_PAD_DRUM + 0x60)[p0]);
	di_ = v0[3] & 0xf;
	if (di_ >= 8) goto br_5142A;
	v0[3] = v0[3] & 0x80 | (char)(di_ + 1);
br_5142A:
	;
}
