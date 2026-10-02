/* differs: 308 at +3, 407 bytes; 311 at +3, 410 bytes; 312 at +3, 412 bytes */
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
    char f_3;
};
extern char B_817F;
extern unsigned char B_8180;
extern char B_956B;
extern char B_D4BF;
extern char TBL_95EE[];
extern char TBL_966E[];
extern int far far_dab37(int);
extern int far far_dcead(struct s1 far *, int, int);

long far far_db113(struct s1 far *arg_0, int arg_2, int arg_4)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int bx;
    int bx2;
    int dx;
    int dx2;
    int es;
    int es2;
    int es3;
    int es4;
    int flags;
    int si;

    bx = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    if ((unsigned char)*(char far *)MK_FP(es, bx) <= 160) {
        if ((unsigned char)*(char far *)MK_FP(es, bx + 2) < 35) {
            goto L1;
        }
        if ((unsigned char)*(char far *)MK_FP(es, bx + 2) > 98) {
            goto L1;
        }
L2:
        ax = (unsigned char)arg_0->f_0;
        flags = ax - 160;
        if (!CC("!=", flags)) {
            ax2 = B_817F;
            if (ax2 == 0) {
                bx2 = FP_OFF(arg_0);
                es2 = FP_SEG(arg_0);
                ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es2, bx2 + 2));
                dx = ((char)(dx2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es2, bx2 + 3));
                TBL_966E[(unsigned char)(char)ax3] = (char)dx;
                return ((long)dx << 16 | (unsigned)(unsigned char)(char)ax3);
            }
            goto L1;
        }
        if (!CC(">", flags)) {
            if (ax != 128) {
                if (ax == 144) {
                    ax4 = ((char)(ax >> 8) << 8 | (unsigned char)arg_0->f_2);
                    if (B_817F != 0) {
                        ax5 = B_8180;
                    } else {
                        ax5 = (unsigned char)arg_0->f_3;
                    }
                    TBL_966E[(unsigned char)(char)ax4] = (char)ax5;
                    es3 = FP_SEG(arg_0);
                    TBL_95EE[(unsigned char)*(char far *)MK_FP(es3, FP_OFF(arg_0) + 2)] = (char)64;
                    B_D4BF = (char)far_dab37((unsigned char)*(char far *)MK_FP(es3, *(int *)((char *)&arg_0 + 0) + 2));
                }
            } else {
                es4 = FP_SEG(arg_0);
                TBL_966E[(unsigned char)*(char far *)MK_FP(es4, FP_OFF(arg_0) + 2)] = (char)0;
                *(char far *)MK_FP(es4, *(int *)((char *)&arg_0 + 0) + 3) = (char)64;
            }
            goto L3;
        }
        if (ax != 208) {
L3:
            ax2 = far_dcead(arg_0, arg_4, 2);
            dx2 = UNDEF;
            goto L1;
        }
        ax2 = B_817F;
        if (ax2 == 0) {
            si = 35;
            while (si <= 98) {
                if (TBL_966E[si] != 0) {
                    ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_956B);
                    TBL_966E[si] = (char)ax2;
                }
                si = si + 1;
            }
            return ((long)dx2 << 16 | (unsigned)ax2);
        }
L1:
        return ((long)dx2 << 16 | (unsigned)ax2);
    }
    goto L2;
}
