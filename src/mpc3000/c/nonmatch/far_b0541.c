/* differs: 308 at +0, 60 bytes; 311 at +0, 60 bytes; 312 at +0, 60 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern void far far_fb33d(void);

void far far_b0541(void)
{
    int t1;

    outp(-0x3fcd, (char)116);
    far_fb33d();
    outp(-0x3ff0, (char)97);
    outp(-0x3fef, (char)(inp(-0x3fef) & -3));
    outp(-0x3fcf, (char)-79);
    outp(-0x3fcf, (char)40);
    return;
}
