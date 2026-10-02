/* differs: 308 at +0, 51 bytes; 311 at +0, 51 bytes; 312 at +0, 51 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int near fn_d77fe(void);

int near fn_d77d8(void)
{
    int ax;
    int flags;
    int t1;
    int t2;

    _disable();
    t1 = fn_d77fe();
    t2 = fn_d77fe();
    __insn("popf", __flags(flags));
    if (((char)UNDEF << 8 | (unsigned char)(char)t2) != 255) {
        ax = 1;
    } else {
        ax = 0;
    }
    return ax;
}
int near fn_d77fe(void) { return 0; }
