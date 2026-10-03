#include "mpc2k.h"

void __near fx_pitch_arm_field(void)
{
	char far *v0;

	if (!G_FLAG_1589) goto br_0437B;
	goto X_04455;
br_0437B:
	G_FLAG_1589++;
	v0 = ((char __far * (__far *)(int))channel_validate)(G_STATE_9D8B);
	if (G_FX_EFFECT_SEL == 6) goto br_043A1;
	if (G_UI_MODE <= 2) goto br_043A1;
	G_UI_MODE = 0;
br_043A1:
	switch (G_UI_MODE) { case 0: goto L_0444C; case 1: goto X_043CA; case 2: goto L_043DC; case 3: goto X_043E6; case 4: goto X_04408; case 5: goto L_0441A_1; case 6: goto X_0443C; default: goto br_043C2; }
br_043C2:
	G_UI_MODE = 0;
	goto L_0444C;
X_043CA:
	cmd_exec_multi(v0 + 0x26, 0x91, 0x15);
	goto L_04451;
L_043DC:
	cmd_exec_multi(v0 + 0x28, 0xbb, 0x15);
	goto L_04451;
X_043E6:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int, void (__far *)(void)))status_read_6A)(v0 + 0x2a, 0, 0x113, 3, 0x97, 0x1f, 0, 0, fx_redraw);
	goto L_04451;
X_04408:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int, void (__far *)(void)))status_read_6A)(v0 + 0x2c, 0, 0x113, 3, 0xc1, 0x1f, 0, 0, fx_redraw);
	goto L_04451;
L_0441A_1:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int, void (__far *)(void)))status_read_6A_3)(v0 + 0x2e, 0, 0x63, 2, 0x9d, 0x29, 0, 0, fx_redraw);
	goto L_04451;
X_0443C:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int, void (__far *)(void)))status_read_6A_3)(v0 + 0x2f, 0, 0x63, 2, 0xc7, 0x29, 0, 0, fx_redraw);
	goto L_04451;
L_0444C:
	X_04E24();
L_04451:
	G_FLAG_1589--;
X_04455:
	;
}
