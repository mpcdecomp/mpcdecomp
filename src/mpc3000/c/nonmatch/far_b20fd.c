/* differs: 308 match; 311 at +19, 2 bytes; 312 at +19, 2 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b2121(void);
extern int far far_b2134(void);
extern int far far_b2190(void);
extern long far far_b21f5(void);
extern int far far_da76f(void far *, int);

void far far_b20fd(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    long t1;

    far_b2121();
    far_b2134();
    far_b2190();
    t1 = far_b21f5();
    far_da76f(MK_FP(SEG_DATA, 0x715d), 0x6c2);
    return;
}
int far far_b2121(void) { return 0; }
int far far_b2134(void) { return 0; }
int far far_b2190(void) { return 0; }
long far far_b21f5(void) { return 0; }
