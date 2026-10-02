/* differs: 308 at +5, 104 bytes; 311 at +5, 104 bytes; 312 at +5, 104 bytes */
struct s1 {
    char pad_0[3];
    char f_3;
    char pad_4[7];
    int f_b;
};
struct g_FP_7B8F {
    long f_0;
    char pad_4[5];
    int f_9;
};
extern char B_7B8D;
extern struct g_FP_7B8F FP_7B8F;
extern int W_7B91;
extern long far fn_b0605(int);
long far fn_b0605(int p0) { return 0; }

long far far_b1206(int arg_0, int arg_2, int arg_4)
{
    struct s1 far *loc_4;
    int loc_2;
    int ax;
    int dx;
    long t1;

    t1 = fn_b0605(arg_0);
    ax = (int)t1;
    dx = (int)(t1 >> 16);
    if (*(char far *)((char far *)FP_7B8F.f_0) != 0) {
        ax = B_7B8D;
        if (ax == arg_0) {
            ax = W_7B91;
            dx = *(int *)((char *)&FP_7B8F + 0);
            loc_2 = ax;
            *(int *)((char *)&loc_4 + 0) = dx;
            if ((loc_4->f_3 & 15) == 0) {
                *(int far *)((char far *)FP_7B8F.f_0 + 9) = arg_2;
                ax = arg_4;
                loc_4->f_b = ax;
            }
        }
    }
    return ((long)dx << 16 | (unsigned)ax);
}
