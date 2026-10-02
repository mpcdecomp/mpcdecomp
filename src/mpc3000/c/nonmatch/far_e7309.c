/* differs: 308 at +4, 43 bytes; 311 at +4, 43 bytes; 312 at +4, 42 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9F;
extern char B_901B;
extern long far far_e726e(int, int);
long far far_e726e(int p0, int p1) { return 0; }

void far far_e7309(int arg_0, int arg_2)
{
    (int)far_e726e(arg_0, arg_2) < 0 && B_8A9F == arg_0 && B_901B >= 0;
    return;
}
