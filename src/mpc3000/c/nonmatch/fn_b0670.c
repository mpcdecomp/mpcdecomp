/* differs: 308 at +5, 448 bytes; 311 at +5, 448 bytes; 312 at +5, 447 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_7B8E;
extern char far *FP_7B8F;
extern long far fn_b05ca(void);
extern long far fn_b05de(void);
extern long far fn_b0605(int);
long far fn_b05ca(void) { return 0; }
long far fn_b05de(void) { return 0; }
long far fn_b0605(int p0) { return 0; }

int far fn_b0670(int arg_0)
{
    char loc_1;
    char loc_2;
    char loc_3;
    char loc_4;
    char loc_5;
    char loc_6;
    char loc_7;
    int ax;
    int ax10;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx2;
    int bx3;
    int dx;
    int dx2;
    int dx3;
    int es;
    int es2;
    int es3;
    long t1;
    long t2;
    long t3;
    long t4;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)B_7B8D);
    loc_6 = (char)ax;
    bx = (int)*(long *)((char *)&FP_7B8F + 0);
    es = (int)(*(long *)((char *)&FP_7B8F + 0) >> 16);
    ax3 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 1));
    loc_1 = (char)ax3;
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 2));
    loc_3 = (char)ax4;
    loc_7 = (char)7;
    for (;;) {
        if (loc_7 == 7) {
            loc_2 = loc_3;
            do {
                if (arg_0 > 0) {
                    t1 = fn_b05de();
                    ax5 = (int)t1;
                } else {
                    t2 = fn_b05ca();
                    ax5 = (int)t2;
                }
                if (ax5 == 0) {
                    goto L1;
                }
                bx2 = (int)*(long *)((char *)&FP_7B8F + 0);
                es2 = (int)(*(long *)((char *)&FP_7B8F + 0) >> 16);
                ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es2, bx2 + 1));
            } while ((char)ax6 == loc_1);
            loc_4 = (char)ax6;
            loc_1 = (char)ax6;
            ax7 = ((char)(ax6 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es2, bx2 + 2));
            loc_3 = (char)ax7;
            ax8 = ((char)(ax7 >> 8) << 8 | (unsigned char)((char)ax7 - loc_2));
            loc_5 = (char)ax8;
            if (loc_5 < 0) {
                loc_5 = -(char)ax8;
            }
            B_7B8E = B_7B8D;
L1:
            loc_7 = *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0) + 3);
            for (;;) {
                if (arg_0 > 0) {
                    t3 = fn_b05de();
                    ax9 = (int)t3;
                    dx = (int)(t3 >> 16);
                } else {
                    t4 = fn_b05ca();
                    ax9 = (int)t4;
                    dx = (int)(t4 >> 16);
                }
                if (ax9 == 0 || *(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0) + 1) != loc_4) {
                    break;
                }
                dx2 = ((char)(dx >> 8) << 8 | (unsigned char)*(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0) + 2));
                dx3 = ((char)(dx2 >> 8) << 8 | (unsigned char)((char)dx2 - loc_2));
                if ((char)dx3 < 0) {
                    dx3 = ((char)(dx3 >> 8) << 8 | (unsigned char)-(char)dx3);
                }
                if ((char)dx3 < loc_5) {
                    B_7B8E = B_7B8D;
                    loc_5 = (char)dx3;
                    bx3 = (int)*(long *)((char *)&FP_7B8F + 0);
                    es3 = (int)(*(long *)((char *)&FP_7B8F + 0) >> 16);
                    loc_3 = *(char far *)MK_FP(es3, bx3 + 2);
                    loc_7 = *(char far *)MK_FP(es3, bx3 + 3);
                    continue;
                }
            }
            ax4 = (int)fn_b0605(B_7B8E);
            continue;
        }
        break;
    }
    ax10 = ((char)(ax4 >> 8) << 8 | (unsigned char)loc_6);
    B_7B8D = (char)ax10;
    return ax10;
}
