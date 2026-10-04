/* differs: XL v1.20 +D, 21 bytes */
extern char C0_B_DSP_CHAN;
char far * __far pgm_fx_reverb_ptr(int);

int __far L_36E4E(void)
{
	char far *v0;

	v0 = pgm_fx_reverb_ptr(C0_B_DSP_CHAN);
	return FP_OFF(pgm_fx_reverb_ptr(C0_B_DSP_CHAN));
}
