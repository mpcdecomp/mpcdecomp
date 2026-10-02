/* differs: 308 at +3, 393 bytes; 311 at +3, 394 bytes; 312 at +3, 394 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_A5BC {
    char f_0;
};
extern char B_8800;
extern unsigned char B_8804;
extern char B_880A;
extern unsigned char B_901B[];
extern struct g_TBL_A5BC TBL_A5BC;
extern int W_8812;
extern int W_8814;
extern int W_881A;
extern unsigned char W_D5F3[];
extern int far far_dacd8();
extern long far far_e3f2c();
extern long far far_e7073();
extern long far far_e7189();
extern long far far_eb86b();

int far far_deee8(char far *arg_0, int arg_2, int arg_4)
{
    int ax;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    bx = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    *(char far *)MK_FP(es, bx + 54) = (char)0;
    *(char far *)MK_FP(es, bx + 55) = (char)1;
    *(int far *)MK_FP(es, bx + 44) = 0;
    *(int far *)MK_FP(es, bx + 42) = 0;
    *(int far *)MK_FP(es, bx + 40) = 0;
    *(int far *)MK_FP(es, bx + 38) = 0;
    *(int far *)MK_FP(es, bx + 52) = 0;
    t1 = far_e3f2c(((long)arg_2 << 16 | (unsigned)bx), arg_4);
    ax = SEG_DATA;
    if (arg_2 != ax) {
        goto L1;
    }
    if (*(int *)((char *)&arg_0 + 0) != (unsigned int)(unsigned)B_901B) {
L1:
        bx2 = FP_OFF(arg_0);
        if (*(char far *)MK_FP(FP_SEG(arg_0), bx2) >= 0) {
            t2 = far_e7189(((long)arg_2 << 16 | (unsigned)bx2), (int)t1);
            ax = (int)t2;
            bx3 = FP_OFF(arg_0);
            es2 = FP_SEG(arg_0);
            *(int far *)MK_FP(es2, bx3 + 44) = (int)(t2 >> 16);
            *(int far *)MK_FP(es2, bx3 + 42) = ax;
            *(int far *)MK_FP(es2, bx3 + 40) = (int)(t2 >> 16);
            *(int far *)MK_FP(es2, bx3 + 38) = ax;
        }
    } else {
        __stos2((unsigned char far *)W_D5F3, 0, 10);
        if (B_8800 == 0 && *arg_0 >= 0 || B_8800 != 0 && *(char *)((char *)&TBL_A5BC + 0 + B_8804 * 0x1f4) != 0) {
            t3 = far_e7189(arg_0, (int)t1);
            bx4 = FP_OFF(arg_0);
            es3 = FP_SEG(arg_0);
            *(int far *)MK_FP(es3, bx4 + 44) = (int)(t3 >> 16);
            *(int far *)MK_FP(es3, bx4 + 42) = (int)t3;
            *(int far *)MK_FP(es3, bx4 + 40) = (int)(t3 >> 16);
            *(int far *)MK_FP(es3, bx4 + 38) = (int)t3;
            t4 = far_eb86b(*(long far *)MK_FP(es3, bx4 + 42), (unsigned char far *)W_D5F3);
            bx5 = FP_OFF(arg_0);
            es4 = FP_SEG(arg_0);
            t5 = far_e7073(*(int far *)MK_FP(es4, bx5 + 42), *(int far *)MK_FP(es4, bx5 + 44));
        }
        ax = far_dacd8();
        B_880A = (char)0;
        W_8814 = 0;
        W_8812 = 0;
        W_881A = 1;
    }
    bx6 = FP_OFF(arg_0);
    es5 = FP_SEG(arg_0);
    *(int far *)MK_FP(es5, bx6 + 56) = (int)t1;
    *(int far *)MK_FP(es5, bx6 + 58) = 0;
    return ax;
}
