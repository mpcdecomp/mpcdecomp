/* differs: 308 at +6, 48 bytes; 311 at +6, 48 bytes; 312 at +6, 48 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_d79ee(void);
extern long far far_d7a63(char);

long far far_b3dda(void)
{
    int loc_2;
    int dx;

    for (;;) {
        dx = UNDEF;
        loc_2 = far_d79ee();
        if (loc_2 == 77) {
            break;
        }
        if (loc_2 == 120) {
            goto L1;
        }
    }
    dx = (int)(far_d7a63(*(char *)((char *)&loc_2 + 0)) >> 16);
L1:
    return ((long)dx << 16 | (unsigned)loc_2);
}
