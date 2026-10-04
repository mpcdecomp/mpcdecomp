#include "mpc2kxl.h"

extern char EP_FAR_4EC12_OFF[1];
extern char EP_FAR_4EC12_SEG[1];

void __far __fastcall __loadds pgm_midi_f3(void)
{
	pgm_midi_refresh();
	((void (__far *)(char __near *, char __near *))far_4DBAA)(EP_FAR_4EC12_OFF, EP_FAR_4EC12_SEG);
}
