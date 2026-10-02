/* differs: 308 at +5, 109 bytes; 311 at +5, 109 bytes; 312 at +5, 109 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_901B;
extern int W_9045;
extern int W_9047;
extern int W_9051;
extern int W_9053;
extern int W_9055;
extern int far far_d79ee(void);
extern int far far_d7b2c(void);
extern void far far_d99a2(char far *, char far *, int);
extern long far far_dae36(void);
extern long far far_daf5c(void);
extern long far far_dc2bf(char far *, int, int);
extern long far far_e3ddb(char far *);
extern long far far_e5612(int, int);
extern long far far_e7073(int, int);
extern long far far_e723d(char far *, int, int);

void far fn_e4354(void)
{
    char loc_a[10];
    int loc_c;
    int loc_e;
    int dx;
    int si;
    long t1;
    int t2;
    long t3;
    long t4;
    int t5;
    long t6;
    long t7;
    long t8;
    long t9;

    if (B_901B == 0) {
        goto L1;
    }
    goto L2;
L1:
    si = 0;
    goto L3;
L4:
    if ((int)far_e3ddb((char far *)&B_901B) == 0) {
        goto L5;
    }
    t3 = far_e5612(W_9051, W_9053);
    t4 = far_e7073(W_9045, W_9047);
    return;
L5:
    if (W_9055 != 0) {
        goto L4;
    }
    far_d99a2((char far *)&B_901B, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_a), 10);
    if (loc_a[0] != -88) {
        goto L6;
    }
    t1 = far_e723d((char far *)&B_901B, (unsigned char)loc_a[3], (unsigned char)loc_a[4]);
L6:
    dx = W_9051;
    loc_c = W_9053;
    loc_e = dx;
    t6 = far_dae36();
    if ((int)far_dc2bf((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_a), 10, 0) == 0) {
        goto L7;
    }
    si = 1;
L7:
    t7 = far_daf5c();
    t8 = far_e5612(loc_e, loc_c);
    if (far_d7b2c() == 0) {
        goto L3;
    }
    t2 = far_d79ee();
    if (t2 == 117) {
        goto L8;
    }
L3:
    if (si != 0) {
        goto L8;
    }
    goto L4;
L8:
    t9 = far_e7073(W_9045, W_9047);
L2:
    return;
}
