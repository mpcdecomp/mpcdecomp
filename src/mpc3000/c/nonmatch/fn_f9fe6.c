/* differs: 308 at +0, 3 bytes; 311 at +0, 3 bytes; 312 at +0, 3 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int near fn_f9fe9(void);

void far fn_f9fe6(void)
{
    int ax;

    fn_f9fe9();
    return;
}
int near fn_f9fe9(void) { return 0; }
