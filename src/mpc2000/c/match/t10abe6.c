#include "mpc2k.h"

void __far __fastcall __loadds X_0AE58(void)
{
	switch (G_ASSIGN_VIEW_FIELD) { case 0: case 2: goto X_0AE8A; case 1: case 3: case 4: goto X_0AE7C; case 5: goto L_0AE82; default: goto X_0AE87; }
X_0AE7C:
	G_ASSIGN_VIEW_FIELD--;
	goto X_0AE87;
L_0AE82:
	G_ASSIGN_VIEW_FIELD = 2;
X_0AE87:
	midi_txrx_arm_field();
X_0AE8A:
	;
}
