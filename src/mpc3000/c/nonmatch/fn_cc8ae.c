/* differs: 308 at +5, 115 bytes; 311 at +5, 117 bytes; 312 at +5, 117 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_cb566(int, int, long, long, int);

void far fn_cc8ae(int arg_0)
{
    int loc_2;
    int loc_4;
    long loc_6;
    int loc_8;
    int ax;
    int cx;
    int di;
    int dx;
    int es;
    int si;
    long t1;
    int t2;

    loc_4 = 0xa853 /* SEG_A28F */;
    *(int *)((char *)&loc_6 + 0) = 0;
    loc_2 = 0;
    if (loc_2 < arg_0) {
        do {
            ax = loc_2;
            t1 = (long)(int)ax << 20;
            loc_8 = (int)(t1 >> 16) + 1;
            di = (int)loc_6;
            es = (int)(loc_6 >> 16);
            __stos2(MK_FP(es, di), 0, 0x1000);
            *(char far *)MK_FP(es, di + 0x1000) = (char)0;
            t2 = far_cb566(*(int *)((char *)&loc_6 + 0), loc_4, ((long)((int)(t1 >> 16) + 1) << 16 | (unsigned)(int)t1), 0x1001L, 1);
            cx = UNDEF;
            dx = 0;
            si = *(int *)((char *)&loc_6 + 0);
            while (dx <= 0x1001) {
                if (*(int far *)MK_FP(loc_4, si) != dx) {
                    goto L1;
                }
                si = si + 2;
                dx = dx + 1;
            }
            loc_2 = loc_2 + 1;
        } while (loc_2 < arg_0);
L2:
        return;
    }
    goto L2;
L1:
    return;
}
