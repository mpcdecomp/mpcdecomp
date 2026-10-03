#include "mpc2k.h"

void __far __fastcall __loadds fx_mixer_down(void)
{
#if FW_VERSION == 172
	switch (FX_MIXER_CURSOR) { case 2: case 5: case 8: goto L_04D4C; case 9: goto L_04D44; }
#else
	switch (FX_MIXER_CURSOR) { case 1: case 4: case 7: goto L_04D4C; case 8: goto L_04D44; }
#endif
	FX_MIXER_CURSOR++;
	goto L_04D49;
L_04D44:
#if FW_VERSION == 172
	FX_MIXER_CURSOR = 8;
#else
	FX_MIXER_CURSOR = 7;
#endif
L_04D49:
	midi_status_read();
L_04D4C:
	;
}
