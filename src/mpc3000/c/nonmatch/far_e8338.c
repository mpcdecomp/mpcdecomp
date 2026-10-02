/* differs: 308 at +0, 44 bytes; 311 at +0, 44 bytes; 312 at +0, 44 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int W_7384;
extern long near fn_e7fcd(void);
extern long far fn_e8093(void);
extern int near fn_e80bc(void);
extern int near fn_e80f2(void);
long near fn_e7fcd(void) { return 0; }
long far fn_e8093(void) { return 0; }
int near fn_e80bc(void) { return 0; }
int near fn_e80f2(void) { return 0; }

void far far_e8338(void)
{
    int ax;
    long t1;
    long t2;

    t1 = fn_e8093();
    while ((W_7384 & -0x8000) == 0) {
    }
    ax = fn_e80bc();
    if (CC("<u", UNDEF) || CC("<u", UNDEF) || ((char)fn_e80f2() & 32) == 0) {
        t2 = fn_e7fcd();
    }
    return;
}
