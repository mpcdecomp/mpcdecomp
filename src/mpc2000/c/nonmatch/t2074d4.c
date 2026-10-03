/* differs: 150 size 62, image 50; +3 image `push di` CL `push si`; 172 size 62, image 50; +3 image `push di` CL `push si` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define UNDEF 0

void __far __pascal sample_desc_init(int arg_2, int arg_0)
{
    int dx;
    int si;

    si = arg_0;
    dx = arg_2;
    __stos2(((long)dx << 16 | (unsigned)si), 0, 54);
    *(char far *)MK_FP(dx, si + 17) = (char)100;
    *(int far *)MK_FP(dx, si + 48) = 0x7fff;
    *(char far *)MK_FP(dx, si + 37) = (char)1;
    *(int far *)MK_FP(dx, si + 38) = -0x53bc;
    return;
}
