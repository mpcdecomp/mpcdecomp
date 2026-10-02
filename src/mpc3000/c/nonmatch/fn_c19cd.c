/* differs: 308 at +3, 169 bytes; 311 at +3, 177 bytes; 312 at +3, 177 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[1];
    char f_1;
};
extern int W_D4AD;
extern long far far_cbb70(int);
extern long far far_da5fe(int, int);
extern long far far_da62b(int, int);
extern int far far_dab06(int);
extern long far fn_c13d7(int);
extern long far fn_c1497(int);
long far fn_c13d7(int p0) { return 0; }
long far fn_c1497(int p0) { return 0; }

void far fn_c19cd(int arg_0, int arg_2, int arg_4)
{
    int ax;
    int ax2;
    int dx;
    int dx2;
    int si;
    char far *t1;
    long t2;
    long t3;
    struct s1 far *t4;
    long t5;
    long t6;

    si = arg_0 + arg_2;
    if (arg_4 == 0) {
        t1 = (char far *)far_cbb70(far_dab06(si));
        ax = (unsigned char)*t1;
        if (ax != 0) {
            dx = ax - (W_D4AD << 1);
            if (dx < 0) {
                dx = 0;
            }
            t2 = far_da5fe(si, dx);
            t3 = fn_c13d7(arg_0);
            return;
        }
        goto L1;
    }
    t4 = (struct s1 far *)far_cbb70(far_dab06(si));
    ax2 = (unsigned char)t4->f_1;
    if (ax2 != 0) {
        dx2 = ax2 - ((W_D4AD << 1) + W_D4AD);
        if (dx2 < 0) {
            dx2 = 0;
        }
        t5 = far_da62b(si, dx2);
        t6 = fn_c1497(arg_0);
    }
L1:
    return;
}
