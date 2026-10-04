/* differs: XL v1.20 +5, 135 bytes */
extern char C2_B_PAD_DRUM;
void __far far_51036(int, int, int);
char far * __far ivt_get_vector(int);
char far * __far pgm_stereo_mix_ptr(int, int);

void __far L_510E6(int p0)
{
	int l2;
	int si_;
	int dx_;
	char far *v0;

	si_ = ivt_get_vector(C2_B_PAD_DRUM + 0x60)[p0];
	if (si_ < 0x23) goto br_5111A;
	if (si_ > 0x62) goto br_5111A;
	dx_ = 1;
	goto br_5111C;
br_5111A:
	dx_ = 0;
br_5111C:
	if (!dx_) goto br_51178;
	v0 = pgm_stereo_mix_ptr(C2_B_PAD_DRUM, si_);
	l2 = ((unsigned char)*v0 + 2) / 3;
	if (l2 <= 0) goto br_51178;
	l2--;
	if (!l2) goto br_5115F;
	l2 = l2 * 3 - 2;
br_5115F:
	*v0 = (char)l2;
	far_51036(1, p0, (unsigned char)(char)l2);
br_51178:
	;
}
