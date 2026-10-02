/* differs: 308 at +5, 1134 bytes; 311 at +5, 1133 bytes; 312 at +5, 1136 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8800;
extern char B_9562;
extern char B_D5DD;
extern char B_D5DE;
extern unsigned char TBL_c06d5[];
extern unsigned char TBL_c06ed[];
extern unsigned char TBL_c06ff[];
extern void far far_b05a7(void);
extern int far far_b1aac(void);
extern long far far_b3b9f(int);
extern long far far_b3e07(void);
extern long far far_b3efe(void);
extern long far far_b52de(void);
extern long far far_b7024(void);
extern int far far_b9205(void);
extern long far far_ba406(void);
extern long far far_ba670(void);
extern long far far_bef6c(void);
extern long far far_bf0c7(void);
extern long far far_bf294(void);
extern long far far_c0743(void);
extern long far far_c0eeb(void);
extern long far far_c46bf(void);
extern long far far_c495e(void);
extern long far far_c65cd(void);
extern long far far_c6ae0(void);
extern int far far_c842f(void);
extern long far far_c936b(void);
extern long far far_ca3c4(void);
extern long far far_ca832(void);
extern long far far_e6fef(void);
extern long far far_e7069(void);
extern long far fn_c070b(int, int);

long far far_c04ab(void)
{
    char loc_6[6];
    int ax;
    int ax2;
    unsigned int bx;
    unsigned int bx2;
    unsigned int bx3;
    int dx;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int flags5;
    int p12;
    int p14;
    int p16;
    int si;
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
    int t2;
    long t20;
    long t21;
    int t22;
    long t23;
    long t24;
    long t25;
    long t26;
    long t27;
    long t28;
    long t29;
    long t3;
    long t30;
    long t31;
    long t32;
    int t33;
    int t34;
    int t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    *(int *)((char *)&loc_6 + 4) = 77;
    si = 0;
    for (;;) {
        if (si == 0) {
            far_b05a7();
            t34 = far_b1aac();
            dx = UNDEF;
            B_D5DD = (char)0;
            if (B_9562 != 0) {
                ax2 = *(int *)((char *)&loc_6 + 4);
                flags = ax2 - 71;
                if (!CC("==", flags)) {
                    if (!CC(">", flags)) {
                        if (ax2 != 66 && ax2 != 70) {
                            goto L1;
                        }
                        goto L2;
                    }
                    if (ax2 != 85) {
L1:
                        B_D5DE = loc_6[4];
                    } else {
L2:
                        p12 = -40;
                        t1 = far_b3b9f(p12);
                        t2 = far_b1aac();
                        dx = UNDEF;
                    }
                } else {
                    goto L2;
                }
            } else {
                B_D5DE = loc_6[4];
            }
            ax = B_D5DE;
            flags2 = ax - 76;
            if (!CC("!=", flags2)) {
                t3 = far_c495e();
                ax = (int)t3;
                dx = (int)(t3 >> 16);
                *(int *)((char *)&loc_6 + 4) = ax;
                continue;
            }
            if (!CC(">", flags2)) {
                flags3 = ax - 69;
                if (!CC("!=", flags3)) {
                    t4 = far_b9205();
                    ax = t4;
                    dx = UNDEF;
                    *(int *)((char *)&loc_6 + 4) = ax;
                    continue;
                }
                if (!CC(">", flags3)) {
                    flags4 = ax - 47;
                    if (!CC("!=", flags4)) {
                        t5 = far_e6fef();
                        t6 = far_bef6c();
                        ax = (int)t6;
                        dx = (int)(t6 >> 16);
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    }
                    if (!CC(">", flags4)) {
                        if (ax == 1) {
                            t7 = far_c6ae0();
                            ax = (int)t7;
                            dx = (int)(t7 >> 16);
                            *(int *)((char *)&loc_6 + 4) = ax;
                            continue;
                        }
                        if (ax == 32) {
                            si = 1;
                            continue;
                        }
                        goto L3;
                    }
                    if (ax == 65) {
                        t8 = far_e7069();
                        t9 = far_c65cd();
                        ax = (int)t9;
                        dx = (int)(t9 >> 16);
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    }
                    if (ax == 66) {
                        t10 = far_e6fef();
                        t11 = far_b3e07();
                        ax = (int)t11;
                        dx = (int)(t11 >> 16);
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    }
                    goto L3;
                }
                bx = ax - 70;
                if (bx > 5) {
                    goto L3;
                }
                switch ((unsigned int)(unsigned)(TBL_c06ff + (bx << 1))) {
                case 0:
                    t16 = far_e7069();
                    t17 = far_b52de();
                    ax = (int)t17;
                    dx = (int)(t17 >> 16);
                    *(int *)((char *)&loc_6 + 4) = ax;
                    continue;
                case 1:
                    if (B_8800 == 0) {
                        t14 = far_e6fef();
                    }
                    t15 = far_b3efe();
                    ax = (int)t15;
                    dx = (int)(t15 >> 16);
                    *(int *)((char *)&loc_6 + 4) = ax;
                    continue;
                case 2:
                case 3:
                    goto L3;
                case 4:
                    t13 = far_c0eeb();
                    ax = (int)t13;
                    dx = (int)(t13 >> 16);
                    *(int *)((char *)&loc_6 + 4) = ax;
                    continue;
                case 5:
                    t12 = far_c936b();
                    ax = (int)t12;
                    dx = (int)(t12 >> 16);
                    *(int *)((char *)&loc_6 + 4) = ax;
                    continue;
                }
            } else {
                flags5 = ax - 98;
                if (!CC("!=", flags5)) {
                    t18 = far_ba406();
                    ax = (int)t18;
                    dx = (int)(t18 >> 16);
                    *(int *)((char *)&loc_6 + 4) = ax;
                    continue;
                }
                if (!CC(">", flags5)) {
                    bx2 = ax - 77;
                    if (bx2 > 8) {
                        goto L3;
                    }
                    switch ((unsigned int)(unsigned)(TBL_c06ed + (bx2 << 1))) {
                    case 0:
                        if (B_8800 != 0) {
                            t25 = far_e7069();
                        }
                        t26 = far_bf294();
                        ax = (int)t26;
                        dx = (int)(t26 >> 16);
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    case 1:
                    case 3:
                    case 4:
                    case 7:
                        goto L3;
                    case 2:
                        t24 = far_c46bf();
                        ax = (int)t24;
                        dx = (int)(t24 >> 16);
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    case 5:
                        t23 = far_ca3c4();
                        ax = (int)t23;
                        dx = (int)(t23 >> 16);
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    case 6:
                        t21 = far_e7069();
                        t22 = far_c842f();
                        ax = t22;
                        dx = UNDEF;
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    case 8:
                        t19 = far_e7069();
                        t20 = far_b7024();
                        ax = (int)t20;
                        dx = (int)(t20 >> 16);
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    }
                } else {
                    bx3 = ax - 105;
                    if (bx3 > 11) {
                        goto L3;
                    }
                    switch ((unsigned int)(unsigned)(TBL_c06d5 + (bx3 << 1))) {
                    case 0:
                        t32 = far_ba670();
                        ax = (int)t32;
                        dx = (int)(t32 >> 16);
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    case 1:
                    case 2:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                    case 9:
L3:
                        loc_6[0] = loc_6[4];
                        loc_6[1] = (char)0;
                        p12 = SEG_STACK;
                        p14 = (int)(unsigned)loc_6;
                        p16 = 0xc03a;
                        t31 = fn_c070b(p14, p12);
                        ax = (int)t31;
                        dx = (int)(t31 >> 16);
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    case 3:
                        t29 = far_e7069();
                        t30 = far_bf0c7();
                        ax = (int)t30;
                        dx = (int)(t30 >> 16);
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    case 10:
                        t28 = far_c0743();
                        ax = (int)t28;
                        dx = (int)(t28 >> 16);
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    case 11:
                        t27 = far_ca832();
                        ax = (int)t27;
                        dx = (int)(t27 >> 16);
                        *(int *)((char *)&loc_6 + 4) = ax;
                        continue;
                    }
                }
            }
        } else {
            break;
        }
    }
    return ((long)dx << 16 | (unsigned)ax);
}
long far fn_c070b(int p0, int p1) { return 0; }
