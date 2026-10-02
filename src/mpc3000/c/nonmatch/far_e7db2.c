/* differs: 308 at +5, 361 bytes; 311 at +5, 360 bytes; 312 at +5, 359 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_F77A {
    int f_0;
};
extern char B_901B;
extern char B_956A;
extern unsigned char B_F77B;
extern char TBL_90C1[];
extern unsigned char TBL_F779;
extern struct g_TBL_F77A TBL_F77A;
extern int W_9051;
extern int W_9053;
extern int W_947E;
extern long far far_d97ca(int, unsigned char far *, int);
extern long far far_d9b6e(int, unsigned char far *, int);
extern int far far_daa82(int);
extern long far far_dad54(int);
extern long far far_e3d12(char far *, long);
extern long far far_e51be(char far *, int, int);
extern long far far_e5612(int, int);
extern long far far_e7644(void);

long far far_e7db2(int arg_0, int arg_2, char arg_4)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    long loc_c;
    int ax;
    int ax2;
    int ax3;
    int di;
    int dx;
    int dx2;
    int dx3;
    int flags;
    long t1;
    long t2;
    long t3;
    int t4;
    long t5;
    long t6;
    long t7;

    if (B_901B >= 0) {
        goto L1;
    }
    goto L2;
L1:
    if (arg_2 == 0) {
        goto L3;
    }
    if ((TBL_90C1[arg_2] & 4) == 0) {
        goto L3;
    }
    goto L2;
L3:
    if (arg_0 != 0) {
        goto L4;
    }
    goto L2;
L4:
    dx = W_9051;
    loc_6 = W_9053;
    loc_8 = dx;
    t1 = far_e7644();
    loc_a = (int)(t1 >> 16);
    *(int *)((char *)&loc_c + 0) = (int)t1;
    t2 = far_e51be((char far *)&B_901B, arg_4, 0);
    t3 = far_e3d12((char far *)&B_901B, *(long *)((char *)&W_947E + 0));
    B_956A = (char)(B_956A + 1);
    loc_4 = 0;
    goto L5;
L6:
    loc_2 = (int)far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
    ax = TBL_F779 & 248;
    if (ax == 136) {
        goto L7;
    }
    if (ax == 152) {
        goto L8;
    }
    if (ax == 248) {
        goto L9;
    }
    goto L10;
L7:
    t4 = far_daa82(TBL_F77A.f_0);
    *(int *)((char *)&loc_c + 0) = *(int *)((char *)&loc_c + 0) - t4;
    loc_a = (int)(loc_c - (long)(int)t4 >> 16);
    flags = loc_a;
    if (CC(">", flags)) {
        goto L10;
    }
    if (CC("!=", flags)) {
        goto L11;
    }
    if (*(int *)((char *)&loc_c + 0) != 0) {
        goto L10;
    }
L11:
    loc_4 = 1;
    goto L10;
L8:
    ax2 = (unsigned char)*(char *)((char *)&TBL_F77A + 0);
    di = ax2;
    if (ax2 == arg_2) {
        goto L12;
    }
    if (arg_2 != 0) {
        goto L10;
    }
L12:
    if ((TBL_90C1[di] & 4) != 0) {
        goto L10;
    }
    dx2 = B_F77B + arg_0;
    if (dx2 <= 127) {
        goto L13;
    }
    dx2 = 127;
L13:
    if (dx2 >= 0) {
        goto L14;
    }
    dx2 = 0;
L14:
    B_F77B = (char)dx2;
    goto L10;
L9:
    loc_4 = 1;
L10:
    t5 = far_dad54(1);
    t6 = far_d9b6e(1, (unsigned char far *)&TBL_F779, loc_2);
L5:
    if (loc_4 != 0) {
        goto L15;
    }
    goto L6;
L15:
    W_9053 = 0;
    W_9051 = 0;
    t7 = far_e5612(loc_8, loc_6);
    ax3 = (int)t7;
    dx3 = (int)(t7 >> 16);
    B_956A = (char)(B_956A - 1);
L2:
    return ((long)dx3 << 16 | (unsigned)ax3);
}
