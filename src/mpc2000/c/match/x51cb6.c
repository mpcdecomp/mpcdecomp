extern char C2_B_PAD_DRUM;
extern unsigned char C2_B_PAD_NOTE;
char far * __far pgm_stereo_mix_ptr(char, int);

void __far L_51CB6(char p0)
{
	pgm_stereo_mix_ptr(C2_B_PAD_DRUM, C2_B_PAD_NOTE)[1] = p0 + 0x32;
}
