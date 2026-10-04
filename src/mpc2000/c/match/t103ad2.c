#include "mpc2k.h"

void __near fx_dist_arm_field(void)
{
	char far *v0;

	if (G_FLAG_1589) goto X_03AE8;
	G_FLAG_1589++;
	v0 = channel_validate(G_STATE_9D8B);
	switch (FX_DIST_CURSOR) { case 0: goto br_03AC6; case 1: goto br_03A84; case 2: goto L_03A94; case 3: goto br_03AB4; }
	FX_DIST_CURSOR = 0;
	goto br_03AC6;
br_03A84:
	status_read_6A_3(v0 + 4, 0, 0x63, 2, 0x4f, 0x24, 0L, fx_redraw);
	goto L_03AE4;
L_03A94:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int))status_read_6A)(v0, 0, 0x1388, 4, 0xaf, 0x19, 0, 0, fx_redraw);
	goto L_03AE4;
br_03AB4:
	status_read_6A_3(v0 + 2, 0, 0x63, 2, 0xaf, 0x24, 0L, fx_redraw);
	goto L_03AE4;
br_03AC6:
	status_read_6A_3(v0 + 3, 0, 0x63, 2, 0x4f, 0x19, 0L, fx_redraw);
L_03AE4:
	G_FLAG_1589--;
X_03AE8:
	;
}
