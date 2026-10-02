/* differs: 308 at +0, 162 bytes; 311 at +0, 162 bytes; 312 at +0, 162 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int near fn_fb52d(void);

int far fn_fb4d2(void)
{
    int ax;
    int di;
    int ds;
    int flags;
    int p10;
    int si;

    di = (int)*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40));
    ds = (int)(*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40)) >> 16);
    si = *(int far *)MK_FP(ds, di + 10);
    p10 = __flags(flags);
    _disable();
    ax = -8;
    if (*(char far *)MK_FP(ds, si + 14) != 127) {
        ax = ax + 1;
        if ((char)(*(char far *)MK_FP(ds, si + 14) & -128) < 0) {
            *(char far *)MK_FP(ds, si + 14) = (char)(*(char far *)MK_FP(ds, si + 14) & 127);
            ax = fn_fb52d();
            if (!CC("s", UNDEF)) {
                ax = -7;
                if ((*(int far *)MK_FP(ds, si) & 8) != 0) {
                    *(int far *)MK_FP(ds, si) = 2;
                    if ((unsigned char)(char)UNDEF < (unsigned char)*(char far *)MK_FP(ds, di + 17)) {
                        *(char far *)MK_FP(ds, di + 17) = (char)UNDEF;
                    }
                    ax = 0;
                }
            }
        }
    }
    __insn("popf", p10);
    return ax;
}
int near fn_fb52d(void) { return 0; }
