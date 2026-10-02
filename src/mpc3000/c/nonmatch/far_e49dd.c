/* differs: 308 at +3, 75 bytes; 311 at +3, 74 bytes; 312 at +3, 74 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct g_W_8C35 {
    long f_0;
    char pad_4[25];
    int f_1d;
};
extern char B_8A9F;
extern char B_901B;
extern struct g_W_8C35 W_8C35;
extern int W_904B;
extern long far far_e259f(int);

long far far_e49dd(int arg_0)
{
    long t1;

    if (B_8A9F != arg_0) {
        goto L1;
    }
    if (B_901B < 0) {
        goto L1;
    }
    return ((long)arg_0 << 16 | (unsigned)W_904B);
L1:
    t1 = far_e259f(arg_0);
    if ((int)t1 == 0) {
        goto L2;
    }
    return (long)MK_FP((int)(t1 >> 16), 0);
L2:
    return (long)MK_FP((int)(t1 >> 16), *(int far *)((char far *)W_8C35.f_0 + 29));
}
