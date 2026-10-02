/* differs: 308 at +0, 142 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern int near fn_fb5df(void);
extern int near fn_fb601(void);
extern int far fn_fb60c(void);

long far L_fb5a8(void)
{
    int ax;
    int cx;
    int di;
    int ds;
    int dx;
    int p10;
    int p12;
    int p2;
    int p4;
    int p6;
    int p8;
    int si;
    int t1;

    di = (int)*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40));
    ds = (int)(*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40)) >> 16);
    ax = fn_fb5df();
    dx = UNDEF;
    si = (int)*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x3c));
    if (*(int far *)MK_FP(ds, di + 8) != 0) {
        do {
            cx = UNDEF;
            ax = fn_fb601();
            dx = UNDEF;
            _enable();
            if (!CC(">=u", UNDEF) && !CC("!=", UNDEF)) {
                p2 = UNDEF;
                p4 = ds;
                p6 = cx;
                p8 = UNDEF;
                p10 = si;
                p12 = 0xfb00;
                t1 = fn_fb60c();
                ax = t1;
                dx = UNDEF;
                _enable();
                si = p10;
                cx = p6;
                ds = p4;
            }
            si = si + 4;
        } while (cx != 1);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
int near fn_fb5df(void) { return 0; }
int near fn_fb601(void) { return 0; }
int far fn_fb60c(void) { return 0; }
