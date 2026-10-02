/* differs: 308 at +5, 228 bytes; 311 at +3, 240 bytes; 312 at +3, 240 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7FD1;
extern char B_9457;
extern char B_956D;
extern char B_A575;
extern unsigned char TBL_956E[];
extern unsigned char TBL_966E[];
extern int W_96F6;
extern int W_96F8;
extern unsigned char W_D4AD[];
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern long far far_b3b9f(int);
extern int far far_d78c6(void);
extern int far far_d7903(void);
extern long far far_d7978(void);
extern long far far_d7a09(unsigned char far *);
extern long far far_df14a(int);
extern long far far_e270b(void);
extern long far far_e2ce3(void);
extern long far far_eb7cc(int);

long far far_ba0a7(int arg_0)
{
    int ax;
    int di;
    int dx2;
    int si;
    long t1;
    long t10;
    long t2;
    int t3;
    long t4;
    int t5;
    long t6;
    int t7;
    int t8;
    long t9;

    goto L1;
L2:
    dx2 = 1;
    si = 0;
    ax = B_9457;
L3:
    if ((dx2 & ax) == 0) {
        goto L4;
    }
    B_9457 = (char)(B_9457 & ~(char)dx2);
    goto L5;
L4:
    dx2 = dx2 << 1;
    si = si + 1;
    if (si < 8) {
        goto L3;
    }
L5:
    t1 = far_e2ce3();
    W_96F8 = (int)(t1 >> 16);
    W_96F6 = (int)t1;
    if (si != 5) {
        goto L6;
    }
    t2 = far_e270b();
L6:
    t3 = far_b1af9();
    t4 = far_b3b9f(-50 - si);
    t5 = far_b1aff();
    t6 = far_e2ce3();
    W_96F8 = (int)(t6 >> 16);
    W_96F6 = (int)t6;
    __stos2((unsigned char far *)TBL_956E, 0, 128);
    __stos2((unsigned char far *)TBL_966E, 0, 128);
    di = (int)(unsigned)(TBL_966E + 128);
    B_956D = (char)0;
    t7 = far_d78c6();
    t8 = far_d7903();
    t9 = far_eb7cc(B_7FD1);
    t10 = far_d7978();
L7:
    if (B_9457 == 0) {
        goto L8;
    }
    if (B_A575 == 0) {
        goto L8;
    }
    goto L2;
L8:
    arg_0 = (int)far_df14a((int)far_d7a09((unsigned char far *)W_D4AD));
L1:
    if (arg_0 == arg_0) {
        goto L7;
    }
    return ((long)arg_0 << 16 | (unsigned)arg_0);
}
