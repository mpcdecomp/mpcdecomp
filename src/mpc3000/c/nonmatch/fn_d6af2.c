/* differs: 308 at +0, 111 bytes; 311 at +0, 111 bytes; 312 at +0, 110 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_9782;
extern long far far_fb71b(void);

void near fn_d6af2(void)
{
    int cx;
    int dx;

    cx = UNDEF;
    dx = (int)(far_fb71b() >> 16);
    if (!CC("ns", UNDEF)) {
        if ((B_9782 & (char)(cx >> 8)) != 0) {
            cx = UNDEF;
            dx = (int)(far_fb71b() >> 16);
            if (!CC("s", UNDEF)) {
L1:
                outp(dx - 6, (char)cx);
            } else {
                B_9782 = (char)(B_9782 & ~(char)(cx >> 8));
            }
        }
    } else {
        goto L1;
    }
    return;
}
