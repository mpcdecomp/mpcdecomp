/* differs: 308 at +0, 30 bytes; 311 at +0, 30 bytes; 312 at +0, 30 bytes */
extern int W_93F5;
extern long far far_dade6(void);
extern long far far_dae36(void);

long far fn_c8a20(void)
{
    long t1;
    long t2;

    t1 = far_dade6();
    t2 = far_dae36();
    W_93F5 = 0;
    return t2;
}
