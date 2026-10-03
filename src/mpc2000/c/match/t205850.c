#include "mpc2k.h"

int __far far_059BC(void)
{
    char far *__near *bx;
    int cx;

    cx = 0;
    bx = (char far *__near *)PGM_TABLE;
L1:
    if ((unsigned int)*(int far *)(*bx) <= 2) {
        goto L2;
    }
    bx = bx + 1;
    cx = cx + 1;
    if (cx < 24) {
        goto L1;
    }
    goto L3;
L2:
    return cx;
L3:
    return -1;
}
