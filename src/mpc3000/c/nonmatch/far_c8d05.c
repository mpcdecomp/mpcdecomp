/* differs: 308 at +5, 1190 bytes; 311 at +5, 1191 bytes; 312 at +5, 1189 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char f_0;
    char pad_1[1];
    int f_2;
    char f_4;
    int f_5;
};
struct s2 {
    char pad_0[1420];
    int f_58c;
    int f_58e;
};
extern char B_96EE;
extern char B_F22C;
extern char B_F22D;
extern char B_F234;
extern char B_F235;
extern unsigned char TBL_c9156[];
extern int W_F22E;
extern int W_F230;
extern int W_F232;
extern int W_F236;
extern int W_F238;
extern int W_F23A;
extern int far far_b1ae0();
extern int far far_b1b05();
extern int far far_b1b2b();
extern int far far_b1d48();
extern int far far_b1f96();
extern long far far_b362e();
extern long far far_b3723();
extern long far far_b3819();
extern void far far_b3843();
extern long far far_b38d8();
extern long far far_b9045();
extern long far far_da8cb();
extern long far far_da8dd();
extern int far far_da970();
extern int far far_daa82();
extern int far far_de4c2();
extern void far fn_c916e();

long far far_c8d05(struct s1 far *arg_2, int arg_4, int arg_6)
{
    char loc_3[3];
    char loc_4;
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
    int ax9;
    struct s2 near *bx;
    int bx2;
    int bx3;
    int dx;
    int es;
    int es2;
    long t1;
    int t10;
    int t11;
    long t12;
    int t13;
    int t14;
    int t15;
    int t16;
    int t17;
    int t18;
    int t19;
    int t2;
    int t20;
    long t21;
    long t22;
    long t23;
    int t24;
    long t25;
    int t26;
    long t27;
    long t28;
    long t29;
    int t3;
    int t30;
    long t4;
    int t5;
    long t6;
    long t7;
    int t8;
    int t9;

    if (arg_6 == 0) {
        far_b1f96(40);
        return ((long)UNDEF << 16 | (unsigned)12);
    }
    t1 = far_da8cb((char far *)&B_F22C);
    ax2 = far_de4c2(arg_2);
    if (ax2 > 1 && ax2 < 13) {
        bx = (struct s2 near *)(ax2 << 2);
        ax3 = far_b1b05(*(long *)((char near *)bx + 1420));
    }
    if ((unsigned int)(ax2 - 1) > 11) {
        goto L1;
    }
    switch ((unsigned int)(unsigned)(TBL_c9156 + (ax2 - 1 << 1))) {
    case 0:
        if (B_96EE == 0) {
            t18 = far_b1b05(MK_FP(SEG_DATA, 0x6585));
            far_b3843(((long)arg_4 << 16 | (unsigned)(*(int *)((char *)&arg_2 + 0) + 2)));
            t20 = far_b1f96(19);
            t21 = far_b3819(MK_FP(SEG_DATA, 0x6580), *(int *)((char *)&arg_2 + 0) + 3, arg_4, 3, 1, 127, 10);
            t22 = far_b3819(MK_FP(SEG_DATA, 0x658b), *(int *)((char *)&arg_2 + 0) + 4, arg_4, 3, 0, 127, 10);
        } else {
            t23 = far_b3819(MK_FP(SEG_DATA, 0x657d), *(int *)((char *)&arg_2 + 0) + 2, arg_4, 2, 35, 98, 8);
            t24 = far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_3), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4));
            t25 = far_b9045((unsigned char)*(char far *)((char far *)arg_2 + 2), loc_3[0], loc_4, 8);
            t26 = far_b1f96(19);
            t27 = far_b3819(MK_FP(SEG_DATA, 0x6580), *(int *)((char *)&arg_2 + 0) + 3, arg_4, 3, 1, 127, 10);
            B_F22C = (char)(arg_2->f_0 & 3);
            t28 = far_b362e(MK_FP(SEG_DATA, 0x6583), (char far *)&B_F22C, MK_FP(SEG_DATA, 0x64e0), 3);
            W_F22E = (unsigned char)arg_2->f_4;
            t29 = far_b3723(MK_FP(SEG_DATA, 0x657e), (int far *)&W_F22E, 4, 0x7f0000L, 0, (void far *)far_da8dd);
        }
        t30 = far_b1f96(34);
        W_F230 = far_daa82(arg_2->f_5);
        dx = (int)(far_b3819(MK_FP(SEG_DATA, 0x6590), (int far *)&W_F230, 4, 1, 0x270f, 0) >> 16);
        goto L2;
    case 1:
        t14 = far_b1f96(18);
        t15 = far_b1b05(MK_FP(SEG_DATA, 0x6585));
        far_b3843(((long)arg_4 << 16 | (unsigned)(*(int *)((char *)&arg_2 + 0) + 2)));
        fn_c916e(*(int *)((char *)&arg_2 + 0) + 3, arg_4);
        dx = UNDEF;
        goto L2;
    case 2:
        t11 = far_b1ae0(58);
        B_F234 = (char)(*(char far *)((char far *)arg_2 + 2) + 9);
        t12 = far_b38d8((char far *)&B_F234);
        fn_c916e(*(int *)((char *)&arg_2 + 0) + 3, arg_4);
        dx = UNDEF;
        goto L2;
    case 3:
        B_F22D = (char)(*(char far *)((char far *)arg_2 + 2) + 1);
        t10 = far_b1f96(33);
        dx = (int)(far_b3819(MK_FP(SEG_DATA, 0x6593), (char far *)&B_F22D, 3, 1, 128, 8) >> 16);
        goto L2;
    case 4:
        fn_c916e(*(int *)((char *)&arg_2 + 0) + 2, arg_4);
        dx = UNDEF;
        goto L2;
    case 5:
        W_F232 = far_daa82(arg_2->f_2) - 0x2000;
        t8 = far_b1f96(31);
        dx = (int)(far_b3819(MK_FP(SEG_DATA, 0x6593), (int far *)&W_F232, 5, -0x2000, 0x1fff, 0) >> 16);
        goto L2;
    case 6:
        W_F236 = 1;
        B_F235 = *(char far *)((char far *)arg_2 + 2);
        W_F23A = arg_6 - 2;
        W_F238 = arg_6 - 2;
        t6 = far_b3819(MK_FP(SEG_DATA, 0x6598), (int far *)&W_F23A, 4, 1, 0x5dc, 0);
        t7 = far_b3819(MK_FP(SEG_DATA, 0x659f), (int far *)&W_F236, 4, 1, 0x5dc, 0);
        dx = (int)(far_b3819(MK_FP(SEG_DATA, 0x65a6), (char far *)&B_F235, 3, 0, 127, 8) >> 16);
        goto L2;
    case 7:
    case 8:
    case 9:
        t3 = far_b1f96(22);
        bx2 = FP_OFF(arg_2);
        es = FP_SEG(arg_2);
        *(char far *)MK_FP(es, bx2 + 7) = (char)(*(char far *)MK_FP(es, bx2 + 7) & 63);
        t4 = far_b362e(MK_FP(SEG_DATA, 0x65ad), ((long)arg_4 << 16 | (unsigned)(*(int *)((char *)&arg_2 + 0) + 7)), MK_FP(SEG_DATA, 0x274), 3);
        bx3 = FP_OFF(arg_2);
        es2 = FP_SEG(arg_2);
        if ((unsigned char)*(char far *)MK_FP(es2, bx3 + 8) > 100) {
            *(char far *)MK_FP(es2, bx3 + 8) = (char)100;
        }
        t5 = far_b1f96(33);
        if (ax2 == 9) {
            dx = (int)(far_b362e(MK_FP(SEG_DATA, 0x6593), ((long)arg_4 << 16 | (unsigned)(*(int *)((char *)&arg_2 + 0) + 8)), MK_FP(SEG_DATA, 100), 3) >> 16);
        } else {
            dx = (int)(far_b3819(MK_FP(SEG_DATA, 0x6593), *(int *)((char *)&arg_2 + 0) + 8, arg_4, 3, 0, 100, 8) >> 16);
        }
        goto L2;
    case 10:
L1:
        if (arg_2->f_0 == -1) {
            far_b1b05(MK_FP(SEG_DATA, 0x65b2));
            far_b1f96(40);
            return ((long)UNDEF << 16 | (unsigned)ax2);
        }
        ax7 = far_b1b05(MK_FP(SEG_DATA, 0x65c4));
        if (arg_6 > 8) {
            arg_6 = 8;
        }
        *(int *)((char *)&loc_3 + 1) = 0;
        for (;;) {
            ax8 = arg_6;
            arg_6 = arg_6 - 1;
            if (ax8 == 0) {
                break;
            }
            ax10 = *(int *)((char *)&loc_3 + 1);
            *(int *)((char *)&loc_3 + 1) = *(int *)((char *)&loc_3 + 1) + 1;
            t2 = far_b1d48(MK_FP(SEG_DATA, 0x65d2), (unsigned char)*(char far *)((char far *)arg_2 + ax10));
        }
        ax9 = far_b1f96(40);
        dx = UNDEF;
        goto L2;
    case 11:
        ax4 = far_b1f96(40);
        dx = UNDEF;
L2:
        if (B_96EE != 0) {
            ax11 = far_da970(3);
            dx = UNDEF;
        }
        return ((long)dx << 16 | (unsigned)ax2);
    }
}
void far fn_c916e(int p0, int p1) { }
