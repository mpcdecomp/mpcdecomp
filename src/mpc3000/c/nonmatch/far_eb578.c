/* differs: 308 at +5, 386 bytes; 311 at +5, 386 bytes; 312 at +5, 386 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
struct s1 {
    char pad_0[1508];
    int f_5e4;
    int f_5e6;
};
extern char B_7FCB;

long far far_eb578(int arg_0, int arg_2, int arg_4, int arg_6, long arg_8, int arg_10)
{
    int loc_e;
    long loc_c;
    int loc_a;
    long loc_8;
    int loc_6;
    int far *loc_4;
    int loc_2;
    struct s1 near *ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    struct s1 near *bx8;
    int bx9;
    unsigned int dx;
    unsigned int dx2;
    unsigned int dx3;
    unsigned int dx4;
    unsigned int dx5;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int flags;

    loc_2 = arg_2;
    *(int *)((char *)&loc_4 + 0) = arg_0;
    loc_6 = arg_6;
    *(int *)((char *)&loc_8 + 0) = arg_4;
    loc_a = arg_10;
    *(int *)((char *)&loc_c + 0) = *(int *)((char *)&arg_8 + 0);
    bx = FP_OFF(loc_4);
    es = FP_SEG(loc_4);
    dx = *(int far *)MK_FP(es, bx + 6);
    bx2 = (int)loc_8;
    es2 = (int)(loc_8 >> 16);
    dx2 = dx + *(int far *)MK_FP(es2, bx2 + 6);
    bx3 = (int)arg_8;
    es3 = (int)(arg_8 >> 16);
    *(int far *)MK_FP(es3, bx3 + 8) = *(int far *)MK_FP(es, bx + 8) + *(int far *)MK_FP(es2, bx2 + 8) + (dx2 < dx);
    *(int far *)MK_FP(es3, bx3 + 6) = dx2;
    bx4 = FP_OFF(loc_4);
    es4 = FP_SEG(loc_4);
    dx3 = *(int far *)MK_FP(es4, bx4 + 2);
    bx5 = (int)loc_8;
    es5 = (int)(loc_8 >> 16);
    dx4 = dx3 + *(int far *)MK_FP(es5, bx5 + 2);
    bx6 = (int)loc_c;
    es6 = (int)(loc_c >> 16);
    *(int far *)MK_FP(es6, bx6 + 4) = *(int far *)MK_FP(es4, bx4 + 4) + *(int far *)MK_FP(es5, bx5 + 4) + (dx4 < dx3);
    *(int far *)MK_FP(es6, bx6 + 2) = dx4;
    es7 = (int)(loc_c >> 16);
    *(int far *)MK_FP(es7, (int)loc_c) = *loc_4;
    ax = (struct s1 near *)(B_7FCB << 2);
    loc_e = (int)(unsigned)ax;
    ax2 = ax->f_5e6;
    dx5 = ax->f_5e4;
    bx7 = *(int *)((char *)&loc_c + 0);
    flags = ax2 - *(int far *)MK_FP(es7, bx7 + 4);
    if (!CC(">", flags) && (CC("<", flags) || dx5 < (unsigned int)*(int far *)MK_FP(es7, bx7 + 2))) {
        bx8 = (struct s1 near *)loc_e;
        ax2 = bx8->f_5e6;
        dx5 = bx8->f_5e4;
        bx9 = (int)loc_c;
        es8 = (int)(loc_c >> 16);
        *(int far *)MK_FP(es8, bx9 + 2) = *(int far *)MK_FP(es8, bx9 + 2) - dx5;
        *(int far *)MK_FP(es8, bx9 + 4) = (int)(*(long far *)MK_FP(es8, bx9 + 2) - ((long)ax2 << 16 | (unsigned)dx5) >> 16);
        *(int far *)MK_FP(es8, bx9 + 6) = *(int far *)MK_FP(es8, bx9 + 6) + 1;
        *(int far *)MK_FP(es8, bx9 + 8) = (int)(*(long far *)MK_FP(es8, bx9 + 6) + 1L >> 16);
    }
    return ((long)dx5 << 16 | (unsigned)ax2);
}
