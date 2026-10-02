/* differs: 308 at +0, 8 bytes; 311 at +0, 8 bytes; 312 at +0, 8 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_fb38c(void);
extern int near fn_fb5a1(void);
long far far_fb38c(void) { return 0; }

void far fn_fb596(void)
{
    int ax;
    long t1;

    t1 = far_fb38c();
    fn_fb5a1();
    return;
}
int near fn_fb5a1(void) { return 0; }
