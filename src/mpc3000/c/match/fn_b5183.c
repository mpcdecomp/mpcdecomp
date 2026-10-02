#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
unsigned char __inportb__(unsigned);
unsigned __inportw__(unsigned);
unsigned char __outportb__(unsigned, unsigned char);
unsigned __outportw__(unsigned, unsigned);
#define inp(p) __inportb__(p)
#define outp(p, v) __outportb__(p, (unsigned char)(v))
#define inpw(p) __inportw__(p)
#define outpw(p, v) __outportw__(p, v)

void far fn_b5183(int arg_0, int far *arg_2, int far *arg_6, int far *arg_10, int far *arg_14)
{
    outpw(96, arg_0 + 0x300);
    *arg_6 = inpw(98);
    *arg_2 = inpw(100);
    outpw(96, arg_0 + 0x400);
    *arg_14 = inpw(98);
    *arg_10 = inpw(100);
    return;
}
