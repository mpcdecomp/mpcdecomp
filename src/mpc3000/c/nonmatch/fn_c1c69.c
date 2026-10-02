/* differs: 308 at +3, 163 bytes; 311 at +3, 172 bytes; 312 at +3, 173 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[3];
    char f_3;
};
struct s2 {
    char pad_0[2];
    char f_2;
};
extern int W_D4AD;
extern long far far_cbbd4(int);
extern long far far_da659(int, int);
extern void far far_da687(int, int);
extern int far far_dab06(int);
extern long far fn_c15bf(int);
extern long far fn_c1680(int);
long far fn_c15bf(int p0) { return 0; }
long far fn_c1680(int p0) { return 0; }

void far fn_c1c69(int arg_0, int arg_2, int arg_4)
{
    int ax;
    int ax2;
    int dx;
    int dx2;
    int si;
    struct s2 far *t1;
    long t2;
    long t3;
    struct s1 far *t4;
    int t5;
    long t6;

    si = arg_0 + arg_2;
    if (arg_4 == 0) {
        t1 = (struct s2 far *)far_cbbd4(far_dab06(si));
        ax = (unsigned char)t1->f_2;
        if (ax < 100) {
            dx = ax + (W_D4AD << 1);
            if (dx > 100) {
                dx = 100;
            }
            t2 = far_da659(si, dx);
            t3 = fn_c15bf(arg_0);
            return;
        }
        goto L1;
    }
    t4 = (struct s1 far *)far_cbbd4(far_dab06(si));
    ax2 = (unsigned char)t4->f_3 & 15;
    if (ax2 < 9) {
        dx2 = ax2 + 1;
        if (dx2 > 9) {
            dx2 = 9;
        }
        far_da687(si, dx2);
        t6 = fn_c1680(arg_0);
    }
L1:
    return;
}
