/* differs: matches with the callees of its own source file beside it (the stubs) */
extern long far far_d555b(int, long, int, int, int, int);
long far far_d555b(int p0, long p1, int p2, int p3, int p4, int p5) { return 0; }

long far far_d567e(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8, int arg_10)
{
    return far_d555b(arg_0, *(long *)((char *)&arg_2 + 0), arg_6, arg_8, arg_10, 10);
}
