#if FW_VERSION == 150
void far * __cdecl _fmemcpy(void far *, const void far *, unsigned);
#pragma intrinsic(_fmemcpy)
extern char B_980B_V150;
extern long FP_POLL_HOOK;
extern unsigned char G_PAD_BANK;
extern unsigned char G_PAD_INDEX;
extern char P_10CC[1];
extern char TBL_WINKEYS_0100E[1];
extern char W_64BE[1];
void __far __fastcall __loadds L_03DD4(void);
void __far __pascal disp_list_run(char far *);
void __far __fastcall __loadds far_03DAA(void);
char __far pad_bank_get(void);
void __far __pascal win_keys_merge(char far *);

void __far __pascal voice_block_copy(char far *p0)
{
	FP_POLL_HOOK = 0L;
	_fmemcpy((char far *)W_64BE, p0, 0x18);
	G_PAD_INDEX &= 0xf;
	if (B_980B_V150) {
		far_03DAA();
	} else {
		L_03DD4();
	}
	G_PAD_BANK = pad_bank_get();
	win_keys_merge(TBL_WINKEYS_0100E);
	disp_list_run(P_10CC);
}
#else
void far * __cdecl _fmemcpy(void far *, const void far *, unsigned);
#pragma intrinsic(_fmemcpy)
extern char B_9A4C;
extern long FP_POLL_HOOK;
extern unsigned char G_PAD_BANK;
extern unsigned char G_PAD_INDEX;
extern char P_10CC[1];
extern char TBL_WINKEYS_0100E[1];
extern char W_64BE[1];
extern int W_9A4A;
void __far __fastcall __loadds L_03DD4(void);
void __far __pascal disp_list_run(char far *);
void __far __fastcall __loadds far_03DAA(void);
char __far pad_bank_get(void);
void __far __pascal win_keys_merge(char far *);

void __far __pascal voice_block_copy(char far *p0)
{
	FP_POLL_HOOK = 0L;
	_fmemcpy((char far *)W_64BE, p0, 0x18);
	G_PAD_INDEX &= 0xf;
	B_9A4C &= 0xfd;
	if (W_9A4A) goto L_03CC4;
	W_9A4A = 1 << G_PAD_INDEX;
L_03CC4:
	if (B_9A4C & 1) {
		far_03DAA();
	} else {
		L_03DD4();
	}
	G_PAD_BANK = pad_bank_get();
	win_keys_merge(TBL_WINKEYS_0100E);
	disp_list_run(P_10CC);
}
#endif
