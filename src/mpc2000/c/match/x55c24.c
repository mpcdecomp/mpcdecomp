#include "mpc2kxl.h"

extern char EP_L_3D724_OFF[1];
extern char EP_L_3D724_SEG[1];

void __far L_55C24(void)
{
	((void (__far *)(char __near *, char __near *))far_4C0D8)(EP_L_3D724_OFF, EP_L_3D724_SEG);
}
