/* differs: 308 at +5, 386 bytes; 311 at +5, 387 bytes; 312 at +5, 387 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern char B_880B;
extern char B_8A9B;
extern unsigned char B_901B[];
extern char B_96EE;
extern char B_F77B;
extern unsigned char B_F77C;
extern unsigned char B_F77D;
extern unsigned char B_F77E[];
extern char TBL_9FE7[];
extern int TBL_A267[];
extern char TBL_A367[];
extern int TBL_A3E7[];
extern char TBL_A4E7[];
extern unsigned char TBL_F779;
extern char TBL_F77A;
extern int W_902D;
extern int W_902F;
extern int W_9055;
extern long far far_d97ca(int, unsigned char far *, int);
extern int far far_daa8e(char far *);
extern long far far_dcc2e(void far *, unsigned char far *, int);
extern long far far_e723d(unsigned char far *, int, int);
extern int far far_ffb5f(long, int);

void far fn_e4bc1(int arg_0, int arg_2)
{
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int dx;
    int flags;
    int p18;
    long t1;
    int t2;
    long t3;
    int t4;
    int t5;
    long t6;
    long t7;
    long t8;
    long t9;

    while (W_9055 == 0) {
        dx = W_902D;
        loc_2 = W_902F;
        loc_4 = dx;
        t9 = far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
        ax = TBL_F779 & 248;
        flags = ax - 168;
        if (CC("==", flags)) {
            t7 = far_e723d((unsigned char far *)B_901B, B_F77C, B_F77D);
            p18 = (int)(unsigned)B_901B;
            t8 = far_dcc2e(MK_FP(SEG_DATA, p18), (unsigned char far *)&TBL_F779, (int)t9);
            continue;
        }
        if (CC(">", flags)) {
            if (ax != 248) {
                goto L1;
            }
            goto L2;
        }
        if (ax == 136) {
            t5 = far_daa8e((char far *)&TBL_F77A);
            W_9055 = t5;
            continue;
        }
        if (ax != 152) {
L1:
            p18 = (int)(unsigned)B_901B;
            t6 = far_dcc2e(MK_FP(SEG_DATA, p18), (unsigned char far *)&TBL_F779, (int)t9);
            continue;
        }
        if (TBL_F77A != B_8A9B) {
            p18 = (int)(unsigned)B_901B;
            t1 = far_dcc2e(MK_FP(SEG_DATA, p18), (unsigned char far *)&TBL_F779, (int)t9);
            continue;
        }
        ax2 = arg_0 | arg_2;
        if (ax2 == 0) {
            goto L3;
        }
        t2 = far_ffb5f(*(long *)((char *)&arg_0 + 0), B_96EE);
        ax2 = t2;
        if (ax2 == 0) {
            p18 = (int)(unsigned)B_901B;
            t3 = far_dcc2e(MK_FP(SEG_DATA, p18), (unsigned char far *)&TBL_F779, (int)t9);
            continue;
        }
L3:
        ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_F77B);
        TBL_9FE7[(unsigned char)(char)ax3] = (char)(TBL_F779 & 7);
        TBL_A4E7[(unsigned char)(char)ax3] = B_F77C;
        TBL_A3E7[(unsigned char)(char)ax3] = 0;
        TBL_A367[(unsigned char)(char)ax3] = B_F77D;
        t4 = far_daa8e((unsigned char far *)B_F77E);
        TBL_A267[(unsigned char)(char)ax3] = t4;
        B_880B = (char)1;
    }
    return;
L2:
    W_902F = loc_2;
    W_902D = loc_4;
    return;
}
