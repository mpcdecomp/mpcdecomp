/* differs: 308 at +5, 275 bytes; 311 at +5, 275 bytes; 312 at +5, 275 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

void far fn_b6dd7(int arg_0, int arg_2, int arg_4)
{
    char loc_1a[26];
    char loc_30[22];
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

    *(int *)((char *)&loc_1a + 24) = 0;
    *(int *)((char *)&loc_1a + 22) = arg_0;
    if (*(int *)((char *)&loc_1a + 24) < arg_4) {
        ds = SEG_DATA;
        do {
            es = arg_2;
            bx = *(int *)((char *)&loc_1a + 22);
            es2 = (int)(*(long far *)MK_FP(es, bx) >> 16);
            cx = ~__repne_scas1(MK_FP(es2, (int)*(long far *)MK_FP(es, bx)), 0, -1);
            cx2 = cx >> 1;
            ax = ds;
            __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a), (char far *)MK_FP(es2, (unsigned int)(unsigned)loc_1a), cx2 * 2);
            __movs1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_1a + cx2 * 2)), (char far *)MK_FP(es2, (unsigned int)(unsigned)(loc_1a + cx2 * 2)), cx & 1);
            di = 4;
            si = 0;
            for (;;) {
                bx2 = (int)(unsigned)(loc_1a + di);
                if (*(char far *)MK_FP(SEG_STACK, bx2) == 0) {
                    break;
                }
                loc_30[si] = *(char far *)MK_FP(SEG_STACK, bx2);
                di = di + 1;
                si = si + 1;
            }
            loc_30[si] = (char)46;
            loc_30[si + 1] = loc_1a[0];
            loc_30[si + 2] = loc_1a[1];
            loc_30[si + 3] = loc_1a[2];
            loc_30[si + 4] = (char)0;
            es3 = arg_2;
            bx3 = *(int *)((char *)&loc_1a + 22);
            ax2 = *(int far *)MK_FP(es3, bx3 + 2);
            si2 = *(int far *)MK_FP(es3, bx3);
            cx3 = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_30), 0, -1);
            cx4 = cx3 >> 1;
            __movs2(((long)ax2 << 16 | (unsigned)si2), MK_FP(SEG_STACK, si2), cx4 * 2);
            __movs1(((long)ax2 << 16 | (unsigned)(si2 + cx4 * 2)), MK_FP(SEG_STACK, si2 + cx4 * 2), cx3 & 1);
            ds = ax;
            *(int *)((char *)&loc_1a + 22) = *(int *)((char *)&loc_1a + 22) + 4;
            *(int *)((char *)&loc_1a + 24) = *(int *)((char *)&loc_1a + 24) + 1;
        } while (*(int *)((char *)&loc_1a + 24) < arg_4);
    }
    return;
}
