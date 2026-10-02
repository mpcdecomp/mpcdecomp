/* differs: 308 absent; 311 at +5, 777 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[3];
    char f_3;
};
extern char B_7B8D;
extern char B_D5DD;
extern unsigned char TBL_c29db[];
extern unsigned char TBL_c29e5[];
extern void far far_b05a7(void);
extern int far far_b08f7(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b362e(void far *, char far *, void far *, int);
extern long far far_b3819(void far *, char far *, int, int, int, int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_cbb70(int);
extern long far far_cbbd4(int);

long far fn_c2710(void)
{
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
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    unsigned int ax7;
    unsigned int ax8;
    int dx;
    int p28;
    long t1;
    long t10;
    struct s1 far *t11;
    long t12;
    long t13;
    long t14;
    long t15;
    int t16;
    int t17;
    long t18;
    int t19;
    long t2;
    int t20;
    int t21;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    int t8;
    struct s1 far *t9;

    loc_6 = (char)100;
    loc_7 = (char)50;
    loc_8 = (char)100;
    loc_9 = (char)9;
    loc_a = (char)1;
    B_D5DD = (char)31;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x517c));
    far_b1ad0(1, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x5197));
    far_b1ad0(2, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x51a2));
    t2 = far_b90dd();
    far_b1ad0(7, 0);
    ax6 = far_b1b05(MK_FP(SEG_DATA, 0x51b7));
    dx = UNDEF;
    loc_3 = (char)0;
    loc_1 = (char)0;
    loc_2 = (char)1;
    goto L1;
L2:
    far_b05a7();
    t17 = far_b1ad0(1, 10);
    t18 = far_b362e(MK_FP(SEG_DATA, 0x4fa8), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_3), MK_FP(SEG_DATA, 0x4f70), 25);
    t19 = far_b1ad0(2, 20);
    t20 = far_b1b05(MK_FP(SEG_DATA, 0x50fd));
    t21 = far_b1ad0(2, 20);
    dx = UNDEF;
    ax7 = loc_3;
    if (ax7 <= 4) {
        goto L3;
    }
    goto L4;
L3:
    switch ((unsigned int)(unsigned)(TBL_c29e5 + (ax7 << 1))) {
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
    }
L5:
    p28 = 0x4fa8;
    t7 = far_b3819(MK_FP(SEG_DATA, p28), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 3, 0, 100, 8);
    dx = (int)(t7 >> 16);
    goto L4;
L6:
    t6 = far_b362e(MK_FP(SEG_DATA, 0x4fa8), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_7), MK_FP(SEG_DATA, 100), 3);
    dx = (int)(t6 >> 16);
    goto L4;
L7:
    p28 = 0x4fa8;
    t5 = far_b3819(MK_FP(SEG_DATA, p28), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), 3, 0, 100, 8);
    dx = (int)(t5 >> 16);
    goto L4;
L8:
    t4 = far_b362e(MK_FP(SEG_DATA, 0x4fa8), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_9), MK_FP(SEG_DATA, 0x4f18), 4);
    dx = (int)(t4 >> 16);
    goto L4;
L9:
    t3 = far_b362e(MK_FP(SEG_DATA, 0x4fa8), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), MK_FP(SEG_DATA, 36), 3);
    dx = (int)(t3 >> 16);
L4:
    loc_2 = (char)0;
    goto L10;
L11:
    if (B_7B8D == 0) {
        goto L12;
    }
    goto L10;
L12:
    loc_2 = (char)1;
L10:
    if (loc_2 != 0) {
        goto L13;
    }
    t8 = far_b08f7(1);
    dx = UNDEF;
    loc_1 = (char)t8;
    if ((char)t8 == 0) {
        goto L11;
    }
L13:
    if (loc_1 == 120) {
        goto L14;
    }
    goto L1;
L14:
    ax8 = loc_3;
    if (ax8 <= 4) {
        goto L15;
    }
    goto L16;
L15:
    switch ((unsigned int)(unsigned)(TBL_c29db + (ax8 << 1))) {
    case 0:
        goto L17;
    case 1:
        goto L18;
    case 2:
        goto L19;
    case 3:
        goto L20;
    case 4:
        goto L21;
    }
L17:
    loc_5 = (char)35;
    goto L22;
L23:
    t15 = far_cbb70(loc_5);
    dx = (int)(t15 >> 16);
    *(char far *)MK_FP(dx, (int)t15) = (char)(int)t15;
    loc_5 = (char)(loc_5 + 1);
L22:
    if (loc_5 <= 98) {
        goto L23;
    }
    goto L16;
L18:
    loc_5 = (char)35;
    goto L24;
L25:
    t14 = far_cbb70(loc_5);
    dx = (int)(t14 >> 16);
    *(char far *)MK_FP(dx, (int)t14 + 1) = (char)(int)t14;
    loc_5 = (char)(loc_5 + 1);
L24:
    if (loc_5 <= 98) {
        goto L25;
    }
    goto L16;
L19:
    loc_5 = (char)35;
    goto L26;
L27:
    t13 = far_cbbd4(loc_5);
    dx = (int)(t13 >> 16);
    *(char far *)MK_FP(dx, (int)t13 + 2) = (char)(int)t13;
    loc_5 = (char)(loc_5 + 1);
L26:
    if (loc_5 <= 98) {
        goto L27;
    }
    goto L16;
L20:
    loc_5 = (char)35;
    goto L28;
L29:
    t11 = (struct s1 far *)far_cbbd4(loc_5);
    loc_4 = (char)(t11->f_3 & -128);
    t12 = far_cbbd4(loc_5);
    dx = (int)(t12 >> 16);
    *(char far *)MK_FP(dx, (int)t12 + 3) = (char)(int)t12;
    loc_5 = (char)(loc_5 + 1);
L28:
    if (loc_5 <= 98) {
        goto L29;
    }
    goto L16;
L21:
    loc_5 = (char)35;
    goto L30;
L31:
    t9 = (struct s1 far *)far_cbbd4(loc_5);
    loc_4 = (char)(t9->f_3 & 15);
    t10 = far_cbbd4(loc_5);
    dx = (int)(t10 >> 16);
    *(char far *)MK_FP(dx, (int)t10 + 3) = (char)(int)t10;
    loc_5 = (char)(loc_5 + 1);
L30:
    if (loc_5 <= 98) {
        goto L31;
    }
L16:
    loc_1 = (char)0;
L1:
    if (loc_2 != 1) {
        goto L32;
    }
    goto L2;
L32:
    return ((long)dx << 16 | (unsigned)loc_1);
}
