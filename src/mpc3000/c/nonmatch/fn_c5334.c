/* differs: 308 absent; 311 at +5, 1187 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[6];
    char f_6;
    char f_7;
    char f_8;
    int f_9;
    char f_b;
    char f_c;
    char f_d;
    char pad_e[5];
    char f_13;
    char f_14;
    char f_15;
};
extern char B_7B8D;
extern char B_D4C0;
extern char B_E421;
extern int FP_E40C;
extern unsigned char TBL_c583a[];
extern int W_E40E;
extern int far far_b08f7(int);
extern long far far_b1073(char);
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b362e(void far *, char far *, void far *, int);
extern long far far_b3723(void far *, char far *, int, long, int, void far *);
extern long far far_b3819(void far *, char far *, int, int, int, int);
extern long far far_b8ff3(int, int, int);
extern long far far_b90dd(void);
extern long far far_c530b(char, int, int);
extern long far far_c6547(int);
extern long far far_cc4e0(int);
extern long far far_da8a5();
long far far_c530b(char p0, int p1, int p2) { return 0; }

long far fn_c5334(void)
{
    struct s1 far *loc_14;
    int loc_12;
    int loc_10;
    int loc_e;
    unsigned char loc_c;
    unsigned char loc_b;
    char loc_a;
    char loc_9;
    char loc_8;
    char loc_7;
    char loc_6;
    char loc_5;
    char loc_4;
    char loc_3;
    char loc_2;
    char loc_1;
    int ax;
    int ax10;
    int ax11;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    unsigned int ax9;
    int bx;
    int bx2;
    int es;
    int p26;
    int p28;
    int p30;
    long t1;
    int t10;
    long t11;
    int t12;
    long t13;
    int t14;
    long t15;
    int t16;
    long t17;
    int t18;
    long t19;
    long t2;
    int t20;
    long t21;
    long t22;
    long t23;
    long t24;
    long t25;
    long t26;
    long t27;
    long t28;
    long t29;
    int t3;
    long t30;
    long t31;
    long t32;
    long t33;
    long t34;
    long t35;
    int t36;
    long t4;
    int t5;
    long t6;
    long t7;
    int t8;
    long t9;

    far_b1aac();
    loc_2 = (char)(B_E421 + 1);
    t1 = far_b3819(MK_FP(SEG_DATA, 0x5ae7), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2, 1, 24, 8);
    loc_3 = B_D4C0;
    t2 = far_b8ff3(loc_3, 0, 31);
    far_b1ad0(0, 35);
    far_b1b05(MK_FP(SEG_DATA, 0x5afd));
    far_b1ad0(1, 0);
    bx = FP_E40C + loc_3 * 24;
    loc_12 = W_E40E;
    *(int *)((char *)&loc_14 + 0) = bx - 0x30a;
    t3 = far_b1ad0(2, 0);
    loc_4 = loc_14->f_b;
    t4 = far_b3723(MK_FP(SEG_DATA, 0x5b2c), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 4, 0x640000L, 8, (void far *)far_da8a5);
    t5 = far_b1ad0(2, 14);
    loc_5 = loc_14->f_14;
    t6 = far_b3723(MK_FP(SEG_DATA, 0x5b2c), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_5), 4, 0x640000L, 8, (void far *)far_da8a5);
    far_b1ad0(2, 27);
    loc_e = loc_14->f_9;
    t7 = far_b3819(MK_FP(SEG_DATA, 0x5b34), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_e), 4, -240, 240, 0);
    t8 = far_b1ad0(3, 0);
    loc_6 = loc_14->f_c;
    t9 = far_b3723(MK_FP(SEG_DATA, 0x5b3a), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 4, 0x640000L, 8, (void far *)far_da8a5);
    t10 = far_b1ad0(3, 14);
    loc_7 = loc_14->f_15;
    t11 = far_b3723(MK_FP(SEG_DATA, 0x5b41), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_7), 4, 0x640000L, 8, (void far *)far_da8a5);
    t12 = far_b1ad0(3, 27);
    loc_8 = loc_14->f_6;
    t13 = far_b362e(MK_FP(SEG_DATA, 0x5b49), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), MK_FP(SEG_DATA, 0x5902), 8);
    t14 = far_b1ad0(4, 0);
    loc_9 = loc_14->f_d;
    t15 = far_b362e(MK_FP(SEG_DATA, 0x5b4f), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_9), MK_FP(SEG_DATA, 0x5912), 5);
    t16 = far_b1ad0(4, 14);
    loc_a = loc_14->f_13;
    t17 = far_b3819(MK_FP(SEG_DATA, 0x5b57), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), 3, 0, 100, 8);
    t18 = far_b1ad0(4, 27);
    loc_b = loc_14->f_7;
    t19 = far_b8ff3(loc_b, 4, 36);
    t20 = far_b1ad0(5, 27);
    loc_c = loc_14->f_8;
    p30 = 0xc482;
    p28 = loc_c;
    t21 = far_b8ff3(p28, 5, 36);
    far_b1ad0(6, 0);
    t22 = far_b90dd();
    far_b1ad0(7, 0);
    p26 = 0x5a8d;
    ax8 = far_b1b05(MK_FP(SEG_DATA, p26));
    loc_1 = (char)0;
    goto L1;
L2:
    ax9 = B_7B8D;
    if (ax9 <= 11) {
        goto L3;
    }
    goto L4;
L3:
    switch ((unsigned int)(unsigned)(TBL_c583a + (ax9 << 1))) {
    case 0:
        goto L5;
    case 1:
        goto L6;
    case 2:
        goto L7;
    case 3:
        goto L8;
    case 4:
        goto L9;
    case 5:
        goto L10;
    case 6:
        goto L11;
    case 7:
        goto L12;
    case 8:
        goto L13;
    case 9:
        goto L14;
    case 10:
        goto L15;
    case 11:
        goto L16;
    }
L6:
    t27 = far_b8ff3(loc_3, 0, 31);
L5:
    t28 = far_c6547(loc_2 - 1);
    t29 = (long)(signed char)loc_3 * 24L;
    bx2 = FP_E40C + (int)t29;
    loc_12 = W_E40E;
    *(int *)((char *)&loc_14 + 0) = bx2 - 0x30a;
    es = loc_12;
    loc_4 = *(char far *)MK_FP(es, bx2 - 0x2ff);
    loc_5 = *(char far *)MK_FP(es, bx2 - 0x2f6);
    loc_e = *(int far *)MK_FP(es, bx2 - 0x301);
    loc_6 = *(char far *)MK_FP(es, bx2 - 0x2fe);
    loc_7 = *(char far *)MK_FP(es, bx2 - 0x2f5);
    loc_8 = *(char far *)MK_FP(es, bx2 - 0x304);
    loc_9 = *(char far *)MK_FP(es, bx2 - 0x2fd);
    loc_a = *(char far *)MK_FP(es, bx2 - 0x2f7);
    loc_b = *(char far *)MK_FP(es, bx2 - 0x303);
    loc_c = *(char far *)MK_FP(es, bx2 - 0x302);
    loc_10 = 2;
    goto L17;
L18:
    t34 = far_b1073(*(char *)((char *)&loc_10 + 0));
    loc_10 = loc_10 + 1;
L17:
    if (loc_10 <= 11) {
        goto L18;
    }
    t30 = far_c530b(loc_b, 4, 34);
    t31 = far_b8ff3(loc_b, 4, 36);
    p30 = 0xc482;
    t32 = far_c530b(loc_c, 5, 34);
    p26 = 5;
    p28 = loc_c;
    t33 = far_b8ff3(p28, p26, 36);
    goto L4;
L7:
    loc_14->f_b = loc_4;
    goto L4;
L8:
    loc_14->f_14 = loc_5;
    goto L4;
L9:
    loc_14->f_9 = loc_e;
    goto L4;
L10:
    loc_14->f_c = loc_6;
    goto L4;
L11:
    loc_14->f_15 = loc_7;
    goto L4;
L12:
    loc_14->f_6 = loc_8;
    goto L4;
L13:
    loc_14->f_d = loc_9;
    goto L4;
L14:
    loc_14->f_13 = loc_a;
    goto L4;
L15:
    ax11 = ((char)(ax9 >> 8) << 8 | (unsigned char)loc_b);
    loc_14->f_7 = (char)ax11;
    p30 = 0xc482;
    t25 = far_c530b(ax11, 4, 34);
    p26 = 4;
    p28 = loc_b;
    t26 = far_b8ff3(p28, p26, 36);
    goto L4;
L16:
    ax10 = ((char)(ax9 >> 8) << 8 | (unsigned char)loc_c);
    loc_14->f_8 = (char)ax10;
    p30 = 0xc482;
    t23 = far_c530b(ax10, 5, 34);
    p26 = 5;
    p28 = loc_c;
    t24 = far_b8ff3(p28, p26, 36);
L4:
    t36 = far_b08f7(129);
    loc_1 = (char)t36;
    if ((char)t36 != 0) {
        goto L19;
    }
    goto L2;
L19:
    if ((char)t36 == 120) {
        goto L20;
    }
    goto L1;
L20:
    t35 = far_cc4e0(loc_3);
    loc_1 = (char)0;
L1:
    if (loc_1 == 0) {
        goto L4;
    }
    return ((long)UNDEF << 16 | (unsigned)loc_1);
}
long far far_c6547(int p0) { return 0; }
