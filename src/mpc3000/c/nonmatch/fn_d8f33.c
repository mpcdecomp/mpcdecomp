/* differs: 308 absent; 311 at +5, 439 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern long far far_b6beb(long, char far *);
extern int far far_cad6d(char far *, int, int);
extern long far far_cce4b(char far *, long, int);
extern long far far_cd353(int, int, int);
extern int far fn_d9129(int, int, int, int, int);

void far fn_d8f33(int arg_0, int arg_2, int arg_4)
{
    char loc_42[16];
    char loc_32[6];
    char loc_2c[18];
    char loc_1a;
    unsigned char loc_19;
    int loc_18;
    int loc_16;
    int loc_14;
    int loc_12;
    int loc_10;
    char loc_e[6];
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int bx;
    int bx2;
    int bx3;
    unsigned int cx;
    int cx2;
    int dx;
    unsigned int dx2;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    if (far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2c), arg_4, 36) != 0) {
        return;
    }
    loc_4 = 0;
    ax = (int)far_b6beb(*(long *)((char *)&arg_0 + 0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_42));
    si = 0;
    do {
        bx = (int)(unsigned)(loc_42 + si);
        if (*(char far *)MK_FP(SEG_STACK, bx) == 46 || loc_4 == 1) {
            *(char far *)MK_FP(SEG_STACK, bx) = (char)32;
            loc_4 = 1;
        }
        si = si + 1;
    } while (si < 16);
    loc_32[0] = (char)0;
    t1 = far_cce4b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_42), *(long *)((char *)&loc_10 + 0), loc_19);
    loc_2 = (int)t1;
    if ((int)t1 < 0) {
        return;
    }
    if (loc_19 != 0) {
        if (loc_19 == 1) {
            dx2 = loc_10;
            loc_6 = *(int *)((char *)&loc_e + 0) << 1 | dx2 >> 15 & 1;
            loc_8 = dx2 << 1;
        }
    } else {
        dx = loc_10;
        loc_6 = *(int *)((char *)&loc_e + 0);
        loc_8 = dx;
    }
    t2 = (long)(int)loc_2 * 36L;
    if (fn_d9129(arg_4, *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t2 + 0x4820), *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t2 + 0x4822), loc_8, loc_6) != 0) {
        t3 = far_cd353(loc_2, 0, 1);
        return;
    }
    t4 = (long)(int)loc_2 * 36L;
    cx = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_42), 0, -1);
    cx2 = cx >> 1;
    __movs2(MK_FP(0xa283 /* SEG_A28F */, (int)t4 + 0x4800), MK_FP(SEG_STACK, (int)t4 + 0x4800), cx2 * 2);
    __movs1(MK_FP(0xa283 /* SEG_A28F */, (int)t4 + 0x4800 + cx2 * 2), MK_FP(SEG_STACK, (int)t4 + 0x4800 + cx2 * 2), cx & 1);
    t5 = (long)(int)loc_2 * 36L;
    *(char far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x4811) = (char)(int)t5;
    *(char far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x4812) = loc_1a;
    bx2 = loc_18;
    *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x4816) = loc_16;
    *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x4814) = bx2;
    bx3 = loc_14;
    *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x481a) = loc_12;
    *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x4818) = bx3;
    return;
}
int far fn_d9129(int p0, int p1, int p2, int p3, int p4) { return 0; }
