/* differs: 308 absent; 311 absent; 312 at +5, 305 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern char B_8287;
extern unsigned char B_8288;
extern char B_8A88;
extern char B_8A9A;
extern char B_8A9C;
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char TBL_82EE[];
extern int TBL_882E;
extern unsigned char TBL_8A93[];
extern int W_8285;
extern int W_8A98;
extern int W_D610;
extern long far far_dfeec(void);
extern long far far_e1982(long, int);
extern long far far_e70e6(void);
extern long far far_e723d(long, int, int);

void far far_e188c(long arg_0, int arg_2)
{
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int bx2;
    int cx;
    int dx;
    int es;
    int es2;
    int p10;
    int p12;
    int p14;
    int p16;
    int si;
    long t1;
    long t2;
    long t3;

    loc_2 = 0;
    si = *(int *)((char *)&arg_0 + 0) + 66;
    while (loc_2 <= 99) {
        *(char far *)MK_FP(arg_2, si) = *(char *)((char *)&loc_2 + 0);
        ax2 = (int)far_e1982(arg_0, loc_2);
        si = si + 1;
        loc_2 = loc_2 + 1;
    }
    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es, bx + 32) = 0;
    *(int far *)MK_FP(es, bx + 30) = 0;
    *(int far *)MK_FP(es, bx + 50) = 1;
    *(char far *)MK_FP(es, bx + 1) = (char)9;
    if (arg_2 == SEG_DATA && *(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_8C41) {
        *(char far *)MK_FP(es, bx + 1) = (char)(*(char far *)MK_FP(es, bx + 1) | -128);
        return;
    }
    p12 = B_8287;
    p14 = SEG_DATA;
    p16 = (int)(unsigned)B_901B;
    dx = (int)(far_e723d(((long)p14 << 16 | (unsigned)p16), p12, 4 << B_8288) >> 16);
    B_8A88 = (char)0;
    W_D610 = 0x1000;
    TBL_882E = 0x1000;
    W_8A98 = W_8285;
    p10 = SEG_DATA;
    __stos2(((long)p10 << 16 | (unsigned)(unsigned int)(unsigned)TBL_8A93), 0, 4);
    *(char far *)MK_FP(p10, (unsigned)&TBL_8A93 + 4) = (char)0;
    __stos2(((long)p10 << 16 | (unsigned)-0x7577), 0, 10);
    cx = 0;
    B_8A9A = (char)1;
    es2 = (int)(arg_0 >> 16);
    ax = (unsigned char)*(char far *)MK_FP(es2, (int)arg_0 + 67);
    B_8A9C = (char)ax;
    loc_2 = 0;
    do {
        bx2 = loc_2;
        if (TBL_82EE[bx2] >= 0) {
            p10 = bx2;
            p12 = arg_2;
            p14 = *(int *)((char *)&arg_0 + 0);
            p16 = 0xe15e;
            t1 = far_e1982(((long)p12 << 16 | (unsigned)p14), p10);
            cx = UNDEF;
            es2 = UNDEF;
            ax = (int)t1;
            dx = (int)(t1 >> 16);
        }
        loc_2 = loc_2 + 1;
    } while (loc_2 < 100);
    t2 = far_e70e6();
    t3 = far_dfeec();
    return;
}
long far far_e1982(long p0, int p1) { return 0; }
