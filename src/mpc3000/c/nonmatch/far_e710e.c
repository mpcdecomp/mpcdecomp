/* differs: 308 at +3, 154 bytes; 311 at +3, 154 bytes; 312 at +3, 154 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7FCB;
extern char B_7FCC;
extern char B_8802;
extern char B_901B;
extern char B_D60A;
extern int W_7FC8;
extern int W_8A98;
extern char far *W_901D;
extern int W_D610;
extern int W_D651;
extern int W_D653;
extern long far far_de78c(void);
extern long far far_de7ae(int, int, int);
extern int far far_de88f(int, int, int);
extern long far far_fa0c8(int, int, int);

long far far_e710e(int arg_0, int arg_2)
{
    int ax;
    int dx;
    long t1;
    long t2;
    int t3;
    long t4;

    if (B_D60A == 0) {
        t1 = far_fa0c8((int)far_de7ae(arg_0, arg_2, B_7FCB), W_D610, 0);
        t2 = t1 + 0x800L >> 12;
        W_D653 = (int)t2;
        t3 = far_de88f((int)t2, 0, 0);
        W_D651 = t3;
        if (B_7FCC != 0) {
            W_8A98 = t3;
            B_8802 = (char)0;
            if (B_901B >= 0) {
                *(int far *)((char far *)*(long *)((char *)&W_901D + 0) + 35) = t3;
            }
        } else {
            W_7FC8 = W_D651;
        }
        t4 = far_de78c();
        ax = (int)t4;
        dx = (int)(t4 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
