#include "mpc2k.h"

void __near fn_03902(void)
{
    int cx;
    int cx2;
    int t1;
    int t2;
    int t3;
    int t4;

    if ((B_4FE2 & -128) == 0) {
        goto L1;
    }
    if ((B_4FE2 & 1) == 0) {
        goto L1;
    }
    cx = (int)(unsigned)P_158A;
    goto L2;
L1:
    cx = (int)(unsigned)STR_SOLO;
L2:
    string_copy_scan(2, 1, MK_FP(SEG_DATA, cx));
    if ((B_4FE2 & -128) == 0) {
        goto L3;
    }
    if ((B_4FE2 & 2) == 0) {
        goto L3;
    }
    cx2 = (int)(unsigned)P_1590;
    goto L4;
L3:
    cx2 = (int)(unsigned)STR_BYPASS;
L4:
    string_copy_scan(3, 1, MK_FP(SEG_DATA, cx2));
    string_copy_scan(4, 2, (unsigned char far *)STR_SK_CLOSE_MIXER);
    string_copy_scan(5, 1, (unsigned char far *)STR_SK_MIXER);
    return;
}
