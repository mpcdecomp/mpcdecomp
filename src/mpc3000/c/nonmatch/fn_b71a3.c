/* differs: 308 at +5, 245 bytes; 311 at +5, 243 bytes; 312 at +5, 242 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_92B9 {
    int f_0;
};
extern unsigned char B_901B[];
extern char TBL_92B7[];
extern char TBL_92B8[];
extern struct g_TBL_92B9 TBL_92B9;
extern int W_904B;
extern int W_92B5;
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1b41(int, int);
extern int far far_b1d48(long, int, int, int, int);
extern int far far_b1f96(int);
extern long far far_e5a99(unsigned char far *);

long far fn_b71a3(int arg_0)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int near *loc_8;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int cx;
    int di;
    int dx;
    int es;
    int p16;
    int p18;
    int p20;
    int p22;
    int p24;
    int p26;
    int si;
    long t1;
    int t2;
    int t3;
    int t4;
    int t5;
    int t6;

    loc_4 = 1;
    di = 0;
    loc_6 = 0;
    loc_2 = arg_0 * 10;
    far_b1ad0(1, 0);
    far_b1b41(32, 200);
    t1 = far_e5a99((unsigned char far *)B_901B);
    p18 = 1;
    far_b1ad0(p18, 0);
    if (W_92B5 == -1) {
        far_b1b05(MK_FP(SEG_DATA, 0x2f22));
        t2 = far_b1f96(40);
        return ((long)UNDEF << 16 | (unsigned)0);
    }
    p16 = 40;
    cx = UNDEF;
    es = UNDEF;
    far_b1f96(p16);
    dx = UNDEF;
    si = loc_2 << 2;
    loc_8 = (int near *)((char near *)&W_92B5 + (loc_2 << 2));
    for (;;) {
        if (*loc_8 != -1 && loc_6 != 10) {
            ax6 = di;
            if (ax6 != 0) {
                if (ax6 != 1) {
                    if (ax6 != 2) {
                        goto L1;
                    }
                    loc_4 = loc_4 + 1;
                    di = di - 2;
                    continue;
                }
                t3 = far_b1ad0(loc_4, 20);
                di = di + 1;
                goto L1;
            }
            t4 = far_b1ad0(loc_4, 0);
            di = di + 1;
L1:
            if (*(int *)((char *)&TBL_92B9 + 0 + si) == -1) {
                p16 = TBL_92B8[si];
                p18 = TBL_92B7[si];
                p20 = W_904B;
                p22 = *loc_8;
                p24 = SEG_DATA;
                p26 = 0x2f31;
                t5 = far_b1d48(((long)p24 << 16 | (unsigned)p26), p22, p20, p18, p16);
                cx = UNDEF;
                es = UNDEF;
                dx = UNDEF;
            } else {
                p16 = TBL_92B8[si];
                p18 = TBL_92B7[si];
                p20 = *(int *)((char *)&TBL_92B9 + 0 + si) - 1;
                p22 = *loc_8;
                p24 = SEG_DATA;
                p26 = 0x2f31;
                t6 = far_b1d48(((long)p24 << 16 | (unsigned)p26), p22, p20, p18, p16);
                cx = UNDEF;
                es = UNDEF;
                dx = UNDEF;
            }
            si = si + 4;
            loc_8 = loc_8 + 2;
            loc_6 = loc_6 + 1;
            continue;
        }
        break;
    }
    return ((long)dx << 16 | (unsigned)loc_6);
}
