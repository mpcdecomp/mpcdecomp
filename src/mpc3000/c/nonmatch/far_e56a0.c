/* differs: 308 at +3, 116 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_8800;

long far far_e56a0(int arg_0, unsigned int arg_2, int arg_4, int arg_6, int arg_8, char arg_10)
{
    int ax;
    int bx2;
    int bx3;
    int bx4;
    int dx;

    if (arg_2 <= 0x3e7) {
        goto L1;
    }
    arg_2 = 0x3e7;
L1:
    ax = arg_4;
    dx = arg_6;
    if ((*(char *)((char *)&arg_0 + 0) & -128) == 0) {
        goto L2;
    }
    bx2 = arg_2 << 2;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx2 + 0x3be0) = ax;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx2 + 0x3be2) = dx;
    goto L3;
L2:
    if (B_8800 != 0) {
        goto L4;
    }
    bx3 = arg_2 << 2;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx3 + 0x2c40) = ax;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx3 + 0x2c42) = dx;
    goto L3;
L4:
    *(char far *)MK_FP(0x96e6 /* SEG_A8EC */, arg_2 + 0x5b20) = *(char *)((char *)&arg_8 + 0);
    *(char far *)MK_FP(0x96e6 /* SEG_A8EC */, arg_2 + 0x5f08) = arg_10;
    bx4 = arg_2 << 2;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx4 + 0x4b80) = ax;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx4 + 0x4b82) = dx;
L3:
    return ((long)dx << 16 | (unsigned)ax);
}
