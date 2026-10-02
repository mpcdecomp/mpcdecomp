/* differs: 308 at +0, 23 bytes; 311 at +0, 23 bytes; 312 at +0, 23 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long near fn_f97cc(int);
extern long near fn_f9843(void);

long near fn_f971d(void)
{
    int cx;
    long t1;
    long t2;

    t1 = fn_f9843();
    cx = 0x140;
    do {
        t2 = fn_f97cc(cx);
        cx = cx - 1;
    } while (cx != 0);
    return fn_f9843();
}
long near fn_f97cc(int p0) { return 0; }
long near fn_f9843(void) { return 0; }
