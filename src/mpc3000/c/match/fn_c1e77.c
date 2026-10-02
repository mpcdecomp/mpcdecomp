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

void far fn_c1e77(int arg_0, char arg_2)
{
    while ((inp(226) & -128) != 0) {
    }
    outp(226, *(char *)((char *)&arg_0 + 0));
    outp(224, arg_2);
    return;
}
