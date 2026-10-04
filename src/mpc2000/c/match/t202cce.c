#include "mpc2k.h"

void __far __fastcall __loadds X_02D54(int ax, int dx)
{
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
    G_FLAG_8CA8 = (char)0;
L1:
    return;
}
