/* differs: 308 at +0, 125 bytes; 311 at +0, 125 bytes; 312 at +0, 125 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int far far_d78c6(void)
{
    _disable();
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x1330)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x1332)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x1334)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x1932)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x1934)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x1936)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x1f34)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x1f36)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x1f38)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x2536)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x2538)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x253a)) = 0;
    __insn("popf", __flags(0));
    return 0;
}
