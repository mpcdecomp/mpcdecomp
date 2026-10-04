/* differs: XL v1.20 +1, 251 bytes */
void far * __cdecl _fmemcpy(void far *, const void far *, unsigned);
#pragma intrinsic(_fmemcpy)
extern char C0_B_098B8;
extern char C2_B_098B9;
extern char C2_B_COPY_FX_DST_SET;
extern int C2_FP_PGM_ARRAY;
extern char C2_W_098BA;
extern int C2_W_PGM_ARRAY_SEG;
extern char PGM_FX_REVERBS[1];
void __far __fastcall __loadds copy_fx_open(void);
void __far fx_dsp_update_request(int, int);

void __far __fastcall __loadds copy_fx_f5(void)
{
	char far *l4;
	char l5;
	int l6;
	char far *l8;
	char l9;
	char far *l14;
	char far *l18;
	int si_;
	int di_;

	if (C2_B_098B9 != C0_B_098B8) goto br_524BB;
	if (C2_W_098BA == C2_B_COPY_FX_DST_SET) goto br_525D6;
br_524BB:
	si_ = C0_B_098B8;
	*(int *)&l14 = 0x48 * C2_W_098BA + si_ * 0x99e + C2_FP_PGM_ARRAY + 0x8de;
	((int *)&l14)[1] = C2_W_PGM_ARRAY_SEG;
	di_ = C0_B_098B8;
	*(int *)&l18 = C2_W_098BA * 12 + di_ * 0x99e + C2_FP_PGM_ARRAY + PGM_FX_REVERBS;
	((int *)&l18)[1] = C2_W_PGM_ARRAY_SEG;
	si_ = C2_B_098B9;
	*(int *)&l8 = C2_B_COPY_FX_DST_SET * 0x48 + si_ * 0x99e + C2_FP_PGM_ARRAY + 0x8de;
	((int *)&l8)[1] = C2_W_PGM_ARRAY_SEG;
	*(int *)&l4 = C2_B_COPY_FX_DST_SET * 12 + C2_B_098B9 * 0x99e + C2_FP_PGM_ARRAY + PGM_FX_REVERBS;
	((int *)&l4)[1] = C2_W_PGM_ARRAY_SEG;
	if (C2_W_098BA >= 2) goto br_52582;
	if (C2_B_COPY_FX_DST_SET >= 2) goto br_52582;
	l9 = l8[71];
	_fmemcpy(l8, l14, 0x48);
	l8[71] = l9;
br_52582:
	l5 = l4[10];
	*(char *)&l6 = l4[11];
	_fmemcpy(l4, l18, 0xc);
	if (C2_W_098BA >= 2) goto br_525C5;
	if (C2_B_COPY_FX_DST_SET < 2) goto br_525C5;
	l4[10] = l5;
	l4[11] = (char)l6;
br_525C5:
	fx_dsp_update_request(0xf, 0);
	copy_fx_open();
br_525D6:
	;
}
