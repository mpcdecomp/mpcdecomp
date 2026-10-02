/* differs: 308 at +3, 41 bytes; 311 at +3, 41 bytes; 312 at +3, 41 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_D4C1;
extern int far far_dac6a(void);

void far far_d7b6a(long arg_0)
{
    int ax;
    int bx;
    int es;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    if ((*(char far *)MK_FP(es, bx) & -8) == -112) {
        B_D4C1 = *(char far *)MK_FP(es, bx + 2);
        ax = far_dac6a();
    }
    return;
}
