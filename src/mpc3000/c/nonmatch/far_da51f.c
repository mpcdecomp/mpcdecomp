/* differs: 308 absent; 311 at +5, 146 bytes; 312 at +5, 146 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
struct s1 {
    char pad_0[2];
    char f_2;
    char f_3;
};

long far far_da51f(struct s1 far *arg_0, char far *arg_4, int arg_6)
{
    char far *loc_4;
    int loc_2;
    int ax2;
    int ax3;
    int bx;
    int bx2;
    int es;
    int es2;

    loc_2 = arg_6;
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&arg_4 + 0);
    bx = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    ax2 = ((char)(arg_6 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 2));
    if ((char)ax2 != *(char far *)MK_FP(es, bx)) {
        ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx));
        *arg_4 = (char)ax3;
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
        arg_0->f_2 = (char)ax3;
    }
    *loc_4 = arg_0->f_3;
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
    bx2 = FP_OFF(arg_0);
    es2 = FP_SEG(arg_0);
    if (*(int far *)MK_FP(es2, bx2 + 5) == 2) {
        *loc_4 = *(char far *)MK_FP(es2, bx2 + 4);
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
    }
    return (unsigned long)(unsigned int)*(int *)((char *)&loc_4 + 0) - (unsigned long)(unsigned int)*(int *)((char *)&arg_4 + 0);
}
