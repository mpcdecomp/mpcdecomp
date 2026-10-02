/* differs: 308 at +3, 186 bytes; 311 at +3, 186 bytes; 312 at +3, 185 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[5];
    char f_5;
};
extern char TBL_828A[];
extern char TBL_82EE[];
extern char TBL_8352[];

void far fn_b984c(int arg_0, struct s1 far *arg_2)
{
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int es;
    int es2;
    int es3;

    if ((TBL_82EE[arg_0] & -128) == 0) {
        ax = 1;
    } else {
        ax = 0;
    }
    arg_2->f_5 = (char)ax;
    if ((TBL_8352[arg_0] & -128) != 0) {
        ax2 = 1;
    } else {
        ax2 = 0;
    }
    bx = FP_OFF(arg_2);
    es = FP_SEG(arg_2);
    *(char far *)MK_FP(es, bx + 4) = (char)ax2;
    *(char far *)MK_FP(es, bx) = (char)((TBL_82EE[arg_0] & 15) + 1);
    if ((TBL_82EE[arg_0] & 64) != 0) {
        *(char far *)MK_FP(es, bx) = (char)0;
    }
    bx2 = FP_OFF(arg_2);
    es2 = FP_SEG(arg_2);
    *(char far *)MK_FP(es2, bx2 + 2) = (char)((char)(TBL_82EE[arg_0] >> 4) & 3);
    *(char far *)MK_FP(es2, bx2 + 1) = (char)((TBL_8352[arg_0] & 15) + 1);
    if ((TBL_8352[arg_0] & 64) != 0) {
        *(char far *)MK_FP(es2, bx2 + 1) = (char)0;
    }
    bx3 = FP_OFF(arg_2);
    es3 = FP_SEG(arg_2);
    *(char far *)MK_FP(es3, bx3 + 3) = (char)((char)(TBL_8352[arg_0] >> 4) & 3);
    *(char far *)MK_FP(es3, bx3 + 6) = TBL_828A[arg_0];
    return;
}
