/* differs: 308 at +5, 916 bytes; 311 at +5, 913 bytes; 312 at +5, 914 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[1];
};
extern char B_E550;
extern char B_E557;
extern char B_E558;
extern char TBL_79A5[];
extern unsigned char TBL_b1f7c[];
extern int W_E551;
extern int W_E553;
extern int W_E559;
extern int far far_b1ae0(int);
extern long far far_fa248(int);
extern long far fn_b1b9a(long);
extern long far fn_b1c09(int, int, int);
extern long far fn_b1cee(void far *);
long far fn_b1b9a(long p0) { return 0; }
long far fn_b1c09(int p0, int p1, int p2) { return 0; }
long far fn_b1cee(void far *p0) { return 0; }

long far far_b1d48(char far *arg_0, int arg_4)
{
    int loc_2;
    int loc_4;
    int loc_6;
    struct s1 far *loc_8;
    int ax;
    int ax2;
    int ax3;
    int bx;
    unsigned int bx2;
    int bx3;
    int bx4;
    int di;
    int dx;
    int dx2;
    int es;
    int es2;
    int es3;
    int flags;
    int flags2;
    int flags3;
    int p18;
    int p20;
    int p22;
    int si;
    int t1;
    int t10;
    int t11;
    int t12;
    long t13;
    long t14;
    long t15;
    long t16;
    long t2;
    long t3;
    long t4;
    int t5;
    int t6;
    int t7;
    int t8;
    int t9;

    ax = (int)(unsigned)&arg_4;
    loc_6 = SEG_STACK;
    *(int *)((char *)&loc_8 + 0) = ax;
L1:
    if (*arg_0 != 0) {
        bx = FP_OFF(arg_0);
        es = FP_SEG(arg_0);
        if (*(char far *)MK_FP(es, bx) != 37) {
            t1 = far_b1ae0(*(char far *)MK_FP(es, bx));
            ax = t1;
            dx = UNDEF;
        } else {
            W_E559 = 0;
            B_E557 = (char)0;
            B_E558 = (char)0;
            si = 0;
            di = 0;
            B_E550 = (char)32;
            W_E551 = 0x7fff;
            for (;;) {
                *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 1;
                dx2 = ((char)(dx >> 8) << 8 | (unsigned char)*arg_0);
                if ((TBL_79A5[(char)dx2] & 2) != 0) {
                    if (di != 0) {
                        p18 = (int)(unsigned)&arg_0;
                        p20 = 0xb1b5;
                        t2 = fn_b1cee(MK_FP(SEG_STACK, p18));
                        dx = (int)(t2 >> 16);
                        W_E551 = (int)t2;
                    } else {
                        if ((char)dx2 == 48) {
                            B_E550 = (char)48;
                        }
                        p18 = (int)(unsigned)&arg_0;
                        p20 = 0xb1b5;
                        t3 = fn_b1cee(MK_FP(SEG_STACK, p18));
                        dx = (int)(t3 >> 16);
                        W_E553 = (int)t3;
                        W_E559 = 1;
                    }
                    *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - 1;
                    continue;
                }
                t4 = far_fa248((char)dx2);
                ax = (int)t4;
                dx = (int)(t4 >> 16);
                flags = ax - 100;
                if (!CC("==", flags)) {
                    if (!CC(">", flags)) {
                        flags2 = ax - 46;
                        if (!CC("==", flags2)) {
                            if (!CC(">", flags2)) {
                                if (ax != 37) {
                                    if (ax != 45) {
                                        break;
                                    }
                                    B_E558 = (char)1;
                                    continue;
                                }
                                goto L2;
                            }
                            if (ax == 92) {
                                ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*arg_0);
                                flags3 = (char)ax2 - 110;
                                if (!CC("==", flags3)) {
                                    if (!CC(">", flags3)) {
                                        if ((char)ax2 != 97) {
                                            if ((char)ax2 != 104) {
                                                goto L3;
                                            }
                                            t6 = far_b1ae0(8);
                                            dx = UNDEF;
                                        } else {
                                            t7 = far_b1ae0(7);
                                            dx = UNDEF;
                                        }
                                    } else if ((char)ax2 != 114) {
L3:
                                        t8 = far_b1ae0((char)ax2);
                                        dx = UNDEF;
                                    } else {
                                        t9 = far_b1ae0(13);
                                        dx = UNDEF;
                                    }
                                } else {
                                    t10 = far_b1ae0(13);
                                    t11 = far_b1ae0(10);
                                    dx = UNDEF;
                                }
                                *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 1;
                                continue;
                            }
                            goto L4;
                        }
                        di = 1;
                        continue;
                    }
                    ax = ax - 108;
                    bx2 = ax;
                    if (bx2 > 12) {
                        goto L5;
                    }
                    switch ((unsigned int)(unsigned)(TBL_b1f7c + (bx2 << 1))) {
                    case 0:
                        si = 1;
                        continue;
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 8:
                    case 10:
                    case 11:
                        goto L6;
                    case 7:
                        goto L7;
                    case 9:
                        goto L8;
                    case 12:
                        goto L9;
                    }
                } else {
                    goto L10;
                }
            }
        }
        goto L6;
    }
    return ((long)dx << 16 | (unsigned)ax);
L2:
    t5 = far_b1ae0(37);
    ax = t5;
    dx = UNDEF;
    goto L6;
L4:
    if (ax == 99) {
        *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 2;
        t12 = far_b1ae0(*(int far *)MK_FP(loc_6, *(int *)((char *)&loc_8 + 0) - 2));
        ax = t12;
        dx = UNDEF;
    }
    goto L6;
L5:
    goto L6;
    goto L6;
L7:
    es2 = loc_6;
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 4;
    bx3 = *(int *)((char *)&loc_8 + 0);
    p18 = *(int far *)MK_FP(es2, bx3 - 4);
    p20 = 0xb1b5;
    t14 = fn_b1b9a(((long)*(int far *)MK_FP(es2, bx3 - 2) << 16 | (unsigned)p18));
    ax = (int)t14;
    dx = (int)(t14 >> 16);
    goto L6;
L8:
    B_E557 = (char)1;
L10:
    if (si != 0) {
        es3 = loc_6;
        *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 4;
        bx4 = *(int *)((char *)&loc_8 + 0);
        p18 = *(int far *)MK_FP(es3, bx4 - 2);
        p20 = *(int far *)MK_FP(es3, bx4 - 4);
        p22 = 0xb1b5;
        t15 = fn_b1c09(p20, p18, 10);
        ax = (int)t15;
        dx = (int)(t15 >> 16);
    } else {
        *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 2;
        ax3 = *(int far *)((char far *)loc_8 + -2);
        loc_2 = -(ax3 < 0);
        loc_4 = ax3;
        if (B_E557 != 0) {
            loc_4 = loc_4;
            loc_2 = 0;
        }
        p18 = loc_2;
        p20 = loc_4;
        p22 = 0xb1b5;
        t16 = fn_b1c09(p20, p18, 10);
        ax = (int)t16;
        dx = (int)(t16 >> 16);
    }
    goto L6;
L9:
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 2;
    p18 = 0;
    p20 = *(int far *)MK_FP(loc_6, *(int *)((char *)&loc_8 + 0) - 2);
    p22 = 0xb1b5;
    t13 = fn_b1c09(p20, p18, 16);
    ax = (int)t13;
    dx = (int)(t13 >> 16);
L6:
    *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 1;
    goto L1;
}
