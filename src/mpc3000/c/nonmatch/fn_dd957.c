/* differs: 308 at +6, 3 bytes; 311 at +6, 3 bytes; 312 at +6, 3 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8800;
extern char B_901B;
extern char B_9455;

void near fn_dd957(void)
{
    if (B_9455 == 0 && (B_8800 != 0 || B_901B != -1)) {
        return;
    }
    return;
}
