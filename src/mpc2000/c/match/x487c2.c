#include "mpc2kxl.h"

extern char C1_SEG[1];
extern char C2_B_08EBE;
extern char C2_B_08FCA;
extern char C2_B_098BC;
extern char EP_L_487FC_OFF[1];

void __far far_487C2(void)
{
	((void (__far *)(void))far_49092)();
	switch (((int (__far *)(void))far_490A6)()) { case 0: goto br_487FB; }
	((void (__far *)(void))far_49266)();
	((void (__far *)(int))far_49308)(0);
	C2_B_098BC = 0;
	C2_B_REC_CANCEL_REQ = 0;
	C2_B_08EBE = 0;
	C2_B_08FCA = 0;
	((void (__far *)(char __near *, char __near *))event_cb_set_main)(EP_L_487FC_OFF, C1_SEG);
br_487FB:
	;
}
