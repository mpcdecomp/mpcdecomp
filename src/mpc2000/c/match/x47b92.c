#include "mpc2kxl.h"

extern char C2_W_011F0[1];
extern char EP_L_3E59E_OFF[1];
extern char EP_L_3E59E_SEG[1];
extern char EP_L_5596A_OFF[1];
extern char EP_L_5596A_SEG[1];

void __far install_text2_vectors(void)
{
	((void (__far *)(char __far *))handler_set_install)(C2_W_011F0);
	((void (__far *)(int, char __near *, char __near *))ivt_set_vector)(0x41, EP_L_3E59E_OFF, EP_L_3E59E_SEG);
	((void (__far *)(int, char __near *, char __near *))ivt_set_vector)(0x4c, EP_L_5596A_OFF, EP_L_5596A_SEG);
}
