/* differs: 308 at +5, 417 bytes; 311 at +5, 416 bytes; 312 at +5, 418 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9C;
extern unsigned char B_901B[];
extern unsigned char B_F77C;
extern unsigned char B_F77D;
extern unsigned char TBL_F779;
extern char TBL_F77A;
extern int W_902D;
extern int W_902F;
extern int W_9055;
extern long far far_d97ca(int, unsigned char far *, int);
extern int far far_daa8e(char far *);
extern long far far_dbe67(unsigned char far *, int, int);
extern int far far_dc29e(void);
extern int far far_de4c2(unsigned char far *);
extern long far far_e723d(unsigned char far *, int, int);
extern long far far_e7d89(unsigned char far *, int);

long far far_dae36(void)
{
    int loc_2;
    int loc_4;
    int ax;
    int ax2;
    int di;
    int dx;
    int dx2;
    int flags;
    long t1;
    long t2;
    int t3;
    int t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    ax = far_dc29e();
    dx = UNDEF;
    di = 0;
    goto L1;
L2:
    dx2 = W_902D;
    loc_2 = W_902F;
    loc_4 = dx2;
    t9 = far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
    ax2 = TBL_F779 & 248;
    flags = ax2 - 240;
    if (CC("==", flags)) {
        goto L3;
    }
    if (CC(">", flags)) {
        goto L4;
    }
    if (ax2 == 136) {
        goto L5;
    }
    if (ax2 == 168) {
        goto L6;
    }
    goto L7;
L4:
    if (ax2 == 248) {
        goto L8;
    }
    goto L7;
L5:
    t3 = far_daa8e((char far *)&TBL_F77A);
    ax = t3;
    dx = UNDEF;
    W_9055 = ax;
    goto L1;
L6:
    t1 = far_e723d((unsigned char far *)B_901B, B_F77C, B_F77D);
    t2 = far_e7d89((unsigned char far *)&TBL_F779, (int)t9);
    ax = (int)t2;
    dx = (int)(t2 >> 16);
    goto L1;
L8:
    W_902F = loc_2;
    W_902D = loc_4;
    return far_dbe67((unsigned char far *)&TBL_F779, (int)t9, 0);
L3:
    t4 = far_de4c2((unsigned char far *)&TBL_F779);
    if (t4 != 7) {
        goto L7;
    }
    if (di != 0) {
        goto L9;
    }
    if (TBL_F77A != B_8A9C) {
        goto L9;
    }
    t5 = far_dbe67((unsigned char far *)&TBL_F779, (int)t9, 0);
    ax = (int)t5;
    dx = (int)(t5 >> 16);
    di = 1;
    goto L1;
L9:
    t6 = far_e7d89((unsigned char far *)&TBL_F779, (int)t9);
    ax = (int)t6;
    dx = (int)(t6 >> 16);
    goto L1;
L7:
    if (TBL_F77A != B_8A9C) {
        goto L10;
    }
    t7 = far_dbe67((unsigned char far *)&TBL_F779, (int)t9, 0);
    ax = (int)t7;
    dx = (int)(t7 >> 16);
    goto L1;
L10:
    t8 = far_e7d89((unsigned char far *)&TBL_F779, (int)t9);
    ax = (int)t8;
    dx = (int)(t8 >> 16);
L1:
    if (W_9055 != 0) {
        goto L11;
    }
    goto L2;
L11:
    return ((long)dx << 16 | (unsigned)ax);
}
