/* differs: 308 at +5, 243 bytes; 311 at +5, 242 bytes; 312 at +5, 242 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[2];
    char f_2;
};
extern char B_83BC;
extern int far far_b1ad0(int, int);
extern int far far_b1b2b(char far *, char far *);

long far fn_c403f(int arg_0, int arg_2, struct s1 far *arg_4, int arg_6)
{
    char loc_27[1];
    char loc_26[32];
    char loc_6;
    char loc_5;
    char loc_4[2];
    char loc_2;
    char loc_1;
    int ax;
    int ax2;
    int ax3;
    int bx;
    int bx2;
    int cx;
    int es;

    __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_26), 0x2020, 34);
    loc_4[0] = (char)0;
    bx = FP_OFF(arg_4);
    ax = (32 << 8 | (unsigned char)*(char far *)MK_FP(FP_SEG(arg_4), bx));
    cx = (unsigned int)(char)ax >> 1;
    __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_26), 0x3e3e, cx * 2);
    __stos1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_26 + cx * 2)), 62, (char)ax & 1);
    es = arg_6;
    loc_26[*(char far *)MK_FP(es, bx + 1)] = (char)62;
    bx2 = *(int *)((char *)&arg_4 + 0);
    if (*(char far *)MK_FP(es, bx2 + 1) != 0) {
        loc_27[*(char far *)MK_FP(es, bx2 + 1)] = (char)62;
    }
    if (arg_4->f_2 <= 32) {
        loc_26[arg_4->f_2] = (char)80;
    } else {
        loc_5 = (char)33;
        loc_6 = (char)80;
    }
    loc_26[(B_83BC << 5) / 100] = (char)84;
    far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2));
    far_b1ad0(arg_0, arg_2);
    return ((long)UNDEF << 16 | (unsigned)far_b1ad0(loc_1, loc_2));
}
