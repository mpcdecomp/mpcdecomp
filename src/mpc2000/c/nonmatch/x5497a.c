/* differs: XL v1.20 +0, 60 bytes */
extern unsigned char C0_B_0D7C7;
extern char far *C2_FP_08DA0;
extern int C2_W_08DA2;
void __far fx_dsp_update_request(char, char);
char far * __far pgm_fx_section_ptr(int);

void __far fx_mixer_field_notify(void)
{
	fx_dsp_update_request((char)(1 << C0_B_0D7C7), C2_FP_08DA0 ? C2_FP_08DA0[2] : pgm_fx_section_ptr(C0_B_0D7C7)[69]);
}
