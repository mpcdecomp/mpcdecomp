#include "mpc2kxl.h"

extern char EP_FAR_4BD70_OFF[1];
extern char EP_FAR_4BD70_SEG[1];

void __far far_4BFEA(void)
{
	((void (__far *)(char __near *, char __near *))far_4C0D8)(EP_FAR_4BD70_OFF, EP_FAR_4BD70_SEG);
}
