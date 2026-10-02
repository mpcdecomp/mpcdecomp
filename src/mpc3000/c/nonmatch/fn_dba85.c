/* differs: 308 at +0, 4 bytes; 311 at +0, 4 bytes; 312 at +0, 4 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long near fn_dba91(void);

long far fn_dba85(void)
{
    return fn_dba91();
}
long near fn_dba91(void) { return 0; }
