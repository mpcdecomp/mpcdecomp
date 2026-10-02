/* differs: 308 at +0, 62 bytes; 311 at +0, 62 bytes; 312 at +0, 62 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void near fn_e7f0e(void)
{
    int ax;
    int ax2;
    int ax3;
    int es;
    int near *si;
    int near *si2;
    int near *si3;

    si = (int near *)ax;
    for (;;) {
        ax2 = *si;
        si2 = si + 1;
        if (ax2 == 0) {
            break;
        }
        *(char far *)MK_FP(es, ax2) = *(char *)((char near *)si2);
        si = si2 + 1;
    }
    for (;;) {
        ax3 = *si2;
        si3 = si2 + 1;
        if (ax3 == 0) {
            break;
        }
        *(int far *)MK_FP(es, ax3) = *si3;
        si2 = si3 + 1;
    }
    return;
}
