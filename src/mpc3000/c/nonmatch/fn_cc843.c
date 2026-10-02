/* differs: 308 at +18, 71 bytes; 311 at +B, 73 bytes; 312 at +B, 73 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_cb566(int, int, long, long, int);

void far fn_cc843(int arg_0)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int ax;
    int cx;
    int di;
    int dx;
    int si;
    long t1;

    loc_2 = 0xa853 /* SEG_A28F */;
    loc_4 = 0;
    di = 0;
    if (di < arg_0) {
        do {
            t1 = (long)(int)di << 20;
            loc_6 = (int)(t1 >> 16) + 1;
            dx = 0;
            si = loc_4;
            while (dx <= 0x1001) {
                *(int far *)MK_FP(loc_2, si) = dx;
                si = si + 2;
                dx = dx + 1;
            }
            cx = UNDEF;
            ax = far_cb566(loc_4, loc_2, ((long)loc_6 << 16 | (unsigned)(int)t1), 0x1001L, 0);
            di = di + 1;
        } while (di < arg_0);
    }
    return;
}
