extern char C0_B_0D7C7;
extern char far *C2_FP_08DA0;
extern int C2_W_08DA2;
extern long C2_W_PARAM_HOOK_OFF;
void __far far_556E0(char);
char far * __far pgm_fx_section_ptr(int);

void __far __fastcall __loadds fx_mixer_refresh(void)
{
	if (!C2_FP_08DA0) goto br_54796;
	if (pgm_fx_section_ptr(C0_B_0D7C7)[69] == C2_FP_08DA0[2]) goto br_54796;
	far_556E0(C0_B_0D7C7);
br_54796:
	C2_W_PARAM_HOOK_OFF = 0L;
	return 0;
}
