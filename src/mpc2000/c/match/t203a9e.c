#include "mpc2k.h"

int __far __fastcall X_03B24(int ax)
{
    int di;
    int si;

    di = ax;
    if (di == -0x8000) {
        return 0;
    }
    si = 0;
    if ((di & 0x4000) == 0) {
        while (si < 8) {
            si = si + 1;
            di = di * 2;
            if ((di & 0x4000) == 0) {
                continue;
            }
            break;
        }
    }
    return TBL_0DB0[(unsigned char)(char)(di >> 8)] - si * 6;
}
