/* differs: matches with the callees of its own source file beside it (the stubs) */
extern long far far_b8ff3(int, int, int);
extern long far fn_b8f7d(int, int, int, int);
long far far_b8ff3(int p0, int p1, int p2) { return 0; }
long far fn_b8f7d(int p0, int p1, int p2, int p3) { return 0; }

long far far_b9045(int arg_0, int arg_2, int arg_4, int arg_6)
{
    long t1;

    t1 = far_b8ff3(arg_0, arg_2, arg_4);
    return fn_b8f7d(arg_0, arg_2, arg_4 + 4, arg_6);
}
