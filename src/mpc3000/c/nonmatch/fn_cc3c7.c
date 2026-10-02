/* differs: 308 absent; 311 at +3, 289 bytes; 312 at +3, 289 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
struct s1 {
    char f_0;
    char pad_1[16];
    int f_11;
};
struct s2 {
    char pad_0[3];
    char f_3;
    int f_4;
    char pad_6[2];
    int f_8;
    int f_a;
    int f_c;
};
extern int TBL_E223[];
extern int TBL_E263[];
extern int TBL_E2A3[];
extern int TBL_E2E6[];
extern int TBL_E326[];
extern int TBL_E366[];
extern char TBL_E3AC[];
extern long far far_cafac(int, int, int, int, char);
extern void far far_cdcb0(void);
extern void far far_cdcb9(void);
extern int far far_cddc1(int, int);

void far fn_cc3c7(struct s1 far *arg_0, struct s2 far *arg_4, int arg_8, int arg_10, int arg_12, char arg_14)
{
    int ax;
    int ax2;
    int bx;
    int es;
    int es2;
    int t1;
    long t2;
    int t3;
    int t4;

    far_cdcb0();
    t2 = far_cafac((unsigned char)arg_4->f_3, arg_8, arg_10, arg_12, arg_14);
    bx = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    *(char far *)MK_FP(es, bx) = (char)(int)t2;
    TBL_E223[*(char far *)MK_FP(es, bx)] = 0;
    TBL_E263[*(char far *)MK_FP(es, *(int *)((char *)&arg_0 + 0))] = 0;
    TBL_E2A3[*(char far *)MK_FP(es, *(int *)((char *)&arg_0 + 0))] = 0;
    TBL_E3AC[*(char far *)MK_FP(es, *(int *)((char *)&arg_0 + 0))] = *(char *)((char *)&arg_8 + 0);
    TBL_E2E6[arg_0->f_0] = arg_4->f_a;
    TBL_E366[arg_0->f_0] = arg_4->f_c;
    es2 = FP_SEG(arg_4);
    TBL_E326[arg_0->f_0] = *(int far *)MK_FP(es2, FP_OFF(arg_4) + 14);
    t3 = far_cddc1(arg_0->f_0, *(int far *)MK_FP(es2, *(int *)((char *)&arg_4 + 0) + 6));
    ax = far_cddc1(arg_0->f_0 + 32, arg_4->f_4);
    if (arg_0->f_11 != 0) {
        ax2 = far_cddc1(arg_0->f_0 + 64, arg_4->f_8);
    }
    far_cdcb9();
    return;
}
