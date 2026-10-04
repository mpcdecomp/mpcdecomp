/* differs: XL v1.20 +D, 20 bytes */
extern char C0_B_DSP_CHAN;
char far * __far pgm_fx_section_ptr(int);

int __far far_3741F(void)
{
	char far *v0;

	v0 = pgm_fx_section_ptr(C0_B_DSP_CHAN);
	return FP_OFF(pgm_fx_section_ptr(C0_B_DSP_CHAN));
}
