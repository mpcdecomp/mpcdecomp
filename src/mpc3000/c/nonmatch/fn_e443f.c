/* differs: 308 at +5, 107 bytes; 311 at +5, 107 bytes; 312 at +5, 107 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_901B;
extern int W_9045;
extern int W_9047;
extern int W_9051;
extern int W_9053;
extern int far far_d79ee(void);
extern int far far_d7b2c(void);
extern long far far_dae36(void);
extern long far far_daf5c(void);
extern long far far_dc2bf(char far *, int, int);
extern long far far_dee1d(void);
extern long far far_e5612(int, int);
extern long far far_e7073(int, int);

void far fn_e443f(void)
{
    char loc_a[10];
    int loc_c;
    int loc_e;
    int dx;
    int si;
    int t1;
    long t2;
    long t3;
    long t4;
    long t5;

    if (B_901B != 0) {
        goto L1;
    }
    si = 0;
    goto L2;
L3:
    if ((int)far_dee1d() != 0) {
        goto L4;
    }
    dx = W_9051;
    loc_c = W_9053;
    loc_e = dx;
    t2 = far_dae36();
    if ((int)far_dc2bf((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_a), 10, 0) == 0) {
        goto L5;
    }
    si = 1;
L5:
    t3 = far_daf5c();
    t4 = far_e5612(loc_e, loc_c);
    if (far_d7b2c() == 0) {
        goto L2;
    }
    t1 = far_d79ee();
    if (t1 == 117) {
        goto L4;
    }
L2:
    if (si == 0) {
        goto L3;
    }
L4:
    t5 = far_e7073(W_9045, W_9047);
L1:
    return;
}
