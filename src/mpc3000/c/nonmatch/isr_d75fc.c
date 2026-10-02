/* differs: 308 at +0, 49 bytes; 311 at +0, 49 bytes; 312 at +0, 49 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_fb14d(void);
extern int far far_fb18a(void);
extern long near fn_d7625(void);

long interrupt far isr_d75fc(void)
{
    long t1;
    long t2;
    long t3;

    t1 = far_fb14d();
    _enable();
    t2 = fn_d7625();
    _disable();
    outp(-0x3ff0, (char)97);
    t3 = far_fb18a();
    return 0L;
}
long near fn_d7625(void) { return 0; }
