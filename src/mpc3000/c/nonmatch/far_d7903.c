/* differs: 308 at +0, 104 bytes; 311 at +0, 104 bytes; 312 at +0, 104 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int TBL_9784;

int far far_d7903(void)
{
    _disable();
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x6ae)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x6b0)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x6b2)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x736)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x738)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0x73a)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0xd33)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0xd35)) = 0;
    *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, (unsigned int)(unsigned)((char *)0xd37)) = 0;
    TBL_9784 = 0;
    __insn("popf", __flags(0));
    return 0;
}
