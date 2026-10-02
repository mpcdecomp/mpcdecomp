/* differs: 308 absent; 311 at +5, 187 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_5FFC;
extern int W_5FF4;
extern int W_5FF6;
extern int W_5FF8;
extern int W_5FFA;
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(int far *);
extern int far far_b1b41(int, int);
extern long far far_b362e(void far *, long, void far *, int);
extern long far far_b3819(void far *, int, int, int, int, int, int);

long far fn_c6d1f(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8)
{
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    char loc_2[2];
    int ax;
    int ax2;
    int t1;
    long t2;
    long t3;
    long t4;

    loc_a = W_5FF4;
    loc_8 = W_5FF6;
    loc_6 = W_5FF8;
    loc_4 = W_5FFA;
    loc_2[0] = B_5FFC;
    if ((arg_2 | arg_4) != 0 && (arg_6 | arg_8) != 0) {
        t1 = far_b1ad0(3, ~__repne_scas1((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), 0, -1) + 28);
        t2 = far_b3819(MK_FP(SEG_DATA, 0x5f93), arg_2, arg_4, 2, 1, 16, 8);
        t3 = far_b362e(MK_FP(SEG_DATA, 0x5f93), *(long *)((char *)&arg_6 + 0), MK_FP(SEG_DATA, 0x5f36), 1);
    }
    far_b1ad0(3, 29);
    if (arg_0 != 0) {
        return ((long)UNDEF << 16 | (unsigned)far_b1b41(32, 11));
    }
    far_b1b05((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a));
    t4 = far_b1073(3);
    return far_b1073(4);
}
