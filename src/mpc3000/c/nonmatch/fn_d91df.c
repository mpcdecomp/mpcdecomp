/* differs: 308 at +5, 461 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern long far far_b6beb(long, char far *);
extern int far far_cad6d(char far *, int, int);
extern long far far_cce4b(char far *, long, int);
extern void far far_cd353(int, int);
extern void far far_cd5d8(int);
extern long far far_d938a(int, int, int, int, int);
extern long far far_fa0c8(int, int, int);

void far fn_d91df(int arg_0, int arg_2, int arg_4, char arg_6)
{
    char loc_3e[17];
    int loc_2d;
    int loc_2b;
    int loc_29;
    char loc_27[7];
    char loc_20[16];
    char loc_10[6];
    char loc_a;
    char loc_9[7];
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int bx;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    int t6;
    long t7;
    int t8;

    if (far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_3e), arg_4, 29) != 0) {
        return;
    }
    if (arg_6 == 1 && far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), arg_4, 8) != 0) {
        return;
    }
    loc_2 = 0;
    ax = (int)far_b6beb(*(long *)((char *)&arg_0 + 0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20));
    si = 0;
    do {
        bx = (int)(unsigned)(loc_20 + si);
        if (*(char far *)MK_FP(SEG_STACK, bx) == 46 || loc_2 == 1) {
            *(char far *)MK_FP(SEG_STACK, bx) = (char)32;
            loc_2 = 1;
        }
        si = si + 1;
    } while (si < 16);
    loc_10[0] = (char)0;
    t1 = far_cce4b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20), *(long *)((char *)&loc_2d + 0), 0);
    if ((int)t1 < 0) {
        return;
    }
    ax2 = loc_29;
    t2 = far_fa0c8(40, ax2, -(ax2 < 0));
    t3 = (long)(int)(int)t1 * 36L;
    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t3 + 0x4816) = (int)(t2 >> 16);
    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t3 + 0x4814) = (int)t2;
    ax3 = *(int *)((char *)&loc_27 + 0);
    t4 = far_fa0c8(40, ax3, -(ax3 < 0));
    t5 = (long)(int)(int)t1 * 36L;
    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t5 + 0x481a) = (int)(t4 >> 16);
    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t5 + 0x4818) = (int)t4;
    *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t5 + 0x4813) = (char)0;
    if (arg_6 != 1) {
        *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t5 + 0x4811) = (char)100;
        *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t5 + 0x4812) = (char)-17;
    } else {
        *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t5 + 0x4811) = loc_a;
        *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t5 + 0x4812) = (char)(loc_9[0] - 17);
    }
    far_cd5d8((int)t1);
    t7 = (long)(int)(int)t1 * 36L;
    if ((int)far_d938a(arg_4, *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t7 + 0x4820), *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t7 + 0x4822), loc_2d, loc_2b) < 0) {
        far_cd353((int)t1, 0);
    }
    return;
}
long far far_d938a(int p0, int p1, int p2, int p3, int p4) { return 0; }
