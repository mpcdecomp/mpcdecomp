/* differs: 308 at +5, 315 bytes; 311 at +5, 315 bytes; 312 at +5, 313 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char f_0;
    char pad_1[47];
    int f_30;
};
extern char B_8800;
extern unsigned char B_901B[];
extern int W_9563;
extern long far far_e5a99(int, int);

long far far_dfdf5(struct s1 far *arg_0, int arg_2, int arg_4, int arg_6)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int far *loc_8;
    int loc_a;
    unsigned int loc_c;
    unsigned int loc_e;
    char loc_f;
    int loc_10;
    int ax;
    int ax2;
    int bx;
    unsigned int dx2;
    int dx3;
    int dx4;
    int es;
    int flags;

    loc_e = arg_6;
    loc_10 = arg_4;
    if (arg_0->f_0 < 0) {
        if (W_9563 + 1 != loc_e) {
            ax = 1;
        } else {
            ax = 0;
        }
        return ((long)arg_4 << 16 | (unsigned)ax);
    }
    loc_a = arg_0->f_30 + W_9563 + 1;
    loc_c = 0x100;
    ax2 = arg_6;
    dx2 = arg_4;
    flags = ax2 - loc_a;
    if (!CC("<", flags) && (CC(">", flags) || dx2 > loc_c)) {
        return ((long)dx2 << 16 | (unsigned)1);
    }
    dx3 = (int)(far_e5a99(*(int *)((char *)&arg_0 + 0), arg_2) >> 16);
    if (arg_2 == SEG_DATA && *(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B && B_8800 != 0) {
        loc_6 = SEG_DATA;
        *(int *)((char *)&loc_8 + 0) = -0x794e;
    } else {
        dx3 = *(int *)((char *)&arg_0 + 0) + 0x29e;
        loc_6 = arg_2;
        *(int *)((char *)&loc_8 + 0) = dx3;
    }
    while ((unsigned int)*loc_8 <= loc_e) {
        *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 4;
    }
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) - 4;
    bx = FP_OFF(loc_8);
    es = FP_SEG(loc_8);
    loc_2 = *(char far *)MK_FP(es, bx + 2);
    dx4 = (int)(0x180L % (long)(signed char)*(char far *)MK_FP(es, bx + 3));
    loc_4 = (int)(0x180L / (long)(signed char)*(char far *)MK_FP(es, bx + 3));
    if (loc_f < 1) {
        return ((long)dx4 << 16 | (unsigned)1);
    }
    if (loc_f > loc_2) {
        return ((long)dx4 << 16 | (unsigned)1);
    }
    if (*(char *)((char *)&loc_10 + 0) >= loc_4) {
        return ((long)dx4 << 16 | (unsigned)1);
    }
    return ((long)dx4 << 16 | (unsigned)0);
}
