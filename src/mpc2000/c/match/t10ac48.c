#include "mpc2k.h"

void __far __fastcall __loadds tgt_0AEBA(void)
{
	switch (G_ASSIGN_VIEW_FIELD) { case 2: case 3: goto br_0AED6; case 4: goto br_0AEDE; case 5: goto L_0AEE6; default: goto L_0AEEE; }
	return;
br_0AED6:
	G_ASSIGN_VIEW_FIELD -= 2;
	goto br_0AEEB;
br_0AEDE:
	G_ASSIGN_VIEW_FIELD = 1;
	goto br_0AEEB;
L_0AEE6:
	G_ASSIGN_VIEW_FIELD = 4;
br_0AEEB:
	midi_txrx_arm_field();
L_0AEEE:
	;
}
