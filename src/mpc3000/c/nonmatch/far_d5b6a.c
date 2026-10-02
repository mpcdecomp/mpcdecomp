/* differs: 308 absent; 311 at +5, 114 bytes; 312 at +5, 114 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct g_TBL_7AD5 {
    int f_0;
};
struct g_TBL_7AD7 {
    int f_0;
};
extern char B_7AC3;
extern char B_7ACB;
extern char B_7AD0;
extern struct g_TBL_7AD5 TBL_7AD5;
extern struct g_TBL_7AD7 TBL_7AD7;
extern int W_7AD1;
extern int W_7AD3;
extern long far far_cab48(int);

long far far_d5b6a(unsigned int arg_0)
{
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int dx;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)B_7AD0);
    loc_2 = (unsigned char)(char)ax;
    if ((unsigned char)(char)ax < arg_0) {
        arg_0 = (unsigned char)(char)ax;
    }
    *(char far *)MK_FP(0, 0xfc) = *(char *)((char *)&arg_0 + 0);
    if (arg_0 != 0) {
        bx = arg_0 - 1 << 2;
        dx = *(int *)((char *)&TBL_7AD5 + 0 + bx);
        W_7AD3 = *(int *)((char *)&TBL_7AD7 + 0 + bx);
        W_7AD1 = dx;
    }
    B_7AC3 = *(char *)((char *)&arg_0 + 0);
    B_7ACB = (char)0;
    return (long)MK_FP((int)(far_cab48(arg_0) >> 16), arg_0);
}
