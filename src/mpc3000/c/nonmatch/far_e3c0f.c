/* differs: 308 at +5, 241 bytes; 311 at +5, 240 bytes; 312 at +5, 241 bytes */
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
extern int W_87FE;
extern int W_9563;
extern long far far_e5a99(int, int);

long far far_e3c0f(struct s1 far *arg_0, int arg_2, int arg_4, int arg_6)
{
    int loc_2;
    int far *loc_4;
    int loc_6;
    char loc_7;
    long loc_8;
    int loc_a;
    int ax;
    unsigned int ax2;
    int ax3;
    int ax4;
    int bx;
    int dx;
    int es;
    long t1;

    loc_6 = arg_6;
    *(int *)((char *)&loc_8 + 0) = arg_4;
    loc_7 = (char)1;
    *(char *)((char *)&loc_8 + 0) = (char)0;
    if (arg_0->f_0 < 0) {
        goto L1;
    }
    if (W_9563 + 1 <= loc_6) {
        goto L2;
    }
L1:
    loc_6 = W_9563 + 1;
    return loc_8;
L2:
    if (arg_2 != SEG_DATA) {
        goto L3;
    }
    if (*(int *)((char *)&arg_0 + 0) != (unsigned int)(unsigned)B_901B) {
        goto L3;
    }
    if (B_8800 == 0) {
        goto L3;
    }
    loc_2 = SEG_DATA;
    *(int *)((char *)&loc_4 + 0) = -0x7a06;
    dx = W_87FE;
    goto L4;
L3:
    loc_2 = arg_2;
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&arg_0 + 0) + 0x29e;
    dx = arg_0->f_30;
L4:
    ax = dx + W_9563;
    loc_a = ax;
    if (ax >= loc_6) {
        goto L5;
    }
    loc_6 = ax + 1;
    return loc_8;
L5:
    t1 = far_e5a99(*(int *)((char *)&arg_0 + 0), arg_2);
    loc_6 = arg_6;
    *(int *)((char *)&loc_8 + 0) = arg_4;
    goto L6;
L7:
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 4;
L6:
    ax2 = *loc_4;
    if (ax2 <= (unsigned int)loc_6) {
        goto L7;
    }
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) - 4;
    bx = FP_OFF(loc_4);
    es = FP_SEG(loc_4);
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 2));
    ax4 = (int)(0x180L / (long)(signed char)*(char far *)MK_FP(es, bx + 3));
    if (loc_7 >= 1) {
        goto L8;
    }
    loc_7 = (char)1;
L8:
    if (loc_7 <= (char)ax3) {
        goto L9;
    }
    loc_7 = (char)ax3;
L9:
    if (*(char *)((char *)&loc_8 + 0) < ax4) {
        goto L10;
    }
    *(char *)((char *)&loc_8 + 0) = (char)((char)ax4 - 1);
L10:
    return loc_8;
}
