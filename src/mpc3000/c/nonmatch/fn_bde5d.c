/* differs: 308 at +5, 555 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_956A;
extern char B_D5DD;
extern long far far_b08f7(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b1d48(long, int);
extern long far far_b1f96(int);
extern long far far_b3b9f(int);
extern long far far_b6cd3(void far *);
extern long far far_b8f3e(int, int, int);
extern long far far_b90dd(void);
extern long far far_b9102(void);
extern long far far_cab20(int);
extern int far far_d7903(void);
extern long far far_e2ce3(void);
extern void far far_e6006(void);
extern long far fn_bd7ce(void far *);
extern int far fn_bdb81(int, int, char far *, int far *);
extern long far fn_bde17(char far *);
extern long far fn_be0d5(int, int, int, int, int);
long far fn_bd7ce(void far *p0) { return 0; }
int far fn_bdb81(int p0, int p1, char far *p2, int far *p3) { return 0; }
long far fn_bde17(char far *p0) { return 0; }

void far fn_bde5d(int arg_0, int arg_2)
{
    char loc_902[17];
    char loc_8f1[2];
    char loc_8ef[2281];
    char loc_6;
    char loc_5;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int di;
    int dx;
    int p2316;
    int p2318;
    int si;
    int si2;
    long t1;
    int t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    int t17;
    int t18;
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
    long t3;
    long t4;
    long t5;
    int t6;
    int t7;
    long t8;
    long t9;

    B_D5DD = (char)111;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x3ff5));
    t2 = far_b90dd();
    ax = far_b1b05(MK_FP(SEG_DATA, 0x4013));
    loc_2 = 0;
    dx = 0;
    do {
        di = (int)(unsigned)(loc_902 + dx);
        __movs2(MK_FP(SEG_STACK, di), MK_FP(SEG_DATA, 0x4028), 8);
        *(char far *)MK_FP(SEG_STACK, di + 8) = *(char *)(0x4030);
        *(int *)((char *)&loc_8f1 + 0 + dx) = 0;
        bx = (int)(unsigned)(loc_8ef + dx);
        *(int far *)MK_FP(SEG_STACK, bx + 2) = 0;
        *(int far *)MK_FP(SEG_STACK, bx) = 0;
        dx = dx + 23;
        loc_2 = loc_2 + 1;
    } while (dx != 0x8fc);
    ax2 = fn_bdb81(arg_0, arg_2, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_902), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4));
    if (ax2 < 0) {
        t3 = far_cab20(ax2);
        t4 = far_b3b9f(ax2);
        return;
    }
    loc_6 = (char)1;
    si = 0;
    while (si == 0) {
        t15 = far_b6cd3(MK_FP(SEG_DATA, 0x3ff5));
        t16 = fn_bde17((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_902 + loc_6 * 23)));
        t17 = far_b1ad0(2, 0);
        far_e6006();
        loc_5 = (char)UNDEF;
        t19 = far_b8f3e(loc_5, 2, 11);
        t20 = far_b1f96(31);
        t21 = far_e2ce3();
        p2316 = SEG_DATA;
        p2318 = 0x4045;
        t22 = far_b1d48(((long)p2316 << 16 | (unsigned)p2318), (int)(t21 / 0x400L));
        t23 = far_b9102();
        for (;;) {
            t24 = far_b08f7(1);
            si = (int)t24;
            if ((int)t24 != 0) {
                break;
            }
            ax4 = B_7B8D;
            if (ax4 == 0) {
                t13 = (long)(signed char)loc_6 * 23L;
                p2316 = (int)(unsigned)(loc_902 + (int)t13);
                p2318 = 0xc6d6;
                t14 = fn_bde17(MK_FP(SEG_STACK, p2316));
                continue;
            }
            if (ax4 != 1) {
                continue;
            }
            p2316 = 2;
            p2318 = loc_5;
            t12 = far_b8f3e(p2318, p2316, 11);
        }
        if (si != 120) {
            continue;
        }
        if (loc_4 >= 3) {
            goto L1;
        }
        t5 = fn_bd7ce(MK_FP(SEG_DATA, 0x3ff5));
        if ((int)t5 != 120) {
            goto L2;
        }
L1:
        B_956A = (char)(B_956A + 1);
        t6 = far_b1ad0(7, 0);
        t7 = far_b1b05(MK_FP(SEG_DATA, 0x404f));
        t8 = (long)(signed char)loc_6 * 23L;
        ax3 = (int)(unsigned)(loc_8ef + (int)t8);
        t9 = fn_be0d5(ax2, loc_4, *(int far *)MK_FP(SEG_STACK, ax3), *(int far *)MK_FP(SEG_STACK, ax3 + 2), loc_5);
        si2 = (int)t9;
        if ((int)t9 != 0) {
            goto L3;
        }
        t10 = far_d7903();
        B_956A = (char)(B_956A - 1);
        t11 = far_b9102();
        si = 0;
    }
    t27 = far_cab20(ax2);
    return;
L3:
    t25 = far_cab20(ax2);
    t26 = far_b3b9f(si2);
    return;
L2:
    return;
}
long far fn_be0d5(int p0, int p1, int p2, int p3, int p4) { return 0; }
