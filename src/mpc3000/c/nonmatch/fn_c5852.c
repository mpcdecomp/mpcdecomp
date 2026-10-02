/* differs: 308 absent; 311 absent; 312 at +5, 1076 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_FP_E40C {
    long f_0;
};
extern char B_7B8D;
extern char B_D4C0;
extern char B_D5DD;
extern char B_E421;
extern struct g_FP_E40C FP_E40C;
extern unsigned char TBL_c5c66[];
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3723(void far *, char far *, int, long, int, void far *);
extern long far far_b3819(void far *, char far *, int, int, int, int);
extern long far far_b8ff3(int, int, int);
extern long far far_b90dd(void);
extern long far far_c6547(int);
extern long far far_cc4e0(int);
extern long far far_da8a5();

long far fn_c5852(void)
{
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
    int ax7;
    int ax8;
    unsigned int ax9;
    int p16;
    int p18;
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
    long t20;
    long t21;
    long t22;
    long t23;
    long t24;
    long t25;
    long t26;
    long t27;
    long t28;
    long t29;
    long t3;
    long t30;
    int t31;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    B_D5DD = (char)3;
    far_b1aac();
    loc_2 = (char)(B_E421 + 1);
    t1 = far_b3819(MK_FP(SEG_DATA, 0x5c11), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2, 1, 24, 8);
    loc_3 = B_D4C0;
    t2 = far_b8ff3(loc_3, 0, 29);
    far_b1ad0(0, 33);
    far_b1b05(MK_FP(SEG_DATA, 0x5c25));
    loc_4 = *(char far *)((char far *)FP_E40C.f_0 + -764 + loc_3 * 24);
    t3 = far_b3819(MK_FP(SEG_DATA, 0x5c2d), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 3, 0, 100, 8);
    loc_5 = *(char far *)((char far *)FP_E40C.f_0 + -756 + loc_3 * 24);
    t4 = far_b3819(MK_FP(SEG_DATA, 0x5c38), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_5), 3, 0, 100, 8);
    loc_6 = *(char far *)((char far *)FP_E40C.f_0 + -763 + loc_3 * 24);
    t5 = far_b3819(MK_FP(SEG_DATA, 0x5c42), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 2, 0, 15, 8);
    far_b1ad0(3, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x5c49));
    loc_7 = *(char far *)((char far *)FP_E40C.f_0 + -762 + loc_3 * 24);
    t6 = far_b3723(MK_FP(SEG_DATA, 0x5bd6), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_7), 4, 0x640000L, 8, (void far *)far_da8a5);
    loc_8 = *(char far *)((char far *)FP_E40C.f_0 + -761 + loc_3 * 24);
    t7 = far_b3723(MK_FP(SEG_DATA, 0x5be4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), 4, 0x640000L, 8, (void far *)far_da8a5);
    loc_9 = *(char far *)((char far *)FP_E40C.f_0 + -760 + loc_3 * 24);
    p18 = 0;
    t8 = far_b3819(MK_FP(SEG_DATA, 0x5c72), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_9), 3, p18, 100, 8);
    far_b1ad0(6, 0);
    t9 = far_b90dd();
    far_b1ad0(7, 0);
    p16 = 0x5b37;
    ax8 = far_b1b05(MK_FP(SEG_DATA, p16));
    loc_1 = (char)0;
    goto L1;
L2:
    ax9 = B_7B8D;
    if (ax9 <= 7) {
        goto L3;
    }
    goto L4;
L3:
    switch ((unsigned int)(unsigned)(TBL_c5c66 + (ax9 << 1))) {
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
    }
L6:
    p18 = loc_3;
    t16 = far_b8ff3(p18, 0, 29);
L5:
    p16 = 0xc495;
    t17 = far_c6547(loc_2 - 1);
    t18 = (long)(signed char)loc_3 * 24L;
    loc_4 = *(char far *)((char far *)FP_E40C.f_0 + -764 + (int)t18);
    t19 = far_b1073(2);
    t20 = (long)(signed char)loc_3 * 24L;
    loc_5 = *(char far *)((char far *)FP_E40C.f_0 + -756 + (int)t20);
    t21 = far_b1073(3);
    t22 = (long)(signed char)loc_3 * 24L;
    loc_6 = *(char far *)((char far *)FP_E40C.f_0 + -763 + (int)t22);
    t23 = far_b1073(4);
    t24 = (long)(signed char)loc_3 * 24L;
    loc_7 = *(char far *)((char far *)FP_E40C.f_0 + -762 + (int)t24);
    t25 = far_b1073(5);
    t26 = (long)(signed char)loc_3 * 24L;
    loc_8 = *(char far *)((char far *)FP_E40C.f_0 + -761 + (int)t26);
    t27 = far_b1073(6);
    t28 = (long)(signed char)loc_3 * 24L;
    loc_9 = *(char far *)((char far *)FP_E40C.f_0 + -760 + (int)t28);
    t29 = far_b1073(7);
    goto L4;
L7:
    t15 = (long)(signed char)loc_3 * 24L;
    *(char far *)((char far *)FP_E40C.f_0 + -764 + (int)t15) = loc_4;
    goto L4;
L8:
    t14 = (long)(signed char)loc_3 * 24L;
    *(char far *)((char far *)FP_E40C.f_0 + -756 + (int)t14) = loc_5;
    goto L4;
L9:
    t13 = (long)(signed char)loc_3 * 24L;
    *(char far *)((char far *)FP_E40C.f_0 + -763 + (int)t13) = loc_6;
    goto L4;
L10:
    t12 = (long)(signed char)loc_3 * 24L;
    *(char far *)((char far *)FP_E40C.f_0 + -762 + (int)t12) = loc_7;
    goto L4;
L11:
    t11 = (long)(signed char)loc_3 * 24L;
    *(char far *)((char far *)FP_E40C.f_0 + -761 + (int)t11) = loc_8;
    goto L4;
L12:
    t10 = (long)(signed char)loc_3 * 24L;
    *(char far *)((char far *)FP_E40C.f_0 + -760 + (int)t10) = loc_9;
L4:
    t31 = far_b08f7(129);
    loc_1 = (char)t31;
    if ((char)t31 != 0) {
        goto L13;
    }
    goto L2;
L13:
    if ((char)t31 == 120) {
        goto L14;
    }
    goto L1;
L14:
    t30 = far_cc4e0(loc_3);
    loc_1 = (char)0;
L1:
    if (loc_1 == 0) {
        goto L4;
    }
    return ((long)UNDEF << 16 | (unsigned)loc_1);
}
long far far_c6547(int p0) { return 0; }
