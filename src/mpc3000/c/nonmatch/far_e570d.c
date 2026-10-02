/* differs: 308 at +3, 90 bytes; 311 at +3, 90 bytes; 312 at +3, 90 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8800;

long far far_e570d(int arg_0, int arg_2)
{
    int ax;
    int bx2;
    int dx;

    if (arg_2 > 0x3e7) {
        arg_2 = 0x3e7;
    }
    bx2 = arg_2 << 2;
    if ((*(char *)((char *)&arg_0 + 0) & -128) != 0) {
        ax = *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx2 + 0x3be0);
        dx = *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx2 + 0x3be2);
    } else if (B_8800 == 0) {
        ax = *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx2 + 0x2c40);
        dx = *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx2 + 0x2c42);
    } else {
        ax = *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx2 + 0x4b80);
        dx = *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx2 + 0x4b82);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
