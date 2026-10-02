/* differs: 308 absent; 311 at +0, 80 bytes; 312 at +0, 80 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern long far far_fb71b(void);

int far far_d79ee(void)
{
    int ax;
    int bx;
    int cx;
    int dx;
    int es;
    long t1;

    ax = SEG_DATA;
    es = ax;
    bx = 0x12c6;
    for (;;) {
        if (*(int far *)MK_FP(es, bx + 2) == 0) {
            continue;
        }
        t1 = far_fb71b();
        bx = UNDEF;
        cx = UNDEF;
        es = UNDEF;
        ax = (int)t1;
        dx = (int)(t1 >> 16);
        if (CC("s", UNDEF)) {
            continue;
        }
        break;
    }
    return ((char)(ax >> 8) << 8 | (unsigned char)(char)cx);
}
