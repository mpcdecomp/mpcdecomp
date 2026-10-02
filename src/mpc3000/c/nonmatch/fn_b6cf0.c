/* differs: 308 at +5, 276 bytes; 311 at +5, 276 bytes; 312 at +5, 276 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
void far fn_b6cf0(int arg_0, int arg_2, int arg_4)
{
    char loc_30[1];
    char loc_2f;
    char loc_2e;
    char loc_2d[16];
    char loc_1d[1];
    char loc_1c[1];
    char loc_1b[1];
    char loc_1a[22];
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    unsigned int cx;
    int cx2;
    unsigned int cx3;
    int cx4;
    int di;
    int ds;
    int es;
    int es2;
    int es3;
    int si;
    int si2;
    int si3;

    loc_2 = 0;
    loc_4 = arg_0;
    if (loc_2 < arg_4) {
        ds = SEG_DATA;
        do {
            es = arg_2;
            bx = loc_4;
            es2 = (int)(*(long far *)MK_FP(es, bx) >> 16);
            cx = ~__repne_scas1(MK_FP(es2, (int)*(long far *)MK_FP(es, bx)), 0, -1);
            cx2 = cx >> 1;
            ax = ds;
            __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a), (char far *)MK_FP(es2, (unsigned int)(unsigned)loc_1a), cx2 * 2);
            __movs1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_1a + cx2 * 2)), (char far *)MK_FP(es2, (unsigned int)(unsigned)(loc_1a + cx2 * 2)), cx & 1);
            si = 0;
            while (loc_1a[si] != 0) {
                si = si + 1;
                if (si < 21) {
                    continue;
                }
                break;
            }
            loc_30[0] = loc_1d[si];
            loc_2f = loc_1c[si];
            loc_2e = loc_1b[si];
            loc_2d[0] = (char)46;
            si2 = 0;
            di = 4;
            for (;;) {
                bx2 = (int)(unsigned)(loc_1a + si2);
                if (*(char far *)MK_FP(SEG_STACK, bx2) == 46) {
                    break;
                }
                loc_30[di] = *(char far *)MK_FP(SEG_STACK, bx2);
                si2 = si2 + 1;
                di = di + 1;
            }
            loc_30[di] = (char)0;
            es3 = arg_2;
            bx3 = loc_4;
            ax2 = *(int far *)MK_FP(es3, bx3 + 2);
            si3 = *(int far *)MK_FP(es3, bx3);
            cx3 = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_30), 0, -1);
            cx4 = cx3 >> 1;
            __movs2(((long)ax2 << 16 | (unsigned)si3), MK_FP(SEG_STACK, si3), cx4 * 2);
            __movs1(((long)ax2 << 16 | (unsigned)(si3 + cx4 * 2)), MK_FP(SEG_STACK, si3 + cx4 * 2), cx3 & 1);
            ds = ax;
            loc_4 = loc_4 + 4;
            loc_2 = loc_2 + 1;
        } while (loc_2 < arg_4);
    }
    return;
}
