void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(memset)
extern char G_PAD_INDEX;
extern char G_PAD_NOTE_BASE[1];
extern char TBL_WINKEYS_005C4[1];
void __far L_03ADC(void);
void __far L_0ACFE(void);
void __far ivt_set_vector(int, void (far *)(void));
void __far __pascal win_keys_merge(char far *);

int __far X_00DF6(void)
{
	ivt_set_vector(0x42, L_03ADC);
	ivt_set_vector(0x4c, L_0ACFE);
	win_keys_merge(TBL_WINKEYS_005C4);
	memset(G_PAD_NOTE_BASE, 0, 7);
	G_PAD_NOTE_BASE[0] = 0x23;
	G_PAD_INDEX = 0;
	return 0;
}
