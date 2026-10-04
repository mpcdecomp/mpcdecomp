#include "mpc2k.h"

long __near __pascal track_calc_offset(int arg_0)
{
    return (long)(((char __far *)PGM_CURRENT) + arg_0 * 29 - 0x3d9);
}
