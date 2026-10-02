/* differs: 308 at +5, 377 bytes; 311 at +5, 378 bytes; 312 at +5, 378 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[58];
    int f_3a;
};
extern unsigned char B_901B[];
extern char B_956A;
extern char B_D612;
extern unsigned char B_F77C;
extern unsigned char B_F77D;
extern int TBL_882A;
extern int TBL_882C;
extern unsigned char TBL_F779;
extern int TBL_F77A;
extern long far far_d97ca(int, unsigned char far *, int);
extern int far far_daa82(int);
extern void far far_e39e4(long);
extern long far far_e7073(int, int);
extern long far far_e723d(struct s1 far *, int, int);
extern long far far_e7d89(unsigned char far *, int);

void far far_e3ddb(struct s1 far *arg_0, int arg_2)
{
    int loc_2;
    int loc_4;
    int ax;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int dx;
    int dx2;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    long t1;
    long t2;
    int t3;
    long t4;
    int t5;
    long t6;
    long t7;

    B_956A = (char)(B_956A + 1);
    for (;;) {
        bx = FP_OFF(arg_0);
        if (*(int far *)MK_FP(FP_SEG(arg_0), bx + 58) == 0) {
            bx2 = FP_OFF(arg_0);
            es = FP_SEG(arg_0);
            dx = *(int far *)MK_FP(es, bx2 + 18);
            loc_2 = *(int far *)MK_FP(es, bx2 + 20);
            loc_4 = dx;
            t4 = far_d97ca(*(int far *)MK_FP(es, bx2 + 46), (unsigned char far *)&TBL_F779, 0x640);
            ax = TBL_F779 & 248;
            if (ax != 136) {
                if (ax != 168) {
                    if (ax == 248) {
                        goto L1;
                    }
                    goto L2;
                }
                t1 = far_e723d(arg_0, B_F77C, B_F77D);
L2:
                if (arg_2 == SEG_DATA && *(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B) {
                    t2 = far_e7d89((unsigned char far *)&TBL_F779, (int)t4);
                    continue;
                }
                continue;
            }
            t3 = far_daa82(TBL_F77A);
            arg_0->f_3a = t3;
            continue;
        }
        break;
    }
    far_e39e4(((long)arg_2 << 16 | (unsigned)bx));
    if (B_D612 != 0 && arg_2 == SEG_DATA && (*(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B && (TBL_882A | TBL_882C) == 0)) {
        bx4 = FP_OFF(arg_0);
        es3 = FP_SEG(arg_0);
        t6 = far_e7073(*(int far *)MK_FP(es3, bx4 + 42), *(int far *)MK_FP(es3, bx4 + 44));
    }
    bx5 = FP_OFF(arg_0);
    es4 = FP_SEG(arg_0);
    if (*(int far *)MK_FP(es4, bx5 + 58) == 0) {
        dx2 = *(int far *)MK_FP(es4, bx5 + 18);
        loc_2 = *(int far *)MK_FP(es4, bx5 + 20);
        loc_4 = dx2;
        t7 = far_d97ca(*(int far *)MK_FP(es4, bx5 + 46), (unsigned char far *)&TBL_F779, 0x640);
        bx6 = FP_OFF(arg_0);
        es5 = FP_SEG(arg_0);
        *(int far *)MK_FP(es5, bx6 + 20) = loc_2;
        *(int far *)MK_FP(es5, bx6 + 18) = loc_4;
    }
    B_956A = (char)(B_956A - 1);
    return;
L1:
    bx3 = FP_OFF(arg_0);
    es2 = FP_SEG(arg_0);
    *(int far *)MK_FP(es2, bx3 + 20) = loc_2;
    *(int far *)MK_FP(es2, bx3 + 18) = loc_4;
    B_956A = (char)(B_956A - 1);
    return;
}
