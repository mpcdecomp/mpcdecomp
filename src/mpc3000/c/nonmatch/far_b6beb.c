/* differs: 308 at +5, 308 bytes; 311 at +5, 308 bytes; 312 at +5, 307 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

long far far_b6beb(long arg_0, int arg_2, char far *arg_4, int arg_6)
{
    char loc_16[22];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int bx;
    int cx;
    int cx2;
    int di;
    int di2;
    int di3;
    int dx;
    int dx2;
    int es;
    int es2;
    int si;
    int si2;
    int si3;

    ax = 0;
    __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16), ax, 20);
    loc_16[20] = (char)ax;
    si = 0;
    di = *(int *)((char *)&arg_0 + 0);
    do {
        es = arg_2;
        if ((unsigned char)*(char far *)MK_FP(es, di) >= 32 && (unsigned char)*(char far *)MK_FP(es, di) <= 127) {
            ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(arg_2, di));
            loc_16[si] = (char)ax;
        } else {
            loc_16[si] = (char)42;
        }
        di = di + 1;
        si = si + 1;
    } while (si < 11);
    bx = (int)arg_0 + si;
    if (*(char far *)MK_FP((int)(arg_0 >> 16), bx) != 0) {
        di2 = bx;
        while (si < 19) {
            es2 = arg_2;
            if ((unsigned char)*(char far *)MK_FP(es2, di2) >= 32 && (unsigned char)*(char far *)MK_FP(es2, di2) <= 127) {
                ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(arg_2, di2));
                loc_16[si] = (char)ax;
            } else {
                loc_16[si] = (char)42;
            }
            di2 = di2 + 1;
            si = si + 1;
        }
    }
    if (loc_16[11] != 0) {
        ax2 = 16;
    } else {
        ax2 = 8;
    }
    cx = ax2;
    dx = 0;
    si2 = cx;
    for (;;) {
        ax3 = si2;
        si2 = si2 - 1;
        if (ax3 == 0) {
            break;
        }
        if (loc_16[si2] != 32) {
            goto L1;
        }
    }
    goto L2;
L1:
    dx = si2 + 1;
    do {
        arg_4[si2] = loc_16[si2];
        ax4 = si2;
        si2 = si2 - 1;
    } while (ax4 != 0);
L2:
    arg_4[dx] = (char)46;
    dx2 = dx + 1;
    si3 = cx;
    di3 = *(int *)((char *)&arg_4 + 0) + dx2;
    ax5 = cx + 3;
    cx2 = ax5;
    while (cx2 > si3) {
        ax5 = ((char)(ax5 >> 8) << 8 | (unsigned char)loc_16[si3]);
        *(char far *)MK_FP(arg_6, di3) = (char)ax5;
        di3 = di3 + 1;
        dx2 = dx2 + 1;
        si3 = si3 + 1;
    }
    arg_4[dx2] = (char)0;
    return ((long)dx2 << 16 | (unsigned)ax5);
}
