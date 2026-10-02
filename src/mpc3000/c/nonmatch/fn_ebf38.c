/* differs: 308 at +5, 169 bytes; 311 at +5, 169 bytes; 312 at +5, 169 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_STACK _SS
struct s1 {
    char pad_0[4];
    int f_4;
    int f_6;
};
extern char B_75AC;
extern long far far_fa0c8(int, int, int);
extern void far pascal far_fa0df(int far *, char far *);
extern long far far_fa326(char far *, int, int, int, int);

long far fn_ebf38(struct s1 far *arg_0, int arg_4, int arg_6)
{
    char loc_18[8];
    int loc_10;
    int loc_e;
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    unsigned int ax;
    unsigned int ax2;
    int bx;
    int dx;
    int dx2;
    int es;
    long t1;
    int t2;
    long t3;
    long t4;
    long t5;

    t1 = far_fa326((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18), arg_4, arg_6, arg_0->f_4, 0);
    far_fa0df((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_10), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18));
    dx = loc_10;
    loc_6 = loc_e;
    loc_8 = dx;
    dx2 = loc_c;
    loc_2 = loc_a;
    loc_4 = dx2;
    t3 = *(long *)((char *)&loc_c + 0) << B_75AC;
    loc_2 = (int)(t3 >> 16);
    loc_4 = (int)t3;
    bx = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    t4 = t3 / *(long far *)MK_FP(es, bx);
    loc_2 = (int)(t4 >> 16);
    loc_4 = (int)t4;
    t5 = far_fa0c8(loc_8, arg_0->f_6, 0);
    ax = loc_4;
    ax2 = ax + (int)t5;
    return ((long)(loc_2 + (int)(t5 >> 16) + (ax2 < ax)) << 16 | (unsigned)ax2);
}
