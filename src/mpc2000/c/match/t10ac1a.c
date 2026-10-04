#include "mpc2k.h"

void __far __fastcall __loadds L_0AE8C(void)
{
	switch (G_ASSIGN_VIEW_FIELD) { case 0: case 2: case 3: goto br_0AEAA; case 5: goto L_0AEB0; default: goto X_0AEB8; }
	return;
br_0AEAA:
	G_ASSIGN_VIEW_FIELD++;
	goto L_0AEB5;
L_0AEB0:
	G_ASSIGN_VIEW_FIELD = 4;
L_0AEB5:
	midi_txrx_arm_field();
X_0AEB8:
	;
}
