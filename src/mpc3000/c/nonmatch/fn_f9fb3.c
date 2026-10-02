/* differs: 308 at +0, 11 bytes; 311 at +0, 11 bytes; 312 at +0, 11 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int near fn_f9fb6(void);

long far fn_f9fb3(void)
{
    return ((long)UNDEF << 16 | (unsigned)fn_f9fb6());
}
int near fn_f9fb6(void) { return 0; }
