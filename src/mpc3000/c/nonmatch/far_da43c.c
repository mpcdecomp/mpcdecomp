/* differs: 308 absent; 311 at +5, 184 bytes; 312 at +5, 184 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
struct s1 {
    char pad_0[5];
    int f_5;
};

long far far_da43c(struct s1 far *arg_0, int arg_2, unsigned int arg_4, int arg_6)
{
    char far *loc_4;
    int loc_2;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int es;
    int es2;
    int es3;
    int es4;

    loc_2 = arg_6;
    *(int *)((char *)&loc_4 + 0) = arg_4;
    bx = FP_OFF(loc_4);
    es = FP_SEG(loc_4);
    if ((*(char far *)MK_FP(es, bx) & -128) == 0) {
        goto L1;
    }
    ax2 = ((char)(arg_6 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx));
    bx2 = FP_OFF(arg_0);
    es2 = FP_SEG(arg_0);
    *(char far *)MK_FP(es2, bx2) = (char)ax2;
    *(char far *)MK_FP(es2, bx2 + 1) = (char)ax2;
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
    goto L2;
L1:
    bx3 = FP_OFF(arg_0);
    es3 = FP_SEG(arg_0);
    *(char far *)MK_FP(es3, bx3) = *(char far *)MK_FP(es3, bx3 + 1);
L2:
    bx4 = FP_OFF(arg_0);
    *(char far *)MK_FP(FP_SEG(arg_0), bx4 + 3) = *loc_4;
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
    es4 = arg_2;
    if (((unsigned char)*(char far *)MK_FP(es4, bx4) & 96) == 64) {
        goto L3;
    }
    *(int far *)MK_FP(es4, bx4 + 5) = 2;
    *(char far *)MK_FP(es4, bx4 + 4) = *loc_4;
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
    goto L4;
L3:
    arg_0->f_5 = 1;
L4:
    return (unsigned long)(unsigned int)*(int *)((char *)&loc_4 + 0) - (unsigned long)(unsigned int)arg_4;
}
