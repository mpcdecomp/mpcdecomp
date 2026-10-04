#include "mpc2k.h"

char __far * __far channel_validate(int arg_0)
{
    if (arg_0 < 2) {
        goto L1;
    }
    arg_0 = 0;
L1:
    return (((char __far *)PGM_CURRENT) + arg_0 * 72 + 0x91e);
}
