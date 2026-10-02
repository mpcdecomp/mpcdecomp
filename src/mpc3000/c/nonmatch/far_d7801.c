/* differs: 308 at +1, 1 bytes; 311 at +1, 1 bytes; 312 at +1, 1 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long near fn_d77d8(void);
long near fn_d77d8(void) { return 0; }

long far far_d7801(void)
{
    return fn_d77d8();
}
