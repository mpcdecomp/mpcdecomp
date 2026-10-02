/* differs: matches with the callees of its own source file beside it (the stubs) */
extern unsigned char B_901B[];
extern long far far_e3d12(unsigned char far *, long);
extern long far far_e562e(void);

long far far_e5612(int arg_0, int arg_2)
{
    long t1;

    t1 = far_e3d12((unsigned char far *)B_901B, *(long *)((char *)&arg_0 + 0));
    return far_e562e();
}
long far far_e562e(void) { return 0; }
