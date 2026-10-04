#include "mpc2k.h"

void __near fx_echo_st_arm_field(void)
{
	char far *v0;

	if (!G_FLAG_1589) goto br_046F5;
	goto X_047DB;
br_046F5:
	G_FLAG_1589++;
	v0 = channel_validate(G_STATE_9D8B);
	switch (G_UI_FLAG) { case 0: goto L_047D2; case 1: goto X_04730; case 2: goto X_04752; case 3: goto X_04774; case 4: goto X_047A0; case 5: goto X_047B0; case 6: goto X_047C2; default: goto br_04728; }
br_04728:
	G_UI_FLAG = 0;
	goto L_047D2;
X_04730:
	status_read_6A_3(v0 + 0x3a, 0, 0x63, 2, 0x9d, 0x15, 0, 0, fx_redraw);
	goto L_047D7;
X_04752:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int, void (__far *)(void)))status_read_6A)(v0 + 0x38, 0, 0x14f, 3, 0x97, 0x1f, 0, 0, fx_redraw);
	goto L_047D7;
X_04774:
	status_read_6A_3(v0 + 0x3b, 0x14, 0x42, 2, 0x97, 0x29, 0, 0, fx_redraw);
	win_keys_merge_disable();
	WIN_FIELD_BOX_W = 0x12;
	goto L_047D7;
X_047A0:
	status_read_6A_3(v0 + 0x3e, 0, 0x63, 2, 0xc7, 0x15, 0, 0, fx_redraw);
	goto L_047D7;
X_047B0:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int, void (__far *)(void)))status_read_6A)(v0 + 0x3c, 0, 0x14f, 3, 0xc1, 0x1f, 0, 0, fx_redraw);
	goto L_047D7;
X_047C2:
	status_read_6A_3(v0 + 0x3f, 0x14, 0x42, 2, 0xc1, 0x29, 0, 0, fx_redraw);
	win_keys_merge_disable();
	WIN_FIELD_BOX_W = 0x12;
	goto L_047D7;
L_047D2:
	L_050DC();
L_047D7:
	G_FLAG_1589--;
X_047DB:
	;
}
