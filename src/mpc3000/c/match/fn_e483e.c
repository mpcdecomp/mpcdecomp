#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8805;
extern char B_9562;
extern char B_F744;
extern int W_9563;
extern int far far_d7b8f(int, int);
extern long far far_deeab(void);
extern int far far_e1e11(int);
extern int far far_e59bd(void);

void far fn_e483e(void)
{
    int ax;
    int ax2;
    long t1;
    int t2;
    long t3;

    far_d7b8f(0, 0);
    far_e1e11(0);
    B_9562 = (char)0;
    W_9563 = 0;
    t1 = far_deeab();
    t2 = far_e59bd();
    B_8805 = B_F744;
    t3 = far_deeab();
    return;
}
