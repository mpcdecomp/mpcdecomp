#include "mpc2k.h"

int __near __pascal ui_screen_enter(long p4, long p2, long p0)
{
	win_keys_merge(P_15A6);
	win_keys_merge(p4);
	FP_UI_RETURN_SCREEN = p0;
	if (!p0) goto L_03997;
	install_handler(WIN_K_F5, (void (far *)(void))X_04CC2);
L_03997:
	FP_POLL_HOOK = p2;
	return *(int *)&p2;
}
