/* differs: 308 at +5, 366 bytes; 311 at +5, 367 bytes; 312 at +5, 367 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8B;
extern int FP_7B55;
extern char TBL_79A5[];
extern int W_7B57;
extern long far far_b2739(char far *);
extern long far far_e201c(int, char far *);

long far far_b2850(char arg_0)
{
    char loc_1a[26];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx2;
    int cx;
    int dx;
    int dx2;
    int es;
    int es2;
    int flags;
    long t1;
    long t2;

    cx = 0;
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)arg_0);
    if ((TBL_79A5[(char)ax] & 2) != 0) {
        return ((long)dx << 16 | (unsigned)0);
    }
    B_7B8B = (char)21;
    dx2 = FP_7B55;
    *(int *)((char *)&loc_1a + 24) = W_7B57;
    *(int *)((char *)&loc_1a + 22) = dx2;
    flags = (char)ax - 46;
    if (CC("!=", flags)) {
        if (!CC(">", flags)) {
            if ((char)ax != 43) {
                if ((char)ax != 45) {
                    goto L1;
                }
                bx = (int)*(long *)((char *)&loc_1a + 22);
                es = (int)(*(long *)((char *)&loc_1a + 22) >> 16);
                ax3 = ((char)-((char)ax < 0) << 8 | (unsigned char)*(char far *)MK_FP(es, bx));
                *(char far *)MK_FP(es, bx) = (char)((char)ax3 - 1);
                if ((unsigned char)((char)ax3 - 1) >= 138) {
                    *(char far *)MK_FP(es, bx) = (char)0;
                }
                t1 = far_e201c((unsigned char)*(char far *)((char far *)*(long *)((char *)&loc_1a + 22)), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a));
                dx2 = (int)(far_b2739((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a)) >> 16);
                cx = -0x8000;
            } else {
                bx2 = (int)*(long *)((char *)&loc_1a + 22);
                es2 = (int)(*(long *)((char *)&loc_1a + 22) >> 16);
                ax4 = ((char)-((char)ax < 0) << 8 | (unsigned char)*(char far *)MK_FP(es2, bx2));
                *(char far *)MK_FP(es2, bx2) = (char)((char)ax4 + 1);
                if ((unsigned char)((char)ax4 + 1) >= 138) {
                    *(char far *)MK_FP(es2, bx2) = (char)-119;
                }
                t2 = far_e201c((unsigned char)*(char far *)((char far *)*(long *)((char *)&loc_1a + 22)), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a));
                dx2 = (int)(far_b2739((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a)) >> 16);
                cx = -0x8000;
            }
        } else if ((char)ax == 60) {
            cx = 0x400;
        } else if ((char)ax != 62) {
L1:
            cx = (char)ax;
        } else {
            cx = 0x800;
        }
    }
    return ((long)dx2 << 16 | (unsigned)cx);
}
