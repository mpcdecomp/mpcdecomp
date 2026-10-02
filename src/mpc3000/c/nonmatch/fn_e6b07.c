/* differs: 308 at +5, 188 bytes; 311 at +5, 188 bytes; 312 at +5, 188 bytes */
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
extern int W_902D;
extern int W_902F;
extern long far far_d97ca(int, unsigned char far *, int);
extern long far far_d9b6e(int, unsigned char far *, int);
extern int far far_daa82(int);
extern int far far_daabc(int);

void far fn_e6b07(int arg_0, int arg_2, char arg_4)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int ax;
    int dx;
    int dx2;
    int t1;
    int t2;
    long t3;
    long t4;
    long t5;

    loc_6 = 0;
    for (;;) {
        dx = W_902D;
        loc_2 = W_902F;
        loc_4 = dx;
        t4 = far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
        ax = TBL_F779 & 248;
        if (ax == 136) {
            if (arg_0 != 0) {
                t1 = far_daa82(TBL_F77A);
                dx2 = t1;
                if (dx2 >= arg_0) {
                    t2 = far_daabc(arg_0);
                    TBL_F77A = t2;
                    arg_0 = 0;
                } else {
                    arg_0 = arg_0 - dx2;
                }
                if (arg_0 < 0) {
                    arg_0 = 0;
                }
                goto L1;
            }
            continue;
        }
        if (ax != 168) {
            if (ax != 248) {
                if (arg_0 == 0) {
                    continue;
                }
                goto L1;
            }
            break;
        }
        if (loc_6 == 0) {
            B_F77C = *(char *)((char *)&arg_2 + 0);
            B_F77D = arg_4;
            loc_6 = 1;
L1:
            t3 = far_d9b6e(1, (unsigned char far *)&TBL_F779, (int)t4);
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
