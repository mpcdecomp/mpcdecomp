/* differs: matches with the callees of its own source file beside it (the stubs) */
extern long far fn_c01aa(int, int);

long far fn_c0194(int arg_0)
{
    return fn_c01aa(1 - arg_0, 1);
}
long far fn_c01aa(int p0, int p1) { return 0; }
