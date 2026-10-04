#include "mpc2k.h"

void __far __fastcall __loadds fx_mixer_right(void)
{
#if FW_VERSION == 172
	switch (FX_MIXER_CURSOR) { case 9: goto br_04DA2; case 6: case 7: case 8: goto L_04D9A; }
	FX_MIXER_CURSOR += 3;
	goto L_04D9F;
L_04D9A:
	FX_MIXER_CURSOR = 9;
#else
	switch (FX_MIXER_CURSOR) { case 8: goto br_04DA2; case 0: goto L_07412; case 5: case 6: case 7: goto L_04D9A; }
	FX_MIXER_CURSOR += 3;
	goto L_04D9F;
L_07412:
	FX_MIXER_CURSOR += 2;
	goto L_04D9F;
L_04D9A:
	FX_MIXER_CURSOR = 8;
#endif
L_04D9F:
	midi_status_read();
br_04DA2:
	;
}
