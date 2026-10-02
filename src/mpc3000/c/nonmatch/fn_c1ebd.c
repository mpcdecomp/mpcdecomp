/* differs: 308 at +5, 956 bytes; 311 at +5, 955 bytes; 312 at +5, 955 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[2];
    char f_2;
};
extern char B_7B8D;
extern char B_8A9F;
extern char B_901B;
extern char B_9482;
extern char B_D4B5;
extern char B_D4BB;
extern char B_D4BF;
extern char TBL_9483[];
extern long far far_b129e(void);
extern int far far_b1aac(void);
extern int far far_ba0a7(int);
extern long far far_c12e7(void);
extern long far far_cbbd4(int);
extern int far far_dab06(int);
extern long far far_e15e2(int);
extern long far far_ebde1(int, int);
extern long far fn_c1326(int, int, int);
extern long far fn_c1556(int, int, int, int);
extern long far fn_c15bf(int);
extern long far fn_c1805(int, int);
extern long far fn_c1d38(int, int, int, int);
extern long far fn_c1da7(int);
extern long far fn_c1e3d(void);
long far far_c12e7(void) { return 0; }
long far fn_c1326(int p0, int p1, int p2) { return 0; }
long far fn_c1556(int p0, int p1, int p2, int p3) { return 0; }
long far fn_c15bf(int p0) { return 0; }
long far fn_c1805(int p0, int p1) { return 0; }
long far fn_c1d38(int p0, int p1, int p2, int p3) { return 0; }
long far fn_c1da7(int p0) { return 0; }
long far fn_c1e3d(void) { return 0; }

long far fn_c1ebd(void)
{
    int loc_2;
    struct s1 far *loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    int loc_c;
    int loc_e;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int bx;
    int cx;
    int di;
    int dx;
    int dx2;
    int es;
    int flags;
    int flags2;
    int flags3;
    int p22;
    int p24;
    int p26;
    int p28;
    int p30;
    int si;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    int t14;
    long t15;
    long t16;
    long t17;
    long t18;
    long t19;
    long t2;
    long t20;
    long t21;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    B_7B8D = (char)0;
    ax = far_b1aac();
    if (B_901B < 0) {
        ax2 = (int)far_e15e2(B_8A9F);
    }
    dx = (int)((long)(signed char)B_D4BF % 16L);
    di = dx;
    loc_6 = 0;
    loc_c = 0;
    loc_a = 0;
    loc_8 = 0;
    p24 = 0;
    p26 = dx;
    p28 = B_D4B5;
    p30 = 0xca37;
    dx2 = (int)(fn_c1556(p28, p26, p24, 0) >> 16);
    for (;;) {
        if (loc_8 == 0) {
            p22 = 0;
            bx = UNDEF;
            cx = UNDEF;
            es = UNDEF;
            ax3 = far_ba0a7(p22);
            dx2 = UNDEF;
            loc_6 = ax3;
            flags = ax3 - 72;
            if (!CC("!=", flags)) {
                if (B_D4BB == 0) {
                    t1 = far_c12e7();
                    t2 = far_b129e();
                    dx2 = (int)(t2 >> 16);
                    B_D4BB = (char)1;
                    continue;
                }
                continue;
            }
            if (!CC(">", flags)) {
                flags2 = ax3 - 60;
                if (!CC("!=", flags2)) {
                    if (di == 0) {
                        continue;
                    }
                    if (loc_a != 0) {
                        di = di - 1;
                        continue;
                    }
                    t3 = fn_c1da7(di);
                    di = di - 1;
                    p24 = loc_c;
                    p26 = 0xca37;
                    t4 = fn_c1805(p24, di);
                    dx2 = (int)(t4 >> 16);
                    continue;
                }
                if (!CC(">", flags2)) {
                    if (ax3 == 33) {
                        loc_c = 0;
                        p24 = 0;
                        p26 = loc_a;
                        p28 = 0xca37;
                        t5 = fn_c1326(p26, p24, di);
                        dx2 = (int)(t5 >> 16);
                        continue;
                    }
                    if (ax3 == 43) {
                        goto L1;
                    }
                    if (ax3 == 45) {
L1:
                        p24 = di;
                        p26 = loc_c;
                        p28 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_6 + 0));
                        p30 = 0xca37;
                        t6 = fn_c1d38(p28, p26, p24, loc_a);
                        dx2 = (int)(t6 >> 16);
                        continue;
                    }
                    goto L2;
                }
                if (ax3 == 62) {
                    if (di >= 15) {
                        continue;
                    }
                    if (loc_a != 0) {
                        di = di + 1;
                        continue;
                    }
                    t7 = fn_c1da7(di);
                    di = di + 1;
                    p24 = loc_c;
                    p26 = 0xca37;
                    t8 = fn_c1805(p24, di);
                    dx2 = (int)(t8 >> 16);
                    continue;
                }
                if (ax3 == 68) {
                    si = B_D4BF;
                    ax4 = B_D4B5;
                    if (ax4 != 0) {
                        if (ax4 != 16) {
                            if (ax4 != 32) {
                                if (si < 48) {
                                    continue;
                                }
                                goto L3;
                            }
                            if (si < 32) {
                                continue;
                            }
                            if (si >= 48) {
                                continue;
                            }
                            goto L3;
                        }
                        if (si < 16) {
                            continue;
                        }
                        if (si >= 32) {
                            continue;
                        }
                        goto L3;
                    }
                    if (si >= 16) {
                        continue;
                    }
L3:
                    if (loc_a == 0) {
                        p24 = 0xca37;
                        t9 = fn_c1da7(di);
                    }
                    t10 = (long)(int)si;
                    dx2 = (int)(t10 % 16L);
                    di = dx2;
                    if (loc_a != 0) {
                        continue;
                    }
                    t11 = fn_c1da7(dx2);
                    p24 = loc_c;
                    p26 = 0xca37;
                    t12 = fn_c1805(p24, di);
                    dx2 = (int)(t12 >> 16);
                    continue;
                }
                goto L2;
            }
            flags3 = ax3 - 100;
            if (!CC("!=", flags3)) {
                p24 = loc_c;
                p26 = di;
                p28 = B_D4B5;
                p30 = 0xca37;
                t13 = fn_c1556(p28, p26, p24, loc_a);
                dx2 = (int)(t13 >> 16);
                continue;
            }
            if (!CC(">", flags3)) {
                if (ax3 == 80) {
                    if (B_9482 != 3) {
                        continue;
                    }
                    loc_e = 0;
                    do {
                        si = loc_e + B_D4B5;
                        if (TBL_9483[si] != -1) {
                            t14 = far_dab06(si);
                            t15 = far_cbbd4(t14);
                            loc_2 = (int)(t15 >> 16);
                            *(int *)((char *)&loc_4 + 0) = (int)t15;
                            loc_4->f_2 = TBL_9483[si];
                            p22 = loc_e;
                            p24 = 0xca37;
                            t16 = fn_c15bf(p22);
                            bx = UNDEF;
                            cx = UNDEF;
                            es = UNDEF;
                            dx2 = (int)(t16 >> 16);
                            TBL_9483[si] = (char)-1;
                        }
                        loc_e = loc_e + 1;
                    } while (loc_e < 16);
                    B_9482 = (char)0;
                    continue;
                }
                if (ax3 != 94) {
                    goto L2;
                }
                loc_c = 1;
                p24 = 1;
                p26 = loc_a;
                p28 = 0xca37;
                t17 = fn_c1326(p26, p24, di);
                dx2 = (int)(t17 >> 16);
                continue;
            }
            if (ax3 == 104) {
                if (B_D4BB != 0) {
                    t18 = fn_c1e3d();
                    dx2 = (int)(t18 >> 16);
                    B_D4BB = (char)0;
                    continue;
                }
                continue;
            }
            if (ax3 != 120) {
L2:
                p24 = loc_6;
                t19 = far_ebde1(p24, 0);
                dx2 = (int)(t19 >> 16);
                loc_6 = (int)t19;
                if (loc_6 != 0) {
                    t20 = far_c12e7();
                    dx2 = (int)(t20 >> 16);
                    loc_8 = 1;
                    continue;
                }
                continue;
            }
            ax5 = 0 - (loc_a != 0);
            loc_a = ax5 + 1;
            p24 = loc_c;
            p26 = ax5 + 1;
            p28 = 0xca37;
            t21 = fn_c1326(p26, p24, di);
            dx2 = (int)(t21 >> 16);
            continue;
        }
        break;
    }
    return ((long)dx2 << 16 | (unsigned)loc_6);
}
