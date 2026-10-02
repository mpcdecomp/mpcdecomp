/* differs: 308 at +3, 220 bytes; 311 at +3, 220 bytes; 312 at +3, 220 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8800;
extern unsigned char B_8804;
extern unsigned char B_901B[];
extern char TBL_A79A[];
extern int W_A5CB;
extern long far far_e5a99();
extern long far fn_eaeac();

int far far_eadf4(char far *arg_0, int arg_2, int arg_4, int arg_6, int arg_8, int arg_10)
{
    int ax;
    int bx;
    int di;
    int es;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;

    if (B_8800 != 0) {
        ax = SEG_DATA;
        if (arg_2 == ax && *(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B) {
            t1 = far_e5a99(B_901B, ax);
            di = (unsigned char)TBL_A79A[B_8804];
            si = W_A5CB;
            goto L1;
        }
L2:
        if (*arg_0 >= 0) {
            t2 = far_e5a99(*(int *)((char *)&arg_0 + 0), arg_2);
            bx = FP_OFF(arg_0);
            es = FP_SEG(arg_0);
            di = *(char far *)MK_FP(es, bx + 1) & 1;
            si = *(int far *)MK_FP(es, bx + 50);
L1:
            t3 = fn_eaeac(*(int *)((char *)&arg_0 + 0), arg_2, 1, *(long *)((char *)&arg_4 + 0), *(long *)((char *)&arg_8 + 0));
            ax = (int)t3;
            arg_6 = (int)(t3 >> 16);
            arg_4 = ax;
            if (di != 0) {
                for (;;) {
                    ax = arg_4 | arg_6;
                    if (ax == 0) {
                        break;
                    }
                    t4 = fn_eaeac(*(int *)((char *)&arg_0 + 0), arg_2, si, *(long *)((char *)&arg_4 + 0), *(long *)((char *)&arg_8 + 0));
                    arg_6 = (int)(t4 >> 16);
                    arg_4 = (int)t4;
                }
            }
        }
    } else {
        goto L2;
    }
    return ax;
}
long far fn_eaeac(int p0, int p1, int p2, long p3, long p4) { return 0; }
