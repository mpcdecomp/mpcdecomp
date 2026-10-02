/* differs: 308 at +5, 621 bytes; 311 at +5, 621 bytes; 312 at +5, 621 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_F77A {
    int f_0;
};
extern char B_901B;
extern char B_956A;
extern unsigned char B_F77C;
extern int B_F77E;
extern unsigned char TBL_F779;
extern struct g_TBL_F77A TBL_F77A;
extern unsigned char TBL_e7c81[];
extern unsigned char TBL_e7c89[];
extern int W_9051;
extern int W_9053;
extern int W_947E;
extern long far far_d97ca(int, unsigned char far *, int);
extern long far far_d9b6e(int, unsigned char far *, int);
extern int far far_daa82(int);
extern int far far_daabc(int);
extern long far far_dad54(int);
extern long far far_e3d12(char far *, long);
extern long far far_e4a1d(int);
extern long far far_e51be(char far *, int, int);
extern long far far_e5612(int, int);
extern long far far_e7644(void);
extern long far far_fa0c8(int, int, int);
extern int far far_ffb5f(long, int);

long far far_e7a8c(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8, int arg_10, int arg_12)
{
    int loc_2;
    int loc_4;
    int loc_6;
    long loc_8;
    int loc_a;
    int loc_c;
    int loc_e;
    int far *loc_10;
    int ax;
    int ax2;
    unsigned int bx;
    unsigned int bx2;
    int di;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int flags;
    int si;
    long t1;
    long t10;
    int t11;
    long t12;
    long t13;
    long t14;
    long t2;
    long t3;
    int t4;
    int t5;
    long t6;
    long t7;
    int t8;
    long t9;

    si = arg_4;
    if (si == 0) {
        return;
    }
    if (B_901B < 0) {
        return;
    }
    dx2 = W_9051;
    loc_2 = W_9053;
    loc_4 = dx2;
    t1 = far_e7644();
    loc_6 = (int)(t1 >> 16);
    *(int *)((char *)&loc_8 + 0) = (int)t1;
    t2 = far_e51be((char far *)&B_901B, *(char *)((char *)&arg_8 + 0), 0);
    loc_a = (int)far_e4a1d(*(char *)((char *)&arg_6 + 0));
    t3 = far_e3d12((char far *)&B_901B, *(long *)((char *)&W_947E + 0));
    B_956A = (char)(B_956A + 1);
    di = 0;
    for (;;) {
        if (di == 0) {
            loc_c = (int)far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
            ax2 = TBL_F779 & 248;
            if (ax2 != 136) {
                if (ax2 != 152) {
                    if (ax2 == 248) {
                        di = 1;
                    }
                } else if (*(char *)((char *)&TBL_F77A + 0) == *(char *)((char *)&arg_6 + 0)) {
                    t4 = far_ffb5f(*(long *)((char *)&arg_10 + 0), loc_a);
                    if (t4 != 0) {
                        if (*(char *)((char *)&arg_0 + 0) != 0) {
                            t5 = far_daa82(B_F77E);
                            dx3 = t5;
                            loc_e = SEG_DATA;
                            *(int *)((char *)&loc_10 + 0) = (int)(unsigned)&B_F77E;
                            bx = arg_2;
                            if (bx <= 3) {
                                switch ((unsigned int)(unsigned)(TBL_e7c89 + (bx << 1))) {
                                case 0:
                                    dx3 = dx3 + si;
                                    break;
                                case 1:
                                    dx3 = dx3 - si;
                                    break;
                                case 2:
                                    t6 = far_fa0c8(si, dx3, -(dx3 < 0));
                                    t7 = t6 / 100L;
                                    dx3 = (int)t7;
                                    break;
                                case 3:
                                    dx3 = si;
                                    break;
                                }
                            }
                            if (dx3 > 0x270f) {
                                dx3 = 0x270f;
                            }
                            if (dx3 <= 0) {
                                dx3 = 1;
                            }
                            t8 = far_daabc(dx3);
                            *loc_10 = t8;
                        } else {
                            dx4 = B_F77C;
                            bx2 = arg_2;
                            if (bx2 <= 3) {
                                switch ((unsigned int)(unsigned)(TBL_e7c81 + (bx2 << 1))) {
                                case 0:
                                    dx4 = dx4 + si;
                                    break;
                                case 1:
                                    dx4 = dx4 - si;
                                    break;
                                case 2:
                                    t9 = (long)(int)dx4 * (long)(int)si;
                                    t10 = (long)(int)(int)t9;
                                    dx4 = (int)(t10 / 100L);
                                    break;
                                case 3:
                                    dx4 = si;
                                    break;
                                }
                            }
                            if (dx4 > 127) {
                                dx4 = 127;
                            }
                            if (dx4 <= 0) {
                                dx4 = 1;
                            }
                            B_F77C = (char)dx4;
                        }
                    }
                }
            } else {
                t11 = far_daa82(TBL_F77A.f_0);
                *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) - t11;
                loc_6 = (int)(loc_8 - (long)(int)t11 >> 16);
                flags = loc_6;
                if (CC("<=", flags)) {
                    if (CC("!=", flags) || *(int *)((char *)&loc_8 + 0) == 0) {
                        di = 1;
                    }
                }
            }
            t12 = far_dad54(1);
            t13 = far_d9b6e(1, (unsigned char far *)&TBL_F779, loc_c);
            continue;
        }
        break;
    }
    W_9053 = 0;
    W_9051 = 0;
    t14 = far_e5612(loc_4, loc_2);
    B_956A = (char)(B_956A - 1);
    return t14;
}
