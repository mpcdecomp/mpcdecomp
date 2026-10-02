/* differs: 308 at +1, 16 bytes; 311 at +1, 16 bytes; 312 at +1, 16 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_cb6bd(void);
extern long near fn_e813a(void);

void near fn_e8129(void)
{
    long t1;
    long t2;

    t1 = fn_e813a();
    outp(-0x3ff6, (char)68);
    t2 = far_cb6bd();
    return;
}
long near fn_e813a(void) { return 0; }
