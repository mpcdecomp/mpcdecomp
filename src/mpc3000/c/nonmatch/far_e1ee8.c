/* differs: 308 absent; 311 at +5, 365 bytes; 312 at +5, 365 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct g_TBL_F77A {
    int f_0;
};
extern char B_901B;
extern char B_956A;
extern unsigned char B_F77B;
extern char B_F77D;
extern unsigned char TBL_F779;
extern struct g_TBL_F77A TBL_F77A;
extern int W_9051;
extern int W_9053;
extern int W_947E;
extern long far far_d97ca(int, unsigned char far *, int);
extern long far far_d9b6e(int, unsigned char far *, int);
extern int far far_daa82(int);
extern long far far_dad54(int);
extern long far far_e3d12(char far *, long);
extern long far far_e51be(char far *, int, int);
extern long far far_e5612(int, int);
extern long far far_e7644(void);

long far far_e1ee8(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8, int arg_10)
{
    long loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int dx;
    int dx2;
    int flags;
    int si;
    long t1;
    long t2;
    long t3;
    int t4;
    long t5;
    long t6;
    long t7;
    long t8;

    if (B_901B >= 0) {
        dx = W_9051;
        loc_2 = W_9053;
        loc_4 = dx;
        t1 = far_e7644();
        loc_6 = (int)(t1 >> 16);
        *(int *)((char *)&loc_8 + 0) = (int)t1;
        t2 = far_e51be((char far *)&B_901B, arg_0, 0);
        t3 = far_e3d12((char far *)&B_901B, *(long *)((char *)&W_947E + 0));
        B_956A = (char)(B_956A + 1);
        si = 0;
        while (si == 0) {
            t5 = far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
            ax = TBL_F779 & 248;
            if (ax == 136) {
                t4 = far_daa82(TBL_F77A.f_0);
                *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) - t4;
                loc_6 = (int)(loc_8 - (long)(int)t4 >> 16);
                flags = loc_6;
                if (!CC(">", flags) && (CC("!=", flags) || *(int *)((char *)&loc_8 + 0) == 0)) {
                    si = 1;
                }
            } else if (ax == 152) {
                if ((unsigned char)*(char *)((char *)&TBL_F77A + 0) == arg_2 && B_F77B >= 35 && (B_F77B <= 98 && *(char far *)MK_FP(arg_10, B_F77B + arg_8 - 35) != 0)) {
                    TBL_F779 = (unsigned char)((TBL_F779 & -4) + (*(char *)((char *)&arg_4 + 0) & 3));
                    B_F77D = *(char *)((char *)&arg_6 + 0);
                }
            } else if (ax == 248) {
                si = 1;
            }
            t6 = far_dad54(1);
            t7 = far_d9b6e(1, (unsigned char far *)&TBL_F779, (int)t5);
        }
        W_9053 = 0;
        W_9051 = 0;
        t8 = far_e5612(loc_4, loc_2);
        ax2 = (int)t8;
        dx2 = (int)(t8 >> 16);
        B_956A = (char)(B_956A - 1);
    }
    return ((long)dx2 << 16 | (unsigned)ax2);
}
