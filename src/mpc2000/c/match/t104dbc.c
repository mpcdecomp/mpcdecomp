#include "mpc2k.h"

void __far __fastcall __loadds fx_mixer_left(void)
{
#if FW_VERSION == 172
	switch (FX_MIXER_CURSOR) { case 9: goto L_04D70; case 0: case 1: case 2: goto L_04D78; }
#else
	switch (FX_MIXER_CURSOR) { case 8: case 2: goto L_04D70; case 0: case 1: goto L_04D78; }
#endif
	FX_MIXER_CURSOR -= 3;
	goto L_04D75;
L_04D70:
	FX_MIXER_CURSOR -= 2;
L_04D75:
	midi_status_read();
L_04D78:
	;
}
