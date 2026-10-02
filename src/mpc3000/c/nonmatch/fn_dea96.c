/* differs: 308 at +0, 43 bytes; 311 at +0, 43 bytes; 312 at +0, 43 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_D4BC;
extern int far far_dac6a(void);
extern int far far_fb47a(void);

long far fn_dea96(void)
{
    int ax;
    int dx;
    int t1;

    ax = far_fb47a();
    dx = UNDEF;
    for (;;) {
        if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D4BC) != 0) {
            t1 = far_dac6a();
            ax = far_fb47a();
            dx = UNDEF;
            continue;
        }
        break;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
