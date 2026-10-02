/* differs: 308 at +5, 925 bytes; 311 at +5, 926 bytes; 312 at +5, 926 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char f_0;
    char f_1;
    char pad_2[666];
    char f_29c;
};
extern char B_9457;
extern char B_956A;
extern unsigned char B_F77C;
extern unsigned char B_F77D;
extern unsigned char TBL_F779;
extern int TBL_F77A;
extern long far far_d97ca(int, unsigned char far *, int);
extern int far far_daa82(int);
extern int far far_daa8e(int far *);
extern long far far_dad20(int, int);
extern void far far_e2da2(struct s1 far *, int);
extern long far far_e56a0(int, int, long, int, int);
extern long far far_e5ff8(void);
extern long far far_e7189(long, int);
extern void far fn_e5fbc(void);

long far fn_e5ac8(struct s1 far *arg_0, int arg_2)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    long loc_c;
    int loc_e;
    long loc_10;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    unsigned int ax5;
    int bx;
    int bx10;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    int bx8;
    int bx9;
    int di;
    int dx;
    int dx2;
    int dx3;
    int es;
    int es10;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int es9;
    int p32;
    int p34;
    int si;
    int t1;
    int t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t2;
    long t3;
    int t4;
    int t5;
    long t6;
    long t7;
    unsigned long t8;
    int t9;

    if ((arg_0->f_1 & 2) != 0) {
        goto L1;
    }
    if (arg_0->f_0 == -1) {
        goto L1;
    }
    fn_e5fbc();
    t2 = far_dad20(*(int *)((char *)&arg_0 + 0), arg_2);
    if ((int)t2 == 0) {
        bx = FP_OFF(arg_0);
        es = FP_SEG(arg_0);
        p32 = 1;
        p34 = ((char)((int)t2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 1));
        t3 = far_e56a0(p34, p32, *(long far *)MK_FP(es, bx + 14), 0, 0);
        far_e2da2(arg_0, 1);
    }
    bx2 = FP_OFF(arg_0);
    es2 = FP_SEG(arg_0);
    *(char far *)MK_FP(es2, bx2 + 1) = (char)(*(char far *)MK_FP(es2, bx2 + 1) | 2);
    dx = *(int far *)MK_FP(es2, bx2 + 18);
    loc_2 = *(int far *)MK_FP(es2, bx2 + 20);
    loc_4 = dx;
    si = 0;
    di = 1;
    *(char far *)MK_FP(es2, bx2 + 0x29c) = (char)0;
    loc_e = 0;
    *(int *)((char *)&loc_10 + 0) = 0;
    loc_a = 0;
    *(int *)((char *)&loc_c + 0) = 0;
    B_956A = (char)(B_956A + 1);
    for (;;) {
        bx3 = FP_OFF(arg_0);
        es3 = FP_SEG(arg_0);
        dx2 = *(int far *)MK_FP(es3, bx3 + 18);
        loc_6 = *(int far *)MK_FP(es3, bx3 + 20);
        loc_8 = dx2;
        t11 = far_d97ca(*(int far *)MK_FP(es3, bx3 + 46), (unsigned char far *)&TBL_F779, 0x640);
        ax = TBL_F779 & 248;
        if (ax == 136) {
            t10 = far_daa82(TBL_F77A);
            *(int *)((char *)&loc_c + 0) = *(int *)((char *)&loc_c + 0) + t10;
            loc_a = (int)(loc_c + (long)(int)t10 >> 16);
            continue;
        }
        if (ax != 168) {
            if (ax == 248) {
                goto L2;
            }
            continue;
        }
        if (loc_a == loc_e && *(int *)((char *)&loc_c + 0) == *(int *)((char *)&loc_10 + 0)) {
            t5 = far_daa8e((int far *)&TBL_F77A);
            ax3 = t5;
            if (ax3 != di) {
                break;
            }
            p32 = di;
            p34 = ((char)(ax3 >> 8) << 8 | (unsigned char)arg_0->f_1);
            t6 = far_e56a0(p34, p32, *(long *)((char *)&loc_8 + 0), 0, 0);
            bx7 = FP_OFF(arg_0);
            es7 = FP_SEG(arg_0);
            ax4 = di;
            di = di + 1;
            if (*(int far *)MK_FP(es7, bx7 + 50) == ax4) {
                *(int far *)MK_FP(es7, bx7 + 28) = loc_6;
                *(int far *)MK_FP(es7, bx7 + 26) = loc_8;
            }
            t7 = (long)(int)B_F77C * 0x180L;
            t8 = (unsigned long)(unsigned int)(int)t7;
            ax5 = (unsigned)(t8 / (unsigned long)(unsigned char)B_F77D);
            *(int *)((char *)&loc_10 + 0) = *(int *)((char *)&loc_10 + 0) + ax5;
            loc_e = (int)(loc_10 + (unsigned long)(unsigned int)ax5 >> 16);
            es8 = FP_SEG(arg_0);
            bx8 = FP_OFF(arg_0) + (si << 2);
            if (*(char far *)MK_FP(es8, bx8 + 0x29c) == B_F77C && *(char far *)MK_FP(es8, bx8 + 0x29d) == B_F77D) {
                continue;
            }
            if (arg_0->f_29c != 0) {
                si = si + 1;
            }
            if (si <= 78) {
                t9 = far_daa8e((int far *)&TBL_F77A);
                es9 = FP_SEG(arg_0);
                bx9 = FP_OFF(arg_0) + (si << 2);
                *(int far *)MK_FP(es9, bx9 + 0x29a) = t9;
                *(char far *)MK_FP(es9, bx9 + 0x29c) = B_F77C;
                *(char far *)MK_FP(es9, bx9 + 0x29d) = B_F77D;
                continue;
            }
            si = 78;
            B_9457 = (char)(B_9457 | 8);
            continue;
        }
        break;
    }
    bx10 = FP_OFF(arg_0);
    es10 = FP_SEG(arg_0);
    *(int far *)MK_FP(es10, bx10 + 20) = loc_2;
    *(int far *)MK_FP(es10, bx10 + 18) = loc_4;
    *(char far *)MK_FP(es10, bx10 + 1) = (char)(*(char far *)MK_FP(es10, bx10 + 1) & -3);
    B_9457 = (char)(B_9457 | 32);
    B_956A = (char)(B_956A - 1);
    return far_e5ff8();
    goto L1;
    goto L1;
L2:
    if (loc_a == loc_e && *(int *)((char *)&loc_c + 0) == *(int *)((char *)&loc_10 + 0)) {
        t12 = far_e56a0(arg_0->f_1, 0, *(long *)((char *)&loc_8 + 0), 0, 0);
        es4 = FP_SEG(arg_0);
        *(int far *)MK_FP(es4, FP_OFF(arg_0) + (si + 1 << 2) + 0x29a) = -1;
        bx4 = *(int *)((char *)&arg_0 + 0);
        *(int far *)MK_FP(es4, bx4 + 20) = loc_2;
        *(int far *)MK_FP(es4, bx4 + 18) = loc_4;
        t13 = far_e7189(((long)arg_2 << 16 | (unsigned)bx4), *(int far *)MK_FP(es4, bx4 + 50));
        bx5 = FP_OFF(arg_0);
        es5 = FP_SEG(arg_0);
        *(int far *)MK_FP(es5, bx5 + 32) = (int)(t13 >> 16);
        *(int far *)MK_FP(es5, bx5 + 30) = (int)t13;
        *(int far *)MK_FP(es5, bx5 + 48) = di - 1;
        *(int far *)MK_FP(es5, bx5 + 36) = loc_a;
        *(int far *)MK_FP(es5, bx5 + 34) = *(int *)((char *)&loc_c + 0);
        B_956A = (char)(B_956A - 1);
        t14 = far_e5ff8();
        ax2 = (int)t14;
        dx3 = (int)(t14 >> 16);
L1:
        return ((long)dx3 << 16 | (unsigned)ax2);
    }
    bx6 = FP_OFF(arg_0);
    es6 = FP_SEG(arg_0);
    *(int far *)MK_FP(es6, bx6 + 20) = loc_2;
    *(int far *)MK_FP(es6, bx6 + 18) = loc_4;
    *(char far *)MK_FP(es6, bx6 + 1) = (char)(*(char far *)MK_FP(es6, bx6 + 1) & -3);
    B_9457 = (char)(B_9457 | 32);
    B_956A = (char)(B_956A - 1);
    return far_e5ff8();
}
long far far_e5ff8(void) { return 0; }
void far fn_e5fbc(void) { }
