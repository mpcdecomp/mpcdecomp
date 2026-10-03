#include "mpc2k.h"

long __far channel_get_ptr(int arg_0)
{
    if (arg_0 < 4) {
        goto L1;
    }
    arg_0 = 0;
L1:
    return (long)(((char __far *)PGM_CURRENT) + (arg_0 * 3 << 2) + 0x9ae);
}
