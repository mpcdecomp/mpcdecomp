/* differs: 308 at +5, 575 bytes; 311 at +5, 576 bytes; 312 at +5, 575 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_96EE;
extern char B_F22C;
extern char B_F22D;
extern unsigned char B_F234;
extern char B_F235;
extern unsigned char B_F77B;
extern char B_F77D;
extern unsigned char B_F77E[];
extern char TBL_F779;
extern char TBL_F77A[];
extern unsigned char TBL_c9353[];
extern unsigned char TBL_c935d[];
extern int W_93F5;
extern char W_F22E;
extern int W_F236;
extern int W_F238;
extern int W_F23A;
extern long far far_b1073(void);
extern long far far_b9045(int, int, int);
extern int far far_da970(void);
extern int far far_daabc(void);
extern int far far_de4c2(char near *);

int far far_c9197(void)
{
    int loc_2;
    int far *loc_4;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    unsigned int bx;
    unsigned int bx2;
    unsigned int cx;
    int cx2;
    int di;
    int t1;
    int t2;
    int t3;
    int t4;

    ax = far_de4c2(&TBL_F779) - 1;
    bx = ax;
    if (bx > 6) {
        goto L1;
    }
    switch ((unsigned int)(unsigned)(TBL_c935d + (bx << 1))) {
    case 0:
        if (B_96EE != 0) {
            ax = B_7B8D;
            bx2 = ax;
            if (bx2 > 4) {
                goto L1;
            }
            switch ((unsigned int)(unsigned)(TBL_c9353 + (bx2 << 1))) {
            case 0:
                return (int)far_b9045(B_F77B, 1, 5);
            case 1:
                return ax;
            case 2:
                t3 = far_da970();
                TBL_F779 = (char)(TBL_F779 & -4 | B_F22C);
                return (int)far_b1073();
            case 3:
                ax6 = ((char)(ax >> 8) << 8 | (unsigned char)W_F22E);
                B_F77D = (char)ax6;
                return ax6;
            case 4:
                loc_2 = SEG_DATA;
                *(int *)((char *)&loc_4 + 0) = (int)(unsigned)B_F77E;
                t2 = far_daabc();
                *loc_4 = t2;
                return t2;
            }
        } else {
            if (B_7B8D != 3) {
                return B_7B8D;
            }
            loc_2 = SEG_DATA;
            *(int *)((char *)&loc_4 + 0) = (int)(unsigned)B_F77E;
            t4 = far_daabc();
            *loc_4 = t4;
            return t4;
        }
    case 1:
    case 4:
        goto L1;
    case 2:
        if (B_7B8D != 0) {
            goto L1;
        }
        if (B_F234 < 9) {
            B_F234 = (unsigned char)9;
        }
        if (B_F234 > 136) {
            B_F234 = (unsigned char)-120;
        }
        B_F77B = (unsigned char)(B_F234 - 9);
        return (int)far_b1073();
    case 3:
        ax4 = ((char)(ax >> 8) << 8 | (unsigned char)B_F22D);
        ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 - 1));
        B_F77B = (char)ax5;
        return ax5;
    case 5:
        loc_2 = SEG_DATA;
        *(int *)((char *)&loc_4 + 0) = (int)(unsigned)&B_F77B;
        t1 = far_daabc();
        *loc_4 = t1;
        return t1;
    case 6:
        if (B_7B8D != 0) {
            if (B_7B8D != 1) {
                if (B_7B8D != 2) {
                    return B_7B8D;
                }
                ax = ((char)-(B_7B8D < 0) << 8 | (unsigned char)B_F235);
                TBL_F77A[W_F236] = (char)ax;
L1:
                return ax;
            }
            if (W_F236 > W_F23A) {
                W_F236 = W_F23A;
                ax2 = (int)far_b1073();
            }
            B_F235 = TBL_F77A[W_F236];
            return (int)far_b1073();
        }
        if (W_F23A > W_F238) {
            di = (int)(unsigned)(&TBL_F779 + W_93F5);
            cx = W_F23A - W_F238;
            cx2 = cx >> 1;
            __stos2(MK_FP(SEG_DATA, di), 0, cx2 * 2);
            __stos1(MK_FP(SEG_DATA, di + cx2 * 2), 0, cx & 1);
            W_F238 = W_F23A;
        }
        ax3 = W_F23A;
        W_93F5 = ax3 + 2;
        return ax3 + 2;
    }
}
