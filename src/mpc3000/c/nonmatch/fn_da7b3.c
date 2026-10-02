/* differs: 308 at +16, 24 bytes; 311 at +16, 24 bytes; 312 at +16, 24 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_D4B4;
extern long far far_b059a(int);
extern int far far_da76f(long, int);
extern int far far_e931c(void);
int far far_da76f(long p0, int p1) { return 0; }

void far fn_da7b3(void)
{
    int ax;
    int p4;
    int p6;
    int t1;
    long t2;

    ax = far_e931c();
    for (;;) {
        t2 = far_b059a(20);
        if (B_D4B4 == 0) {
            continue;
        }
        p4 = SEG_DATA;
        p6 = 0x715d;
        t1 = far_da76f(((long)p4 << 16 | (unsigned)p6), 0x6c2);
        B_D4B4 = (char)0;
    }
}
