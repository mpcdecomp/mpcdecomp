/* differs: 308 at +5, 278 bytes; 311 at +5, 278 bytes; 312 at +5, 279 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
#define UNDEF 0
struct g_W_8C35 {
    long f_0;
    char pad_4[332];
    char f_150;
};
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char B_9469;
extern char TBL_8CE7[];
extern char TBL_8D4B[];
extern char TBL_8DAF[];
extern char TBL_905D[];
extern char TBL_90C1[];
extern char TBL_9125[];
extern char TBL_9189[];
extern struct g_W_8C35 W_8C35;
extern int W_8C37;
extern long far far_e0031(unsigned char far *);
extern long far far_e259f(char);
extern long far far_e49b0(int);
extern long far far_e51be(unsigned char far *, int, int);

void far fn_e11b1(void)
{
    char loc_6c[100];
    char loc_8[2];
    long loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int bx;
    int bx2;
    int di;
    unsigned int dx;
    unsigned int dx2;
    int es;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;

    if ((int)far_e259f(B_9469) == 0) {
        goto L1;
    }
    t1 = far_e49b0(B_9469);
    loc_2 = (int)t1;
    if ((int)t1 != 0) {
        return;
    }
L1:
    t2 = far_e0031((unsigned char far *)B_8C41);
    t3 = far_e0031((unsigned char far *)B_901B);
    __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6c), 0, 100);
    loc_8[0] = (char)0;
    t4 = far_e259f(0);
    dx = *(int *)((char *)&W_8C35 + 0);
    dx2 = dx + 0x151;
    loc_4 = W_8C37 + (dx2 < dx);
    *(int *)((char *)&loc_6 + 0) = dx2;
    si = *(char far *)((char far *)W_8C35.f_0 + 336);
    for (;;) {
        ax2 = si;
        si = si - 1;
        if (ax2 == 0) {
            break;
        }
        bx2 = (int)loc_6;
        es = (int)(loc_6 >> 16);
        ax5 = (unsigned char)*(char far *)MK_FP(es, bx2);
        if (ax5 != 255) {
            dx2 = (unsigned int)(unsigned)loc_6c;
            *(char far *)MK_FP(SEG_STACK, (unsigned char)*(char far *)MK_FP(es, bx2 + 1) + dx2) = (char)ax5;
        }
        *(int *)((char *)&loc_6 + 0) = *(int *)((char *)&loc_6 + 0) + 24;
    }
    t5 = far_e51be((unsigned char far *)B_901B, B_9469, 0);
    bx = UNDEF;
    ax3 = (int)far_e51be((unsigned char far *)B_8C41, 0, 1);
    di = 1;
    while (di != 100) {
        ax4 = loc_6c[di];
        if (ax4 != 0) {
            si = TBL_905D[di];
            if ((TBL_90C1[si] & 2) == 0) {
                bx = ax4;
                TBL_90C1[si] = TBL_8CE7[bx];
                TBL_9125[si] = TBL_8D4B[bx];
                TBL_9189[si] = TBL_8DAF[bx];
            }
        }
        di = di + 1;
    }
    t6 = far_e0031((unsigned char far *)B_8C41);
    t7 = far_e0031((unsigned char far *)B_901B);
    return;
}
