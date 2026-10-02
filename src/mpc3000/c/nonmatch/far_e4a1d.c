/* differs: 308 at +12, 10 bytes; 311 at +12, 10 bytes; 312 at +12, 10 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_901B[];
extern int far fn_e4a31();

long far far_e4a1d(int arg_0)
{
    return ((long)UNDEF << 16 | (unsigned)fn_e4a31(arg_0, B_901B));
}
int far fn_e4a31(int p0, unsigned char near *p1) { return 0; }
