#include "mpc2kxl.h"

void __far L_48E9C(char p0)
{
	C2_B_REC_MODE = p0;
	((void (__far *)(void))far_48FBA)();
	far_493D2();
	far_4EE54(0x32);
	((void (__far *)(void))far_49218)();
	((void (__far *)(void))far_491A8)();
	((void (__far *)(void))far_49092)();
	switch (((int (__far *)(void))far_490A6)()) { case 0: goto br_48EDC; }
	((void (__far *)(void))far_49266)();
	((void (__far *)(int))far_49308)(0);
br_48EDC:
	;
}
