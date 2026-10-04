#include "mpc2k.h"

int __near __pascal lcd_area_setup(int arg_4, int arg_2, int arg_0)
{
    if (((int (__far *)(long, int))int2F_call_fn6)(((long)arg_4 << 16 | (unsigned)arg_2), arg_0) != arg_0) {
        goto L1;
    }
    if (*(char far *)MK_FP(arg_4, arg_2) != 3) {
        goto L1;
    }
    return 1;
L1:
    G_ERRNO = ERR_FILE_DAMAGED;
    return 0;
}
