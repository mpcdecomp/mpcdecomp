/* differs: 308 at +5, 347 bytes; 311 at +5, 348 bytes; 312 at +5, 348 bytes */
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
extern long far far_b2739(long);
extern long far far_b2da1(int);

long far far_b2cd7(char arg_0)
{
    int loc_2;
    char far *loc_4;
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
    dx2 = FP_7B55;
    loc_2 = W_7B57;
    *(int *)((char *)&loc_4 + 0) = dx2;
    B_7B8B = (char)9;
    flags = (char)ax - 46;
    if (CC("!=", flags)) {
        if (!CC(">", flags)) {
            if ((char)ax != 43) {
                if ((char)ax != 45) {
                    goto L1;
                }
                bx = FP_OFF(loc_4);
                es = FP_SEG(loc_4);
                ax3 = ((char)-((char)ax < 0) << 8 | (unsigned char)*(char far *)MK_FP(es, bx));
                *(char far *)MK_FP(es, bx) = (char)((char)ax3 - 1);
                if ((unsigned char)((char)ax3 - 1) >= 128) {
                    *(char far *)MK_FP(es, bx) = (char)0;
                }
                t1 = far_b2da1((unsigned char)*loc_4);
                dx2 = (int)(far_b2739(t1) >> 16);
                cx = -0x8000;
            } else {
                bx2 = FP_OFF(loc_4);
                es2 = FP_SEG(loc_4);
                ax4 = ((char)-((char)ax < 0) << 8 | (unsigned char)*(char far *)MK_FP(es2, bx2));
                *(char far *)MK_FP(es2, bx2) = (char)((char)ax4 + 1);
                if ((unsigned char)((char)ax4 + 1) >= 128) {
                    *(char far *)MK_FP(es2, bx2) = (char)127;
                }
                t2 = far_b2da1((unsigned char)*loc_4);
                dx2 = (int)(far_b2739(t2) >> 16);
                cx = -0x8000;
            }
        } else if ((char)ax != 60) {
            if ((char)ax != 62) {
L1:
                cx = (char)ax;
            } else {
                cx = 0x800;
            }
        } else {
            cx = 0x400;
        }
    }
    return ((long)dx2 << 16 | (unsigned)cx);
}
long far far_b2da1(int p0) { return 0; }
