#include "mpc2k.h"

void __far __fastcall __loadds X_0B090(void)
{
    int ax;
    int ax2;
    int t1;

    W_8F4C = W_8F4C + 1;
    ((int (__far __pascal *)(unsigned char __far *))disp_list_run)((unsigned char far *)((unsigned char *)DL_LOADING));
    if ((int)(*(long (far *)())W_8F48)() != 0) {
        goto L1;
    }
    t1 = ((int (__far __pascal *)(unsigned char __far *))disp_list_run)((unsigned char far *)DL_CHANGE_DISK_MSG);
    ax2 = ((int (__far __pascal *)(int))int43_wrapper)(3);
L1:
    return;
}
