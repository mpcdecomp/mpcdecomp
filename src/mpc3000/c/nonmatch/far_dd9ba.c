/* differs: 308 at +3, 300 bytes; 311 at +3, 300 bytes; 312 at +3, 300 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern unsigned char B_955D;
extern char B_E422;
extern char B_E423;
extern char TBL_905D[];
extern char TBL_90C1[];
extern long far far_dcf84(void far *, int, int);
extern int far far_de278(void far *);
extern int far far_dea54(void far *, char);

int far far_dd9ba(long arg_0, int arg_4)
{
    int ax;
    int ax2;
    int bx;
    int bx2;
    int es;
    int si;
    int t1;
    int t2;
    long t3;

    si = (int)arg_0;
    es = (int)(arg_0 >> 16);
    bx = *(int far *)MK_FP(es, si + 1);
    if (arg_4 != 0) {
        bx2 = (unsigned char)((char)bx << 1);
        if (!((unsigned int)(char)bx >> 7 & 1) && (TBL_90C1[((char)(bx2 >> 8) << 8 | (unsigned char)((unsigned int)(char)bx2 >> 1))] & 4) == 0) {
            t1 = far_dea54(MK_FP(es, si), TBL_905D[B_955D]);
            es = UNDEF;
            ax = t1;
        }
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si));
        ax = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 & -8));
        if ((char)ax != -104) {
            if ((char)ax != -8) {
                if ((char)ax != -16 || *(char far *)MK_FP(es, si + 2) != 71 || *(char far *)MK_FP(es, si + 5) != 69 && *(char far *)MK_FP(es, si + 5) != 70) {
                    goto L1;
                }
                ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si + 6));
                if ((char)ax == 1 || (char)ax == 2) {
                    if (B_E422 == 1) {
                        goto L1;
                    }
                } else if ((char)ax == 3) {
                    if (B_E423 == 1) {
L1:
                        t3 = far_dcf84(MK_FP(es, si), arg_4, 0);
                        es = UNDEF;
                        ax = (int)t3;
                    }
                }
            }
        } else {
            t2 = far_de278(MK_FP(es, si));
            es = UNDEF;
            ax = t2;
        }
    }
    *(int far *)MK_FP(es, si + 1) = bx;
    return ax;
}
