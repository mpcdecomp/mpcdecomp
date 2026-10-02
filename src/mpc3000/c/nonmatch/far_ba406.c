/* differs: 308 at +5, 567 bytes; 311 at +5, 540 bytes; 312 at +5, 539 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_7FC7;
extern char B_9780;
extern char B_9781;
extern char B_D4AB;
extern char B_D4C0;
extern char B_D4C2;
extern unsigned char B_E426[];
extern char far *FP_E40C;
extern unsigned char TBL_ba5ff[];
extern int far far_b08f7(void);
extern long far far_b1073(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern long far far_b362e(void far *, char far *, void far *);
extern long far far_b3819(void far *, char far *, int, int, int);
extern long far far_b6cd3(int);
extern long far far_b9045(int, int, int);
extern long far far_b90dd(void);
extern long far far_ba670(void);
extern int far far_d7b8f(int);
extern long far fn_ba607(void);
extern long far fn_ba62f(char);

long far far_ba406(void)
{
    char loc_1;
    char loc_2;
    int ax;
    int ax2;
    int ax3;
    unsigned int ax4;
    int ax5;
    int dx;
    int p10;
    int p12;
    int p14;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    long t17;
    long t18;
    long t19;
    long t2;
    int t20;
    int t21;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_b6cd3(0x3bd1);
    loc_1 = B_D4C0;
    t2 = far_b3819(MK_FP(SEG_DATA, 0x3be4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), 2, 35, 98);
    t3 = far_b9045(loc_1, 1, 7);
    far_b1ad0(2);
    t4 = far_b362e(MK_FP(SEG_DATA, 0x3bea), (char far *)&B_7FC7, MK_FP(SEG_DATA, 0x3b5c));
    loc_2 = (char)(int)fn_ba607();
    t5 = far_b362e(MK_FP(SEG_DATA, 0x3bf1), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), MK_FP(SEG_DATA, 0x3b68));
    far_b1ad0(2);
    p14 = 2;
    t6 = far_b3819(MK_FP(SEG_DATA, 0x3bf3), (unsigned char far *)B_E426, p14, 4, 13);
    p12 = 0xba40;
    t7 = fn_ba62f(B_7FC7);
    t8 = far_b90dd();
    p10 = 0x3bff;
    ax3 = far_b1b05(p10);
    dx = 0;
    goto L1;
L2:
    ax4 = B_7B8D;
    if (ax4 <= 3) {
        goto L3;
    }
    goto L4;
L3:
    switch ((unsigned int)(unsigned)(TBL_ba5ff + (ax4 << 1))) {
    case 0:
        goto L5;
    case 1:
        goto L6;
    case 2:
        goto L7;
    case 3:
        goto L8;
    }
L5:
    p14 = loc_1;
    t14 = far_b9045(p14, 1, 7);
L6:
    t15 = fn_ba607();
    loc_2 = (char)(int)t15;
    t16 = far_b1073();
    p10 = ((char)((int)t16 >> 8) << 8 | (unsigned char)B_7FC7);
    p12 = 0xba40;
    t17 = fn_ba62f(p10);
    goto L4;
L7:
    if (B_7FC7 == 0) {
        goto L9;
    }
    if (loc_2 <= 3) {
        goto L10;
    }
    loc_2 = (char)3;
L10:
    t10 = (long)(signed char)loc_1 * 24L;
    *(char far *)((char far *)*(long *)((char *)&FP_E40C + 0) + -755 + (int)t10) = loc_2;
L9:
    t11 = fn_ba607();
    loc_2 = (char)(int)t11;
    t12 = far_b1073();
    p10 = ((char)((int)t12 >> 8) << 8 | (unsigned char)B_7FC7);
    p12 = 0xba40;
    t13 = fn_ba62f(p10);
    goto L4;
L8:
    p10 = ((char)(ax4 >> 8) << 8 | (unsigned char)B_7FC7);
    p12 = 0xba40;
    t9 = fn_ba62f(p10);
L4:
    t21 = far_b08f7();
    dx = t21;
    if (t21 != 0) {
        goto L11;
    }
    goto L2;
L11:
    if (t21 == 120) {
        goto L12;
    }
    if (t21 == 121) {
        goto L13;
    }
    goto L1;
L12:
    ax5 = ((char)(t21 >> 8) << 8 | (unsigned char)loc_1);
    B_9781 = (char)ax5;
    t19 = (long)(signed char)(char)ax5 * 24L;
    B_9780 = *(char far *)((char far *)*(long *)((char *)&FP_E40C + 0) + -755 + (int)t19);
    B_D4AB = (char)1;
    p10 = 14;
    t20 = far_d7b8f(p10);
    dx = B_D4C2;
    goto L1;
L13:
    t18 = far_ba670();
    dx = (int)t18;
L1:
    if (dx == 0) {
        goto L4;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_ba670(void) { return 0; }
long far fn_ba607(void) { return 0; }
long far fn_ba62f(char p0) { return 0; }
