/* differs: 308 at +3C, 9 bytes; 311 at +3C, 9 bytes; 312 at +3C, 9 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_83CF;
extern char B_8805;
extern unsigned char B_8C41[];
extern int far far_d7b8f(int, int);
extern int far far_e0031(unsigned char far *);
extern long far far_e51be(unsigned char far *, int, int);
extern long far far_e562e(void);

long far far_deeab(void)
{
    int ax;
    int ax2;
    long t1;

    if (B_8805 == 0) {
        ax = far_e0031((unsigned char far *)B_8C41);
    } else {
        t1 = far_e51be((unsigned char far *)B_8C41, B_83CF, 1);
        ax2 = (int)far_e562e();
    }
    return ((long)UNDEF << 16 | (unsigned)far_d7b8f(1, B_8805));
}
