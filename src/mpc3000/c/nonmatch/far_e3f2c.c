/* differs: 308 at +3, 456 bytes; 311 at +3, 457 bytes; 312 at +3, 455 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define UNDEF 0
struct s1 {
    char f_0;
    char pad_1[47];
    int f_30;
};
extern char B_8800;
extern char B_8801;
extern unsigned char B_8803;
extern unsigned char B_8804;
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_955B;
extern char B_955C;
extern char TBL_A5BB[];
extern int W_87FE;
extern int W_902D;
extern int W_902F;
extern long far far_dad20(int, int);
extern long far far_dccc4(int);
extern void far far_e2da2(struct s1 far *, int);
extern long far far_e56a0(char, int, long, int, int);
extern long far far_e570d(int, int);
extern void far far_e575a(int);
extern void far far_e5778(int);
extern long far far_e5a99(int, int);
extern long far far_e5d7c(void);

long far far_e3f2c(struct s1 far *arg_0, int arg_2, int arg_4)
{
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int di;
    int dx;
    int dx2;
    int es;
    int es2;
    int es3;
    long t1;
    long t10;
    long t11;
    long t2;
    int t3;
    long t4;
    int t5;
    long t6;
    int t7;
    int t8;
    long t9;

    if (arg_4 < 1) {
        arg_4 = 1;
    }
    di = arg_4;
    if (B_8800 != 0) {
        if (arg_2 != SEG_DATA) {
            goto L1;
        }
        if (*(int *)((char *)&arg_0 + 0) != (unsigned int)(unsigned)B_901B) {
            goto L1;
        }
        t6 = far_e5d7c();
        if (arg_4 > W_87FE) {
            arg_4 = W_87FE + 1;
            di = 0;
        }
        far_e5778(di);
        B_8801 = (char)UNDEF;
        far_e575a(di);
        B_8803 = (char)UNDEF;
        ax = B_8804 * 0x1f4 + (B_8803 << 1);
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)TBL_A5BB[ax]);
        if (B_8A9F != (unsigned char)(char)ax2) {
            t10 = far_dccc4((unsigned char)(char)ax2);
            B_955B = (char)(B_955B | 64);
            B_955C = (char)(B_955C | -128);
        } else {
            t9 = far_dccc4((unsigned char)(char)ax2);
        }
        t11 = far_e570d(0, di);
        dx2 = (int)(t11 >> 16);
        W_902F = dx2;
        W_902D = (int)t11;
        goto L2;
    }
L1:
    if (arg_0->f_0 < 0) {
        return ((long)dx << 16 | (unsigned)1);
    }
    if (arg_0->f_30 == 0) {
        return ((long)dx << 16 | (unsigned)1);
    }
    if (arg_4 != 1) {
        t4 = far_e5a99(*(int *)((char *)&arg_0 + 0), arg_2);
        bx3 = FP_OFF(arg_0);
        es3 = FP_SEG(arg_0);
        if (*(int far *)MK_FP(es3, bx3 + 48) < arg_4) {
            arg_4 = *(int far *)MK_FP(es3, bx3 + 48) + 1;
            di = 0;
        }
        far_e2da2(arg_0, di);
        dx2 = UNDEF;
    } else {
        bx = FP_OFF(arg_0);
        es = FP_SEG(arg_0);
        if (*(char far *)MK_FP(es, bx) == 0) {
            t1 = far_dad20(*(int *)((char *)&arg_0 + 0), arg_2);
            dx2 = (int)(t1 >> 16);
            if ((int)t1 == 0) {
                bx2 = FP_OFF(arg_0);
                es2 = FP_SEG(arg_0);
                t2 = far_e56a0(*(char far *)MK_FP(es2, bx2 + 1), 1, *(long far *)MK_FP(es2, bx2 + 14), 0, 0);
                far_e2da2(arg_0, di);
                dx2 = UNDEF;
            }
        } else {
            dx2 = *(int far *)MK_FP(es, bx + 14);
            *(int far *)MK_FP(es, bx + 20) = *(int far *)MK_FP(es, bx + 16);
            *(int far *)MK_FP(es, bx + 18) = dx2;
        }
    }
L2:
    return ((long)dx2 << 16 | (unsigned)arg_4);
}
