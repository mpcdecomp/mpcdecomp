void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(memset)
extern char BUF_SYSEX_RX[1];
extern long G_OLD_INT4E_OFF;
extern char P_8B9E[1];
void __far L_0D0C8(void);
long __far ivt_get_vector(int);
void __far ivt_set_vector(int, void (far *)(void));

void __near fn_0AA0C(void)
{
	memset(P_8B9E, 0, 0x102);
	memset(BUF_SYSEX_RX, 0, 0x82);
	G_OLD_INT4E_OFF = ivt_get_vector(0x4e);
	ivt_set_vector(0x4e, L_0D0C8);
}
