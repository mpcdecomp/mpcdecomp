/* differs: 308 at +5, 452 bytes; 311 at +5, 452 bytes; 312 at +5, 452 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_fa274(int);

long far far_b6aab(char far *arg_0, char far *arg_4, int arg_6)
{
    char loc_1;
    char loc_2;
    int loc_4;
    int loc_6;
    int loc_8;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int bx;
    int cx;
    int di;
    int di2;
    int di3;
    int dx;
    int dx2;
    int es;
    int es2;
    int es3;
    int p16;
    int t1;
    long t2;
    long t3;

    di = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    t1 = __repne_scas1(MK_FP(es, di), 0, -1);
    cx = ~t1;
    di2 = di + (-1 - t1) - cx;
    di3 = di2 + (cx - __repne_scas1(MK_FP(es, di2), 46, cx));
    if (!CC("==", UNDEF)) {
        di3 = 1;
        es = 0;
    }
    loc_4 = es;
    loc_6 = di3 - 1;
    if ((di3 - 1 | es) != 0) {
        dx = loc_6 - *(int *)((char *)&arg_0 + 0);
    } else {
        dx = ~__repne_scas1(arg_0, 0, -1) - 1;
    }
    if (dx > 8) {
        ax = 16;
    } else {
        ax = 8;
    }
    loc_8 = ax;
    loc_2 = (char)0;
    loc_1 = (char)0;
    for (;;) {
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)loc_1);
        if ((char)ax2 >= loc_8) {
            break;
        }
        ax = loc_2;
        es3 = FP_SEG(arg_0);
        bx = FP_OFF(arg_0) + ax;
        if (*(char far *)MK_FP(es3, bx) != 0 && *(char far *)MK_FP(es3, bx) != 46) {
            ax5 = ((char)(ax >> 8) << 8 | (unsigned char)loc_2);
            loc_2 = (char)(loc_2 + 1);
            t2 = far_fa274(arg_0[(char)ax5]);
            dx = (int)(t2 >> 16);
            p16 = (int)t2;
            ax = p16;
            arg_4[loc_1] = (char)ax;
        } else {
            arg_4[(char)ax2] = (char)32;
        }
        loc_1 = (char)(loc_1 + 1);
    }
    if (arg_0[loc_2] == 46) {
        loc_2 = (char)(loc_2 + 1);
    }
    loc_1 = *(char *)((char *)&loc_8 + 0);
    for (;;) {
        dx2 = loc_8 + 3;
        if (loc_1 >= dx2) {
            break;
        }
        ax3 = loc_2;
        es2 = FP_SEG(arg_0);
        if (*(char far *)MK_FP(es2, FP_OFF(arg_0) + ax3) != 0) {
            ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)loc_2);
            loc_2 = (char)(loc_2 + 1);
            t3 = far_fa274(*(char far *)MK_FP(es2, *(int *)((char *)&arg_0 + 0) + (char)ax4));
            p16 = (int)t3;
            arg_4[loc_1] = (char)p16;
        } else {
            arg_4[loc_1] = (char)32;
        }
        loc_1 = (char)(loc_1 + 1);
    }
    *(char far *)MK_FP(arg_6, loc_8 + *(int *)((char *)&arg_4 + 0) + 3) = (char)0;
    return ((long)dx2 << 16 | (unsigned)loc_1);
}
