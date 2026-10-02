/* differs: 308 at +0, 84 bytes; 311 at +0, 84 bytes; 312 at +0, 84 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[6];
    int f_6;
    int f_8;
};
extern int near fn_fb5a1(void);

long near fn_fb555(void)
{
    int ax;
    int near *bx;
    struct s1 near *di;
    int es;
    int si;

    di->f_6 = (int)(unsigned)bx;
    si = (int)*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x3c));
    es = (int)(*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x3c)) >> 16);
    ax = 0;
    for (;;) {
        if ((*(int far *)MK_FP(es, si) & *(int far *)MK_FP(es, si + 2)) != -1) {
            *bx = 0;
            ax = ax + 1;
            bx = bx + 1;
            si = si + 4;
            continue;
        }
        break;
    }
    di->f_8 = ax;
    return ((long)UNDEF << 16 | (unsigned)fn_fb5a1());
}
int near fn_fb5a1(void) { return 0; }
