/* differs: 308 absent; 311 at +7, 227 bytes; 312 at +7, 227 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
struct s1 {
    char f_0;
    char f_1;
};
extern char B_7FC7;
extern char B_96EE;
extern char B_977D;
extern char B_977E;
extern char B_977F;
extern char B_A570;
extern char B_A5C0;
extern char B_A5C7;
extern char B_A5C8;
extern char B_D4AB;
extern char TBL_90C1;
extern char TBL_9125;
extern int far far_d7938(struct s1 far *);
extern long far far_dcf84(int, int, int, int);
extern long far far_ddfd9(struct s1 far *, int);

int far far_dcead(struct s1 far *arg_0, int arg_2, int arg_4, int arg_6)
{
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int es;

    if (B_A5C7 != 0) {
        goto L1;
    }
    if (B_A5C8 == 0) {
        goto L2;
    }
L1:
    ax2 = B_A5C0;
    if (ax2 == 0) {
        goto L3;
    }
    goto L4;
L3:
    return far_d7938(arg_0);
L2:
    if (arg_0->f_0 != -112) {
        goto L5;
    }
    if (B_D4AB == 0) {
        goto L6;
    }
    if (B_7FC7 != 0) {
        goto L5;
    }
L6:
    bx = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    loc_2 = (unsigned char)*(char far *)MK_FP(es, bx + 2);
    if (B_977F != loc_2) {
        goto L5;
    }
    *(char far *)MK_FP(es, bx) = (char)(*(char far *)MK_FP(es, bx) | B_977E);
    *(char far *)MK_FP(es, bx + 4) = B_977D;
L5:
    if (B_A5C0 != 0) {
        goto L7;
    }
    ax = far_d7938(arg_0);
L7:
    if (B_96EE != 0) {
        goto L8;
    }
    if (B_A570 != 0) {
        goto L8;
    }
    arg_0->f_1 = (char)0;
    TBL_9125 = (char)-1;
    TBL_90C1 = (char)4;
L8:
    ax2 = (int)far_dcf84(*(int *)((char *)&arg_0 + 0), arg_2, arg_4, arg_6);
    if (B_96EE != 0) {
        goto L9;
    }
    if (B_A570 == 0) {
        goto L4;
    }
L9:
    ax2 = (int)far_ddfd9(arg_0, arg_4);
L4:
    return ax2;
}
