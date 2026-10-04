#include "mpc2k.h"

void __far __fastcall __loadds X_0362C(int ax, int dx)
{
    long t1;

    if (dx == 0) {
        goto L1;
    }
    if (ax != 2) {
        goto L1;
    }
    if (G_SEQ_MODE <= 0) {
        goto L2;
    }
    G_SEQ_MODE = (char)(G_SEQ_MODE - 1);
L2:
    B_8CAB = (char)0;
    NAME_EDIT_LAST_PAD = (char)-1;
L1:
    t1 = (*(long (far *)())NAME_EDIT_CHANGE_FN)();
    return;
}
