/* differs: matches with the callees of its own source file beside it (the stubs) */
extern char B_D4B5;
extern long far fn_c19cd(int, int, int);
extern long far fn_c1a6d(int, int, int);
long far fn_c19cd(int p0, int p1, int p2) { return 0; }
long far fn_c1a6d(int p0, int p1, int p2) { return 0; }

void far fn_c1b13(int arg_0, int arg_2, int arg_4)
{
    long t1;
    long t2;

    if (*(char *)((char *)&arg_0 + 0) != 43) {
        goto L1;
    }
    t1 = fn_c1a6d(arg_4, B_D4B5, arg_2);
    return;
L1:
    t2 = fn_c19cd(arg_4, B_D4B5, arg_2);
    return;
}
