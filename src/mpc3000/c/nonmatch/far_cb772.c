/* differs: 308 at +5, 409 bytes; 311 at +5, 408 bytes; 312 at +5, 408 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char f_0;
    char pad_1[1];
    char f_2;
};
extern char B_D4BE;
extern char B_E54C;
extern int FP_E40C;
extern int W_E40E;
extern long far far_c6547(int);
extern long far far_cb8a1(struct s1 far *);
extern long far far_cc71c(char, char, int);
extern long far fn_cb87a(int);

long far far_cb772(struct s1 far *arg_0, int arg_2)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int dx;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int flags;
    long t1;

    ax = (unsigned char)arg_0->f_0 & 248;
    flags = ax - 176;
    if (!CC("!=", flags)) {
        bx = FP_OFF(arg_0);
        es = FP_SEG(arg_0);
        if (*(char far *)MK_FP(es, bx + 2) == 7) {
            ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 3));
            B_E54C = (char)ax2;
            B_D4BE = (char)80;
            return ((long)dx << 16 | (unsigned)ax2);
        }
        goto L1;
    }
    if (!CC(">", flags)) {
        if (ax != 128) {
            if (ax != 144) {
                return ((long)dx << 16 | (unsigned)ax);
            }
            return far_cb8a1(arg_0);
        }
        bx2 = FP_OFF(arg_0);
        es2 = FP_SEG(arg_0);
        if ((unsigned char)*(char far *)MK_FP(es2, bx2 + 2) < 35) {
            goto L1;
        }
        if ((unsigned char)*(char far *)MK_FP(es2, bx2 + 2) > 98) {
            goto L1;
        }
        ax3 = ((char)(ax >> 8) << 8 | (unsigned char)arg_0->f_2);
        loc_6 = (unsigned char)(char)ax3;
        ax = (unsigned char)(char)ax3 * 24;
        dx = W_E40E;
        bx3 = FP_E40C + ax;
        loc_2 = dx;
        loc_4 = bx3 - 0x30a;
        es3 = loc_2;
        if (*(char far *)MK_FP(es3, bx3 - 0x30a) == -1) {
            goto L1;
        }
        if (*(char far *)MK_FP(es3, bx3 - 0x304) == 2) {
            return fn_cb87a(loc_6);
        }
        goto L1;
    }
    if (ax == 192) {
        return far_c6547((unsigned char)arg_0->f_2);
    }
    if (ax == 240) {
        if (arg_0->f_2 == 71) {
            bx4 = FP_OFF(arg_0);
            es4 = FP_SEG(arg_0);
            if (*(char far *)MK_FP(es4, bx4 + 5) == 69 || *(char far *)MK_FP(es4, bx4 + 5) == 70) {
                bx5 = FP_OFF(arg_0);
                es5 = FP_SEG(arg_0);
                ax4 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es5, bx5 + 8));
                t1 = far_cc71c(*(char far *)MK_FP(es5, bx5 + 7), *(char far *)MK_FP(es5, bx5 + 6), ax4);
                ax = (int)t1;
                dx = (int)(t1 >> 16);
            }
        }
L1:
        return ((long)dx << 16 | (unsigned)ax);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
long far fn_cb87a(int p0) { return 0; }
