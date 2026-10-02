/* differs: 308 at +5, 63 bytes; 311 at +5, 63 bytes; 312 at +5, 63 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern int far far_b1ae0(int);
extern int far far_b1b2b(char far *, char far *);

int far far_b1f96(int arg_0)
{
    char loc_2;
    char loc_1[1];
    int ax;
    int ax2;

    ax = far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2));
    goto L1;
L2:
    ax = far_b1ae0(32);
L1:
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)loc_2);
    loc_2 = (char)(loc_2 + 1);
    if ((char)ax2 < arg_0) {
        goto L2;
    }
    return (char)ax2;
}
