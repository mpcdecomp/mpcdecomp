/* differs: 308 at +0, 57 bytes; 311 at +0, 57 bytes; 312 at +0, 57 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern void far far_cb737(int);
void far far_cb737(int p0) { }

void far far_cb74d(void)
{
    int ax;
    char t1;
    int t2;

    t1 = inp(250);
    far_cb737(0);
    outp(254, (char)-112);
    outp(252, (char)14);
    ax = inp(248) & 15;
    outp(254, (char)-128);
    outp(250, (char)UNDEF);
    return;
}
