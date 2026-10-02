/* differs: 308 at +5, 591 bytes; 311 at +5, 594 bytes; 312 at +5, 595 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8AA0;
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern int W_8C31;
extern int W_8C33;
extern int W_8C35;
extern int W_8C37;
extern void far far_da25f();
extern long far far_da9e4(int, int, int, int);
extern long far far_daa07(int, int, int, int);
extern long far far_daa3c(int, int);
extern long far far_e0031(unsigned char far *);
extern long far far_e1e11(int);
extern long far far_e259f(char);
extern long far far_e2ce3(void);
extern long far far_e51be(unsigned char far *, int, int);
extern long far far_e6cb9(int);

int far far_e13f9(int arg_0, int arg_2)
{
    int loc_2;
    unsigned int loc_4;
    int loc_6;
    unsigned int loc_8;
    int loc_a;
    char far *loc_c;
    int ax2;
    int ax3;
    int bx;
    int dx;
    int dx2;
    int flags;
    int flags2;
    long t1;
    long t10;
    int t11;
    long t12;
    long t13;
    long t14;
    int t15;
    long t16;
    long t17;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    if (arg_0 == arg_2) {
        return 0;
    }
    if ((int)far_e259f(*(char *)((char *)&arg_0 + 0)) != 0) {
        return 0;
    }
    t1 = far_e6cb9(arg_0);
    t2 = far_e2ce3();
    bx = (int)(t1 + 0x190L >> 16);
    flags = (int)(t2 >> 16) - bx;
    if (!CC(">", flags) && (CC("<", flags) || (unsigned int)(int)t2 < (unsigned int)((int)t1 + 0x190))) {
        return -3;
    }
    B_8AA0 = (char)0;
    t3 = far_e0031((unsigned char far *)B_8C41);
    t4 = far_e0031((unsigned char far *)B_901B);
    if ((int)far_e259f(*(char *)((char *)&arg_2 + 0)) == 0) {
        t5 = far_e1e11(arg_2);
        t6 = far_e259f(*(char *)((char *)&arg_2 + 0));
    }
    t7 = far_daa3c(W_8C35, W_8C37);
    loc_6 = (int)(t7 >> 16);
    loc_8 = (int)t7;
    t8 = far_e259f(*(char *)((char *)&arg_0 + 0));
    t9 = far_daa3c(W_8C35, W_8C37);
    loc_2 = (int)(t9 >> 16);
    loc_4 = (int)t9;
    ax2 = loc_6;
    dx = loc_8;
    loc_a = ax2;
    *(int *)((char *)&loc_c + 0) = dx;
    dx2 = (int)(far_daa07(W_8C31, W_8C33, dx, ax2) + 1L >> 16);
    t10 = far_da9e4(W_8C31, W_8C33, (int)t1, (int)(t1 >> 16));
    far_da25f(*(long *)((char *)&W_8C31 + 0), t10);
    ax3 = loc_2;
    flags2 = ax3 - loc_6;
    if (!CC("<u", flags2) && (CC(">u", flags2) || loc_4 > loc_8)) {
        t12 = far_da9e4(loc_4, loc_2, (int)t1, (int)(t1 >> 16));
        loc_2 = (int)(t12 >> 16);
        loc_4 = (int)t12;
    } else {
        t13 = far_da9e4(loc_8, loc_6, (int)t1 - 1, (int)(t1 - 1L >> 16));
        loc_6 = (int)(t13 >> 16);
        loc_8 = (int)t13;
        t14 = far_da9e4(loc_4, loc_2, (int)t1 - 1, (int)(t1 - 1L >> 16));
        loc_2 = (int)(t14 >> 16);
        loc_4 = (int)t14;
    }
    far_da25f(*(long *)((char *)&loc_4 + 0), *(long *)((char *)&loc_8 + 0), t1);
    *loc_c = *(char *)((char *)&arg_2 + 0);
    t16 = far_da9e4(W_8C31, W_8C33, (int)t1, (int)(t1 >> 16));
    W_8C33 = (int)(t16 >> 16);
    W_8C31 = (int)t16;
    t17 = far_e51be((unsigned char far *)B_901B, arg_2, 1);
    return 0;
}
