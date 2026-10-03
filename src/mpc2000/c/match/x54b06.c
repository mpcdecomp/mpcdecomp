extern char C0_B_0D7C7;
extern char far *C2_FP_08DAA;
extern int C2_W_08DAC;
extern long C2_W_PARAM_HOOK_OFF;
void __far far_556E0(char);
char far * __far pgm_fx_reverb_ptr(int);

void __far __fastcall __loadds effect_mixer_refresh(void)
{
	if (!C2_FP_08DAA) goto br_54B40;
	if (pgm_fx_reverb_ptr(C0_B_0D7C7)[1] == C2_FP_08DAA[2]) goto br_54B40;
	far_556E0(C0_B_0D7C7);
br_54B40:
	C2_W_PARAM_HOOK_OFF = 0L;
	return 0;
}
