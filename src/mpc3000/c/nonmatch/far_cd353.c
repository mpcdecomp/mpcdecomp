/* differs: 308 at +5, 573 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
struct s1 {
    long f_0;
};
struct s2 {
    int f_0;
    int f_2;
};
extern char TBL_D65B[];
extern char TBL_D65C[];
extern unsigned char TBL_D65D[];
extern unsigned char TBL_D661[];
extern void far L_d2774(int, int);
extern void far far_cd0a9(void);
extern long far far_cd4d6(void);
extern long far fn_cd9e4(int, int, int, int, int);
void far far_cd0a9(void) { }

void far far_cd353(int arg_0, int arg_2)
{
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    unsigned int ax2;
    unsigned int ax3;
    unsigned int ax4;
    int bx;
    int bx2;
    struct s1 near *bx3;
    struct s2 near *bx4;
    int cx;
    struct s2 near *di;
    int dx;
    int dx2;
    unsigned int dx3;
    unsigned int dx4;
    int dx5;
    unsigned int dx6;
    unsigned int dx7;
    int es;
    int p14;
    int p16;
    int p18;
    int p20;
    int p22;
    int p24;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    int t7;
    int t8;

    if ((unsigned int)arg_0 >= 128) {
        return;
    }
    t1 = (long)(int)arg_0 * 36L;
    loc_6 = (int)t1;
    dx = 0xa853 /* SEG_A28F */;
    if (*(char far *)MK_FP(dx, (int)t1 + 0x4800) == 0) {
        return;
    }
    bx = loc_6;
    es = 0xa853 /* SEG_A28F */;
    if (*(char far *)MK_FP(es, bx + 0x4813) == 0 && arg_2 > 0) {
        arg_2 = 0;
    }
    loc_2 = 0;
    si = 0;
    di = (struct s2 near *)TBL_D661;
    loc_4 = (int)(unsigned)TBL_D65D;
    do {
        if (TBL_D65C[si] == arg_0) {
            ax = arg_2;
            if (ax == 0) {
                TBL_D65B[si] = (char)-1;
                TBL_D65C[si] = (char)-1;
                dx6 = di->f_0;
                bx4 = (struct s2 near *)loc_4;
                dx7 = dx6 + bx4->f_0;
                p16 = di->f_2 + bx4->f_2 + (dx7 < dx6);
                p18 = dx7;
                p20 = bx4->f_2;
                p22 = bx4->f_0;
                p24 = 0xd5c0;
                t4 = fn_cd9e4(p22, p20, p18, p16, loc_2);
                t5 = (long)(int)arg_0 * 36L;
                *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t5 + 0x4800) = (char)0;
                p14 = 0xd5c0;
                t6 = far_cd4d6();
                bx = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                dx = (int)(t6 >> 16);
            } else if (ax == 1) {
                t3 = (long)(int)arg_0 * 36L;
                loc_6 = (int)t3;
                dx3 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t3 + 0x4820);
                bx2 = loc_6;
                dx4 = dx3 + *(int far *)MK_FP(0xa853 /* SEG_A28F */, bx2 + 0x481c);
                cx = 0xa853 /* SEG_A28F */;
                *(int far *)MK_FP(cx, bx2 + 0x4822) = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t3 + 0x4822) + *(int far *)MK_FP(0xa853 /* SEG_A28F */, bx2 + 0x481e) + (dx4 < dx3);
                *(int far *)MK_FP(cx, bx2 + 0x4820) = dx4;
                ax3 = di->f_2;
                dx5 = (unsigned int)di->f_0 >> 1 | (ax3 & 1) << 15;
                bx3 = (struct s1 near *)loc_4;
                *(int *)((char near *)bx3) = *(int *)((char near *)bx3) + dx5;
                *(int *)((char near *)bx3 + 2) = (int)(bx3->f_0 + ((long)(ax3 >> 1) << 16 | (unsigned)dx5) >> 16);
                ax4 = di->f_2;
                dx = (unsigned int)di->f_0 >> 1 | (ax4 & 1) << 15;
                di->f_2 = ax4 >> 1;
                di->f_0 = dx;
                bx = loc_6;
                es = 0xa853 /* SEG_A28F */;
                *(char far *)MK_FP(es, bx + 0x4813) = (char)0;
            } else if (ax == 2) {
                ax2 = di->f_2;
                dx2 = (unsigned int)di->f_0 >> 1 | (ax2 & 1) << 15;
                di->f_2 = ax2 >> 1;
                di->f_0 = dx2;
                t2 = (long)(int)arg_0 * 36L;
                dx = 0xa853 /* SEG_A28F */;
                bx = (int)t2;
                es = dx;
                *(char far *)MK_FP(es, bx + 0x4813) = (char)0;
            }
        }
        si = si + 10;
        di = (struct s2 near *)((char near *)di + 10);
        loc_4 = loc_4 + 10;
        loc_2 = loc_2 + 1;
    } while (si != 0xbb8);
    far_cd0a9();
    L_d2774(arg_0, 0);
    return;
}
long far far_cd4d6(void) { return 0; }
long far fn_cd9e4(int p0, int p1, int p2, int p3, int p4) { return 0; }
