/* differs: 308 at +0, 4 bytes; 311 at +0, 4 bytes; 312 at +0, 4 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int near fn_e7f0e(void);

void near fn_e7f07(void)
{
    int ax;

    fn_e7f0e();
    return;
}
int near fn_e7f0e(void) { return 0; }
