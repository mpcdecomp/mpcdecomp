#include "mpc2k.h"

void __far __fastcall __loadds fx_mixer_up(void)
{
#if FW_VERSION == 172
	switch (FX_MIXER_CURSOR) { case 9: goto L_04D18; case 0: case 3: case 6: goto X_04D20; }
#else
	switch (FX_MIXER_CURSOR) { case 8: goto L_04D18; case 0: case 2: case 5: goto X_04D20; }
#endif
	FX_MIXER_CURSOR--;
	goto L_04D1D;
L_04D18:
#if FW_VERSION == 172
	FX_MIXER_CURSOR = 6;
#else
	FX_MIXER_CURSOR = 5;
#endif
L_04D1D:
	midi_status_read();
X_04D20:
	;
}
