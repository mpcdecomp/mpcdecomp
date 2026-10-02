/* differs: 308 absent; 311 at +0, 164 bytes; 312 at +0, 164 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far fn_f9ad8(void)
{
    int flags;

    _disable();
    *(int far *)MK_FP(0, 0x2c) = 0x204b;
    *(int far *)MK_FP(0, 0x2e) = 0xf800;
    *(int far *)MK_FP(0, 0x100) = 0x1b3a;
    *(int far *)MK_FP(0, 0x102) = 0xf800;
    *(int far *)MK_FP(0, 0x108) = 0x2062;
    *(int far *)MK_FP(0, 0x10a) = 0xf800;
    outp(162, (char)(inp(162) & -2));
    outp(-0x3fef, (char)(inp(-0x3fef) & -9));
    __insn("popf", __flags(flags));
    *(int far *)MK_FP(0x6dd, 0x2) = 0x20ac;
    *(char far *)MK_FP(0x6dd, 0x4) = (char)0;
    *(char far *)MK_FP(0x6dd, 0x5) = (char)0;
    *(char far *)MK_FP(0x6dd, 0x6) = (char)0;
    *(char far *)MK_FP(0x6dd, 0x7) = (char)0;
    *(char far *)MK_FP(0x6dd, 0x9) = (char)0;
    return -0x3fef0000L;
}
