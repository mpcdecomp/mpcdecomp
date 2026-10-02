#pragma option -k-
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
extern char B_F762;

void far far_eb837(void)
{
    outp(80, (char)(B_F762 | 8));
    outp(80, B_F762);
    return;
}
