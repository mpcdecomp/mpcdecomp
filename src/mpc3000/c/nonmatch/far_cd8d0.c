/* differs: matches with the callees of its own source file beside it (the stubs) */
struct g_FP_E40C {
    long f_0;
};
extern struct g_FP_E40C FP_E40C;
extern long far fn_cd837(int, long);
long far fn_cd837(int p0, long p1) { return 0; }

void far far_cd8d0(int arg_0, int arg_2, int arg_4)
{
    int dx;
    long t1;

    dx = -1;
    if (arg_0 >= 35 && arg_0 <= 98) {
        dx = (unsigned char)*(char far *)((char far *)FP_E40C.f_0 + -778 + arg_0 * 24);
    }
    t1 = fn_cd837(dx, *(long *)((char *)&arg_2 + 0));
    return;
}
