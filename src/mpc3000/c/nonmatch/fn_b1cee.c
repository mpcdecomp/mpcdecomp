/* differs: 308 at +5, 123 bytes; 311 at +5, 123 bytes; 312 at +5, 123 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char TBL_79A5[];

long far fn_b1cee(long arg_0)
{
    char far *loc_4;
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int bx2;
    int cx;
    int dx;
    int dx2;
    int es;
    int es2;

    cx = 0;
    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    ax = *(int far *)MK_FP(es, bx + 2);
    dx = *(int far *)MK_FP(es, bx);
    loc_2 = ax;
    *(int *)((char *)&loc_4 + 0) = dx;
    for (;;) {
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*loc_4);
        if ((TBL_79A5[(char)ax2] & 2) == 0) {
            break;
        }
        ax = cx * 10;
        cx = (char)ax2 + ax - 48;
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
    }
    bx2 = (int)arg_0;
    es2 = (int)(arg_0 >> 16);
    dx2 = *(int *)((char *)&loc_4 + 0);
    *(int far *)MK_FP(es2, bx2 + 2) = loc_2;
    *(int far *)MK_FP(es2, bx2) = dx2;
    return ((long)dx2 << 16 | (unsigned)cx);
}
