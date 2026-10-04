#include "mpc2k.h"

void __far __fastcall __loadds T2_X_03656(int ax, int dx)
{
    int t1;
    long t2;

    if (dx == 0) {
        goto L1;
    }
    if (ax != 2) {
        goto L1;
    }
    far_0369C();
    B_8CAB = (char)0;
    NAME_EDIT_LAST_PAD = (char)-1;
L1:
    t2 = (*(long (far *)())NAME_EDIT_CHANGE_FN)();
    return;
}
