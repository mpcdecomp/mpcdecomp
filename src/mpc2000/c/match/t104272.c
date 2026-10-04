#include "mpc2k.h"

void __near fx_autopan_arm_field(void)
{
	char far *v0;

	if (!G_FLAG_1589) goto br_041F7;
	goto X_042C1;
br_041F7:
	G_FLAG_1589++;
	v0 = channel_validate(G_STATE_9D8B);
	switch (G_UI_MODE) { case 0: goto X_042B8; case 1: goto X_04232; case 2: goto X_04254; case 3: goto X_0426A; case 4: goto X_0427C; case 5: goto X_0428C; case 6: goto X_0429C; default: goto br_0422A; }
br_0422A:
	G_UI_MODE = 0;
	goto X_042B8;
X_04232:
	status_read_6A_3(v0 + 0x20, 0, 0x63, 2, 0x6d, 0x15, L_03808, fx_redraw);
	goto L_042BD;
X_04254:
	status_read_6A_3(v0 + 0x21, 0, 0x63, 2, 0x6d, 0x1f, 0L, fx_redraw);
	goto L_042BD;
X_0426A:
	status_read_6A_3(v0 + 0x22, 0, 0x63, 2, 0x6d, 0x29, 0L, fx_redraw);
	goto L_042BD;
X_0427C:
	status_read_6A_3(v0 + 0x23, 0, 0x63, 2, 0xc1, 0x15, L_03808, fx_redraw);
	goto L_042BD;
X_0428C:
	status_read_6A_3(v0 + 0x24, 0, 0x63, 2, 0xc1, 0x1f, 0L, fx_redraw);
	goto L_042BD;
X_0429C:
	voice_trigger_full(v0 + 0x25, 3, 0xc1, 0x29, 5, fx_redraw);
	goto L_042BD;
X_042B8:
	X_04E24();
L_042BD:
	G_FLAG_1589--;
X_042C1:
	;
}
