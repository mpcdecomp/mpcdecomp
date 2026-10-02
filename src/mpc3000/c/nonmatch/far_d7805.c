/* differs: 308 at +5, 214 bytes; 311 at +5, 213 bytes; 312 at +5, 214 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

long far far_d7805(int arg_0, char far *arg_2, int arg_4, int arg_6, char arg_8)
{
    int loc_2;
    int ax;
    int cx;
    int di;
    int flags;
    int si2;
    int si3;
    int si4;

    loc_2 = 0;
    if (arg_0 < 0) {
        arg_0 = -arg_0;
        loc_2 = 1;
    }
    arg_2[arg_6] = (char)0;
    cx = arg_6;
    di = *(int *)((char *)&arg_2 + 0) + arg_6;
    do {
        di = di - 1;
        cx = cx - 1;
        if (cx < 0) {
            break;
        }
        *(char far *)MK_FP(arg_4, di) = (char)((char)(arg_0 % 10) + 48);
        ax = arg_0 / 10;
        arg_6 = arg_0 % 10;
        arg_0 = ax;
    } while (ax != 0);
    if (arg_8 == 32) {
        if (loc_2 != 0) {
            cx = cx - 1;
            if (cx >= 0) {
                arg_2[cx] = (char)45;
            }
        }
    } else if (loc_2 != 0) {
        si2 = *(int *)((char *)&arg_2 + 0) + cx;
        for (;;) {
            si2 = si2 - 1;
            cx = cx - 1;
            ax = cx;
            if (ax < 1) {
                break;
            }
            *(char far *)MK_FP(arg_4, si2) = arg_8;
        }
        cx = cx - 1;
        if (cx >= 0) {
            arg_2[cx] = (char)45;
        }
    }
    si3 = *(int *)((char *)&arg_2 + 0);
    si4 = si3 + cx;
    flags = si4;
    for (;;) {
        si4 = si4 - 1;
        cx = cx - 1;
        flags = cx;
        if (!CC(">=", flags)) {
            break;
        }
        ax = ((char)(ax >> 8) << 8 | (unsigned char)arg_8);
        *(char far *)MK_FP(arg_4, si4) = (char)ax;
    }
    return ((long)arg_6 << 16 | (unsigned)ax);
}
