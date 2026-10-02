/* differs: 308 at +5, 299 bytes; 311 at +5, 299 bytes; 312 at +5, 299 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
struct g_W_903D {
    long f_0;
};
extern char B_956A;
extern unsigned char B_F77C;
extern unsigned char B_F77D;
extern char TBL_8C83[];
extern char TBL_905D[];
extern unsigned char TBL_F779;
extern unsigned char TBL_F77A;
extern int W_8C53;
extern int W_8C55;
extern struct g_W_903D W_903D;
extern int W_903F;
extern int W_904B;
extern int W_946C;
extern long far far_d97ca(int, long, int);
extern long far far_d9b6e(int, long, int);
extern int far far_daabc(int);

void far fn_e0fae(int arg_0, int arg_2)
{
    int loc_a;
    int loc_8;
    long loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int p18;
    int p20;
    int p22;
    int p24;
    int si;
    long t1;
    int t2;
    long t3;
    long t4;
    long t5;

    dx = W_8C53;
    loc_8 = W_8C55;
    loc_a = dx;
    loc_4 = SEG_DATA;
    *(int *)((char *)&loc_6 + 0) = (int)(unsigned)&TBL_F77A;
    si = W_946C;
    B_956A = (char)(B_956A + 1);
    for (;;) {
L1:
        ax = arg_2;
        arg_2 = arg_2 - 1;
        if (ax == 0) {
            break;
        }
        di = arg_0;
        W_8C55 = loc_8;
        W_8C53 = loc_a;
        for (;;) {
            if (di < 0) {
                goto L1;
            }
            p18 = 0x640;
            p20 = SEG_DATA;
            p22 = (int)(unsigned)&TBL_F779;
            p24 = 3;
            t1 = far_d97ca(p24, ((long)p20 << 16 | (unsigned)p22), p18);
            bx = UNDEF;
            cx = UNDEF;
            es = UNDEF;
            loc_2 = (int)t1;
            ax2 = TBL_F779 & 248;
            if (ax2 == 136) {
                goto L2;
            }
            if (ax2 == 168) {
                t2 = far_daabc(si);
                cx = UNDEF;
                es = (int)(loc_6 >> 16);
                *(int far *)MK_FP(es, (int)loc_6) = t2;
                W_904B = W_904B + 1;
                t3 = (long)(int)B_F77C * 0x180L;
                p18 = B_F77D;
                bx = p18;
                t4 = (long)(int)(int)t3;
                ax3 = (int)(t4 / (long)(int)bx);
                *(int *)((char *)&W_903D + 0) = *(int *)((char *)&W_903D + 0) + ax3;
                W_903F = (int)(W_903D.f_0 + (long)(int)ax3 >> 16);
                goto L3;
            }
            if (ax2 == 248) {
L3:
                ax4 = di;
                di = di - 1;
                if (ax4 == 0) {
                    continue;
                }
                si = si + 1;
                goto L2;
            }
            TBL_F77A = TBL_905D[TBL_8C83[TBL_F77A]];
L2:
            p18 = loc_2;
            p20 = SEG_DATA;
            p22 = (int)(unsigned)&TBL_F779;
            p24 = 1;
            t5 = far_d9b6e(p24, ((long)p20 << 16 | (unsigned)p22), p18);
            bx = UNDEF;
            cx = UNDEF;
            es = UNDEF;
        }
    }
    B_956A = (char)(B_956A - 1);
    return;
}
