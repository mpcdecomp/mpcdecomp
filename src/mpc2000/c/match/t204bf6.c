#include "mpc2k.h"

void __far far_04D46(void)
{
	switch (G_FX_EFFECT_SEL) { case 0: case 1: case 2: goto X_04D66; case 3: goto X_04D6C; case 4: goto L_04D72; case 5: case 6: goto L_04D78_1; default: goto L_04D7D; }
X_04D66:
	X_03F3E();
	return;
X_04D6C:
	X_04058();
	return;
L_04D72:
	X_041CE();
	return;
L_04D78_1:
	X_04352();
L_04D7D:
	;
}
