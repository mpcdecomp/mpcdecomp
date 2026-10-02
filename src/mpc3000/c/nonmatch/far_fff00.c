/* differs: 308 at +0, 78 bytes; 311 at +0, 78 bytes; 312 at +0, 78 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_fac00(void);

long far far_fff00(void)
{
    outp(-22, (char)7);
    outp(-13, (char)0);
    outp(-19, (char)0);
    outp(-20, (char)2);
    outp(-21, (char)17);
    outp(-12, (char)17);
    outp(-11, (char)49);
    outp(-10, (char)49);
    outp(-14, (char)-112);
    return far_fac00();
}
