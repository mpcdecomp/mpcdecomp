/* differs: 308 at +5, 212 bytes; 311 at +5, 212 bytes; 312 at +5, 212 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

void far fn_c3fb9(int arg_0, char far *arg_2)
{
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int cx;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;

    cx = arg_0 / 0x3c4;
    bx = FP_OFF(arg_2);
    es = FP_SEG(arg_2);
    if (*(char far *)MK_FP(es, bx + 2) < cx) {
        *(char far *)MK_FP(es, bx + 2) = (char)cx;
    }
    bx2 = FP_OFF(arg_2);
    es2 = FP_SEG(arg_2);
    if (*(char far *)MK_FP(es2, bx2 + 2) > 33) {
        *(char far *)MK_FP(es2, bx2 + 2) = (char)33;
    }
    if (cx > 32) {
        cx = 32;
    }
    bx3 = FP_OFF(arg_2);
    es3 = FP_SEG(arg_2);
    ax = *(char far *)MK_FP(es3, bx3 + 1);
    if (ax > cx) {
        ax = *(int far *)MK_FP(es3, bx3 + 3);
        *(int far *)MK_FP(es3, bx3 + 3) = *(int far *)MK_FP(es3, bx3 + 3) + 1;
        if (ax >= 40) {
L1:
            bx4 = FP_OFF(arg_2);
            es4 = FP_SEG(arg_2);
            *(char far *)MK_FP(es4, bx4 + 1) = (char)cx;
            *(int far *)MK_FP(es4, bx4 + 3) = 0;
        }
    } else {
        goto L1;
    }
    bx5 = FP_OFF(arg_2);
    es5 = FP_SEG(arg_2);
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es5, bx5 + 1));
    loc_2 = (char)ax2;
    bx6 = loc_2 - (char)ax2 * *(int far *)MK_FP(es5, bx5 + 3) / 40;
    if (cx < bx6) {
        cx = bx6;
    }
    *arg_2 = (char)cx;
    return;
}
