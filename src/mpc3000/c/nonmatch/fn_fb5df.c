/* differs: 308 at +0, 70 bytes; 311 at +0, 70 bytes; 312 at +0, 70 bytes */
#define UNDEF 0
extern int near fn_fb601(void);

int near fn_fb5df(void)
{
    int ax;
    int bx;
    int cx;
    int near *di;
    int dx;
    int es;
    int near *si;
    int t1;

    si = (int near *)*di;
    for (;;) {
        _disable();
        ax = *si & -0x7ffc;
        if (ax < 0) {
            break;
        }
        if (ax != 0) {
            t1 = fn_fb601();
            bx = UNDEF;
            cx = UNDEF;
            es = UNDEF;
            dx = UNDEF;
            if (!CC(">=u", UNDEF) && !CC("!=", UNDEF)) {
                *si = 2;
            }
        }
        _enable();
        si = si + 32;
    }
    _enable();
    return ax;
}
int near fn_fb601(void) { return 0; }
