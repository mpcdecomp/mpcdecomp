#include "mpc2k.h"

void __far __fastcall __loadds far_0369C(void)
{
    long t1;

    if (G_SEQ_MODE + 1 >= 16) {
        goto L1;
    }
    G_SEQ_MODE = (char)(G_SEQ_MODE + 1);
L1:
    B_8CAB = (char)0;
    NAME_EDIT_LAST_PAD = (char)-1;
    t1 = (*(long (far *)())NAME_EDIT_CHANGE_FN)();
    return;
}
