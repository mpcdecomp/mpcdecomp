/* differs: 308 at +0, 52 bytes; 311 at +0, 52 bytes; 312 at +0, 52 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern void near fn_f98ca(void);

int near fn_f987f(void)
{
    int ax;
    int ax2;
    int cx;
    int es;
    int si;
    int si2;
    int t1;

    for (;;) {
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si));
        si2 = si + 1;
        if ((char)ax2 == 0) {
            break;
        }
        fn_f98ca();
        ax = UNDEF;
        es = es;
        cx = cx;
        si = si2;
    }
    return ax2;
}
void near fn_f98ca(void) { }
