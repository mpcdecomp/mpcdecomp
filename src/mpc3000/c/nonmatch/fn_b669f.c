/* differs: 308 absent; 311 at +5, 603 bytes; 312 at +5, 602 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern unsigned char B_CEC1;
extern unsigned char B_CEC3;
extern char B_D5DD;
extern int W_8C39;
extern int W_8C3B;
extern int W_8C3D;
extern int W_8C3F;
extern int far far_b08f7(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1f96(int);
extern long far far_b3b9f(int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_cac0f(void far *, char far *);
extern long far far_cad00(int);
extern long far far_cae62(int, int, int, int);
extern long far far_caf26(int, int, int);
extern long far far_d5b6a(int);
extern int far far_d78b2(void);
extern long far far_daa07(int, int, int, int);
extern long far far_daa59(int, int);
extern long far far_deabe(void);

int far fn_b669f(void)
{
    char loc_28[28];
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int di;
    int dx;
    int dx2;
    int p54;
    int si;
    long t1;
    int t10;
    int t11;
    int t12;
    int t13;
    int t14;
    int t15;
    long t16;
    long t17;
    long t18;
    long t19;
    long t2;
    long t20;
    int t21;
    int t22;
    int t23;
    int t24;
    int t25;
    int t26;
    int t27;
    int t28;
    int t29;
    long t3;
    int t30;
    long t31;
    long t32;
    long t33;
    long t34;
    long t35;
    long t36;
    long t37;
    int t38;
    int t39;
    long t4;
    int t40;
    int t41;
    long t42;
    int t43;
    long t5;
    int t6;
    int t7;
    int t8;
    int t9;

    B_D5DD = (char)91;
    si = 0;
    goto L1;
L2:
    t37 = far_b6cd3(MK_FP(SEG_DATA, 0x2bed));
    t38 = far_b1ad0(1, 0);
    t39 = far_b1b05(MK_FP(SEG_DATA, 0x2c00));
    t40 = far_b1ad0(2, 0);
    t41 = far_b1b05(MK_FP(SEG_DATA, 0x2c29));
    t42 = far_b90dd();
    t43 = far_b1b05(MK_FP(SEG_DATA, 0x2c4f));
    si = far_b08f7(1);
    if (si == 120) {
        goto L3;
    }
    goto L1;
L3:
    t1 = far_d5b6a(0);
    t2 = far_daa07(W_8C3D, W_8C3F, W_8C39, W_8C3B);
    loc_a = (int)(t2 >> 16);
    loc_c = (int)t2;
    p54 = (int)t2;
    t3 = (long)MK_FP((int)(t2 >> 16), p54) / 0x200L;
    loc_2 = (int)t3;
    di = 0;
    B_CEC1 = (char)di;
    t4 = far_daa59(W_8C39, W_8C3B);
    loc_6 = (int)(t4 >> 16);
    loc_8 = (int)t4;
    loc_4 = 80;
    B_CEC3 = (unsigned char)80;
    goto L4;
L5:
    t5 = far_b6cd3(MK_FP(SEG_DATA, 0x2bed));
    t6 = far_b1ad0(1, 0);
    t7 = far_b1b05(MK_FP(SEG_DATA, 0x2c5e));
    t8 = far_b1ad0(2, 0);
    t9 = far_b1b05(MK_FP(SEG_DATA, 0x2c82));
    t10 = far_b1ad0(7, 0);
    t11 = far_b1b05(MK_FP(SEG_DATA, 0x2c88));
    B_D5DD = (char)92;
    t12 = far_d78b2();
    t13 = far_b08f7(1);
    si = t13;
    if (si == 120) {
        goto L6;
    }
    goto L7;
L6:
    si = 0;
    t14 = far_b1ad0(7, 0);
    t15 = far_b1b05(MK_FP(SEG_DATA, 0x2c92));
    t16 = far_cad00(0);
    p54 = 0x5d8;
    t17 = far_cac0f(MK_FP(SEG_DATA, p54), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_28));
    dx = (int)t17;
    if (((int)t17 & -0x100) != -0x100) {
        goto L8;
    }
    t18 = far_b3b9f(dx);
    goto L7;
L8:
    p54 = loc_8;
    t19 = far_cae62(p54, loc_6, loc_2, di);
    ax = (int)t19;
    if (ax == 0) {
        goto L9;
    }
    t20 = far_b3b9f(ax);
    goto L7;
L9:
    t21 = far_b1ad0(1, 0);
    t22 = far_b1b05(MK_FP(SEG_DATA, 0x2cb6));
    t23 = far_b1ad0(7, 0);
    t24 = far_b1f96(40);
    t25 = far_b1ad0(7, 0);
    t26 = far_b1b05(MK_FP(SEG_DATA, 0x2c88));
    B_D5DD = (char)93;
    t27 = far_d78b2();
    t28 = far_b08f7(1);
    si = t28;
    if (si == 120) {
        goto L10;
    }
    goto L7;
L10:
    si = 0;
    t29 = far_b1ad0(7, 0);
    t30 = far_b1b05(MK_FP(SEG_DATA, 0x2cdc));
    t31 = far_cad00(0);
    p54 = 0x5d8;
    t32 = far_cac0f(MK_FP(SEG_DATA, p54), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_28));
    dx2 = (int)t32;
    if (((int)t32 & -0x100) != -0x100) {
        goto L11;
    }
    t33 = far_b3b9f(dx2);
    goto L7;
L11:
    t34 = far_caf26(loc_8, loc_6, di);
    ax2 = (int)t34;
    if (ax2 == 0) {
        goto L12;
    }
    t35 = far_b3b9f(ax2);
    goto L7;
L12:
    di = B_CEC1;
    ax3 = B_CEC3;
    loc_4 = loc_4 - ax3;
    if (ax3 <= loc_4) {
        goto L4;
    }
    B_CEC3 = *(char *)((char *)&loc_4 + 0);
L4:
    if (loc_4 == 0) {
        goto L7;
    }
    goto L5;
L7:
    t36 = far_deabe();
L1:
    if (si != 0) {
        goto L13;
    }
    goto L2;
L13:
    return si;
}
long far far_b6cd3(void far *p0) { return 0; }
