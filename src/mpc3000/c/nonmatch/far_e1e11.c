/* differs: 308 at +5, 233 bytes; 311 at +5, 220 bytes; 312 at +5, 221 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8AA0;
extern char B_901B;
extern int W_8C31;
extern int W_8C33;
extern int W_8C35;
extern int W_8C37;
extern long far far_da25f(long, long, long);
extern long far far_da9e4();
extern long far far_daa07(int, int, int, int);
extern long far far_e259f(char);
extern long far far_e26cc(long);
extern long far far_e26fb(long);

int far far_e1e11(char arg_0)
{
    int loc_2;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;

    if (B_901B >= 0) {
        return -4;
    }
    t1 = far_e259f(arg_0);
    loc_2 = (int)t1;
    if ((int)t1 != 0) {
        return (int)t1;
    }
    B_8AA0 = (char)0;
    t2 = far_e26fb(*(long *)((char *)&W_8C35 + 0));
    t3 = far_e26cc(*(long *)((char *)&W_8C35 + 0));
    t4 = far_da9e4(W_8C35, W_8C37);
    t5 = far_daa07(W_8C31, W_8C33, (int)t4, (int)(t4 >> 16));
    t6 = far_da25f(t4, *(long *)((char *)&W_8C35 + 0), t5 + 1L);
    t7 = far_daa07((int)t4, (int)(t4 >> 16), W_8C35, W_8C37);
    t8 = far_da9e4(W_8C31, W_8C33, -(int)t7, -(int)(t7 >> 16) - ((int)t7 != 0));
    W_8C33 = (int)(t8 >> 16);
    W_8C31 = (int)t8;
    return 0;
}
