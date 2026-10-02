/* differs: 308 at +5, 193 bytes; 311 at +5, 193 bytes; 312 at +5, 193 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_F77C;
extern char B_F77D;
extern unsigned char TBL_F779;
extern int TBL_F77A;
extern int W_8814;
extern int W_902D;
extern int W_902F;
extern long far far_d97ca(int, unsigned char far *, int);
extern long far far_d9b6e(int, unsigned char far *, int);
extern int far far_daa82(int);
extern long far far_dad54(int);

void far fn_e6bdf(int arg_0, int arg_2, int arg_4, char arg_6)
{
    int loc_2;
    int loc_4;
    int ax;
    int ax2;
    int di;
    int dx;
    long t1;
    int t2;
    long t3;
    long t4;
    long t5;

    di = 0;
    W_8814 = di;
    for (;;) {
        dx = W_902D;
        loc_2 = W_902F;
        loc_4 = dx;
        t4 = far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
        ax = TBL_F779 & 248;
        if (ax == 136) {
            if (arg_0 != 0) {
                t2 = far_daa82(TBL_F77A);
                ax2 = t2;
                W_8814 = ax2;
                if (W_8814 >= arg_0) {
                    W_8814 = W_8814 + (ax2 - arg_0);
                    arg_0 = 0;
                    W_8814 = W_8814 + arg_2;
                } else {
                    arg_0 = arg_0 - W_8814;
                }
                t3 = far_dad54(1);
                continue;
            }
            continue;
        }
        if (ax != 168) {
            if (ax != 248) {
                goto L1;
            }
            break;
        }
        if (di == 0) {
            B_F77C = *(char *)((char *)&arg_4 + 0);
            B_F77D = arg_6;
            di = 1;
L1:
            t1 = far_d9b6e(1, (unsigned char far *)&TBL_F779, (int)t4);
            continue;
        }
        goto L2;
    }
    W_902F = loc_2;
    W_902D = loc_4;
    return;
L2:
    t5 = far_d9b6e(1, (unsigned char far *)&TBL_F779, (int)t4);
    return;
}
