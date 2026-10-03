#include "mpc2k.h"

void __near fx_rotary_arm_field(void)
{
	char far *v0;

	if (!G_FLAG_1589) goto br_04081;
	goto X_04131;
br_04081:
	G_FLAG_1589++;
	v0 = ((char __far * (__far *)(int))channel_validate)(G_STATE_9D8B);
	switch (G_UI_MODE) { case 0: goto X_04128; case 1: goto X_040BA; case 2: goto X_040DC; case 3: goto X_040F2; case 4: goto X_04104; case 5: goto X_04116; default: goto br_040B2; }
br_040B2:
	G_UI_MODE = 0;
	goto X_04128;
X_040BA:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, void (__far *)(void), void (__far *)(void)))status_read_6A_3)(v0 + 0x1b, 0, 0x63, 2, 0x43, 0x19, L_03808, fx_redraw);
	goto L_0412D;
X_040DC:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, void (__far *)(void), void (__far *)(void)))status_read_6A_3)(v0 + 0x1e, 0, 0x63, 2, 0x43, 0x24, 0L, fx_redraw);
	goto L_0412D;
X_040F2:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, void (__far *)(void), void (__far *)(void)))status_read_6A_3)(v0 + 0x1f, 0, 0x7f, 3, 0xc7, 0x15, 0L, fx_redraw);
	goto L_0412D;
X_04104:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, void (__far *)(void), void (__far *)(void)))status_read_6A_3)(v0 + 0x1d, 0, 0x63, 2, 0xc7, 0x1f, L_03808, fx_redraw);
	goto L_0412D;
X_04116:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, void (__far *)(void), void (__far *)(void)))status_read_6A_3)(v0 + 0x1c, 0, 0x63, 2, 0xc7, 0x29, L_03808, fx_redraw);
	goto L_0412D;
X_04128:
	X_04E24();
L_0412D:
	G_FLAG_1589--;
X_04131:
	;
}
