/* differs: XL v1.20 +5, 121 bytes */
extern char C2_B_PAD_DRUM;
void __far far_51036(int, int, int);
char far * __far ivt_get_vector(int);
char far * __far pgm_stereo_mix_ptr(int, int);

void __far L_51062(int p0)
{
	int l6;
	int si_;
	int dx_;
	char far *v0;

	si_ = ivt_get_vector(C2_B_PAD_DRUM + 0x60)[p0];
	if (si_ < 0x23) goto br_51096;
	if (si_ > 0x62) goto br_51096;
	dx_ = 1;
	goto br_51098;
br_51096:
	dx_ = 0;
br_51098:
	if (!dx_) goto br_510E3;
	v0 = pgm_stereo_mix_ptr(C2_B_PAD_DRUM, si_);
	l6 = ((unsigned char)*v0 + 2) / 3;
	if (l6 >= 0x22) goto br_510E3;
	*v0 = (char)l6 * 3 + 1;
	far_51036(1, p0, (unsigned char)((char)l6 * 3 + 1));
br_510E3:
	;
}
