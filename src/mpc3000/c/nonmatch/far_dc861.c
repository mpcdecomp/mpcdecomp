/* differs: 308 at +5, 50 bytes; 311 at +5, 50 bytes; 312 at +5, 50 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_dc2b6(void);
extern long far far_dc2bf(char far *, int, int);
int far far_dc2b6(void) { return 0; }
long far far_dc2bf(char far *p0, int p1, int p2) { return 0; }

long far far_dc861(int arg_0)
{
    char loc_a[10];
    int ax;
    int dx;
    long t1;

    ax = far_dc2b6();
    dx = UNDEF;
    for (;;) {
        arg_0 = arg_0 - 1;
        if (arg_0 <= 0) {
            break;
        }
        t1 = far_dc2bf((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_a), 10, 0);
        ax = (int)t1;
        dx = (int)(t1 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
