/* differs: XL v1.20 +1, 148 bytes */
extern char C2_B_PAD_DRUM;
char far * __far ivt_get_vector(int);
char far * __far pgm_indiv_fx_mix_ptr(int, int);

void __far L_5142E(int p0)
{
	int di_;
	int dx_;
	char far *v0;

	if (ivt_get_vector(C2_B_PAD_DRUM + 0x60)[p0] < 0x23) goto br_51460;
	if (ivt_get_vector(C2_B_PAD_DRUM + 0x60)[p0] > 0x62) goto br_51460;
	dx_ = 1;
	goto br_51462;
br_51460:
	dx_ = 0;
br_51462:
	if (!dx_) goto br_51497;
	v0 = pgm_indiv_fx_mix_ptr(C2_B_PAD_DRUM, ivt_get_vector(C2_B_PAD_DRUM + 0x60)[p0]);
	di_ = v0[3] & 0xf;
	switch (di_) { case 0: goto br_51497; }
	v0[3] = v0[3] & 0x80 | (char)(di_ - 1);
br_51497:
	;
}
