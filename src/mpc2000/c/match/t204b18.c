#include "mpc2k.h"

void __far __fastcall __loadds tgt_04C68(int ax)
{
    long t1;

    if ((unsigned int)(ax - G_FX_BLINK_TICK) <= 0x1f4) {
        goto L1;
    }
    G_FX_BLINK_TICK = ax;
    B_4FE2 = (char)(B_4FE2 ^ -128);
    t1 = ((long (__far *)(void))cmd_far_stub2)();
L1:
    return;
}
