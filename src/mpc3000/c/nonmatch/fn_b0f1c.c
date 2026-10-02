/* differs: matches with the callees of its own source file beside it (the stubs) */
extern long far fn_b0f4b(long);
extern void far fn_b0f7e(long);
extern long far fn_b0f9e(long);

void far fn_b0f1c(int arg_0, int arg_2)
{
    long t1;
    long t2;
    int t3;

    t1 = fn_b0f4b(*(long *)((char *)&arg_0 + 0));
    t2 = fn_b0f9e(*(long *)((char *)&arg_0 + 0));
    fn_b0f7e(*(long *)((char *)&arg_0 + 0));
    return;
}
long far fn_b0f4b(long p0) { return 0; }
void far fn_b0f7e(long p0) { }
long far fn_b0f9e(long p0) { return 0; }
