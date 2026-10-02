/* differs: 308 at +5, 272 bytes; 311 at +5, 272 bytes; 312 at +5, 272 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_STACK _SS
extern char B_E557;
extern char B_E558;
extern char TBL_1D26[];
extern int W_E555;
extern int far far_b1ae0(int);
extern long far fn_b1b5f(int);
long far fn_b1b5f(int p0) { return 0; }

long far fn_b1c09(unsigned int arg_0, int arg_2, int arg_4)
{
    char loc_24[32];
    char far *loc_4;
    int loc_2;
    int ax;
    int bx;
    int di;
    int dx;
    int es;
    int flags;
    long t1;
    long t2;

    di = 0;
    flags = arg_2;
    if (!CC(">", flags) && (CC("<", flags) || arg_0 < 0) && B_E557 == 0) {
        di = 1;
        dx = arg_0;
        arg_2 = -arg_2 - (dx != 0);
        arg_0 = -dx;
    }
    loc_2 = SEG_STACK;
    *(int *)((char *)&loc_4 + 0) = (int)(unsigned)loc_24;
    do {
        *loc_4 = TBL_1D26[(unsigned)(*(long *)((char *)&arg_0 + 0) % (unsigned long)(unsigned int)arg_4)];
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
        t1 = *(long *)((char *)&arg_0 + 0) / (unsigned long)(unsigned int)arg_4;
        arg_2 = (int)(t1 >> 16);
        arg_0 = (int)t1;
    } while ((int)(t1 >> 16) != 0 || (int)(t1 >> 16) == 0 && (int)t1 != 0);
    if (di != 0) {
        *loc_4 = (char)45;
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
    }
    *loc_4 = (char)0;
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) - 1;
    W_E555 = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_24), 0, -1) - 1;
    t2 = fn_b1b5f(0 - (B_E558 != 0) + 1);
    while ((unsigned int)(unsigned)loc_24 <= *(int *)((char *)&loc_4 + 0)) {
        bx = FP_OFF(loc_4);
        es = FP_SEG(loc_4);
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) - 1;
        ax = far_b1ae0(*(char far *)MK_FP(es, bx));
    }
    return fn_b1b5f(B_E558);
}
