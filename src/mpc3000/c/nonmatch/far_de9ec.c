/* differs: 308 absent; 311 absent; 312 at +0, 65 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern void far far_fb45f(void);

void far far_de9ec(void)
{
    int flags;
    int p4;
    int t1;

    p4 = __flags(flags);
    _disable();
    if (*(int far *)MK_FP(0xa8ec /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x1330)) + *(int far *)MK_FP(0xa8ec /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x1932)) + *(int far *)MK_FP(0xa8ec /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x1f34)) + *(int far *)MK_FP(0xa8ec /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x2536)) != 0) {
        far_fb45f();
    }
    __insn("popf", p4);
    return;
}
