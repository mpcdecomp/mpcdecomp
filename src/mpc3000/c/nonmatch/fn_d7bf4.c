/* differs: 308 absent; 311 at +3, 1305 bytes; 312 at +3, 1308 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
struct g_W_8C31 {
    long f_0;
};
extern char TBL_A5CF[];
extern char TBL_A633[];
extern char TBL_A787[];
extern char TBL_A79B[];
extern char TBL_A7AF[];
extern char TBL_A7B0[];
extern struct g_W_8C31 W_8C31;
extern int W_8C33;
extern int W_8C35;
extern int W_8C37;
extern int W_8C39;
extern int W_8C3B;
extern int W_8C3D;
extern int W_8C3F;
extern long far far_caade(long);
extern long far far_cace7(int, int, int);
extern long far far_cad00(int);
extern int far far_cad6d(char far *, int, int);
extern long far far_cadb4(int, int, int);
extern long far far_d85fa(int, int, int, int far *, int far *, char far *);
extern long far far_da9b8(int, int, int, int);
extern long far far_da9e4(int, int, int, int);
extern long far far_daa07(int, int, int, int);
extern long far far_daa3c(int, int);
extern long far far_daa59(int, int);
extern long far far_e546f(int, char far *);
extern void far far_e66a4(void);

int far fn_d7bf4(int arg_0, int arg_2)
{
    char loc_68[64];
    char loc_28[1];
    unsigned char loc_27;
    int loc_26;
    char loc_24[16];
    char loc_14[3];
    char loc_11;
    unsigned char loc_10;
    unsigned char loc_f;
    unsigned int loc_e;
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    int ax15;
    int ax16;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int cx;
    int cx2;
    int di;
    int di2;
    int di3;
    int dx;
    int dx2;
    int dx3;
    int flags;
    int si;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    int t15;
    long t16;
    long t17;
    int t18;
    long t19;
    long t2;
    long t20;
    int t21;
    long t22;
    int t23;
    int t24;
    int t25;
    int t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_cad00(0);
    t2 = far_caade(*(long *)((char *)&arg_0 + 0));
    loc_2 = (int)t2;
    if ((int)t2 < 0) {
        return (int)t2;
    }
    t3 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_28), loc_2, 6);
    if (t3 != 0) {
        return t3;
    }
    dx = loc_26;
    loc_c = *(int *)((char *)&loc_24 + 0);
    loc_e = dx;
    loc_6 = 0;
    si = 0;
    t4 = far_daa07(W_8C3D, W_8C3F, W_8C39, W_8C3B);
    flags = (int)(t4 >> 16) - loc_c;
    if (!CC(">", flags) && (CC("!=", flags) || (unsigned int)(int)t4 <= loc_e)) {
        si = 1;
    }
    ax = ((char)((int)t4 >> 8) << 8 | (unsigned char)loc_27);
    loc_4 = (unsigned char)(char)ax;
    if ((int)(unsigned char)(char)ax <= 2 || si != 0) {
        t8 = far_daa59(W_8C39, W_8C3B);
        W_8C37 = (int)(t8 >> 16);
        W_8C35 = (int)t8;
        for (;;) {
            t10 = far_d85fa(loc_2, loc_27, 0, (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_68));
            if ((int)t10 == -22 || (int)t10 == -3) {
                break;
            }
            if ((int)t10 != 0) {
                goto L1;
            }
            if (loc_4 <= 2) {
                t9 = far_e546f(loc_6, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_68));
            }
            t11 = far_da9b8(W_8C35, W_8C37, loc_a, loc_8);
            W_8C37 = (int)(t11 >> 16);
            W_8C35 = (int)t11;
        }
        t12 = far_daa3c(W_8C35, W_8C37);
        W_8C33 = (int)(t12 >> 16);
        *(int *)((char *)&W_8C31 + 0) = (int)t12;
        if ((int)t10 != -3) {
            loc_6 = 0;
        }
        goto L2;
    }
    if (loc_4 != 3) {
        return -32;
    }
    dx2 = loc_e;
    t5 = far_da9e4(W_8C39, W_8C3B, dx2 - 1, (int)(((long)loc_c << 16 | (unsigned)dx2) - 1L >> 16));
    W_8C33 = (int)(t5 >> 16);
    *(int *)((char *)&W_8C31 + 0) = (int)t5;
    t6 = far_daa59(W_8C39, W_8C3B);
    t7 = far_cadb4(4, (int)t6, (int)(t6 >> 16));
    if ((int)t7 != 0) {
        return (int)t7;
    }
L2:
    *(char far *)((char far *)W_8C31.f_0) = (char)-1;
    dx3 = loc_e;
    ax2 = (int)far_cace7(loc_2, dx3 + 6, (int)(((long)loc_c << 16 | (unsigned)dx3) + 6L >> 16));
    for (;;) {
        __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_28), 0, 20);
        t23 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_28), loc_2, 1);
        if (t23 != 0) {
            break;
        }
        if (loc_28[0] == 0) {
            goto L3;
        }
        loc_11 = loc_28[0];
        if ((unsigned char)loc_28[0] >= 250) {
            loc_11 = (char)-6;
        }
        t25 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_28), loc_2, 3);
        if (t25 != 0) {
            goto L4;
        }
        ax3 = ((char)(t25 >> 8) << 8 | (unsigned char)loc_28[0]);
        ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 - 1));
        loc_f = (char)ax4;
        if (loc_f >= 20) {
            loc_f = (unsigned char)19;
        }
        ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)loc_f);
        TBL_A79B[(unsigned char)(char)ax5] = loc_27;
        TBL_A787[(unsigned char)(char)ax5] = *(char *)((char *)&loc_26 + 0);
        if (loc_4 < 2) {
            di = 0;
            t13 = (long)(int)(unsigned char)(char)ax5 * 5L;
            cx = (int)t13;
            t14 = (long)(int)(unsigned char)(char)ax5 * 17L;
            ax6 = (int)t14;
            *(int *)((char *)&loc_14 + 0) = ax6;
            do {
                *(char *)((char *)&TBL_A5CF + 0 + di + cx) = (char)0;
                di = di + 1;
            } while (di < 5);
L5:
            loc_10 = (unsigned char)0;
            for (;;) {
                ax12 = ((char)(ax6 >> 8) << 8 | (unsigned char)loc_11);
                loc_11 = (char)(loc_11 - 1);
                if ((char)ax12 == 0) {
                    break;
                }
                t21 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_28), loc_2, 2);
                ax13 = t21;
                if (ax13 != 0) {
                    goto L6;
                }
                t22 = (long)(int)loc_f * 0x1f4L;
                ax14 = (int)t22 + (loc_10 << 1);
                TBL_A7AF[ax14] = loc_28[0];
                ax15 = ((char)(ax14 >> 8) << 8 | (unsigned char)loc_27);
                TBL_A7B0[ax14] = (char)ax15;
                ax16 = ((char)(ax15 >> 8) << 8 | (unsigned char)loc_10);
                ax6 = ((char)(ax16 >> 8) << 8 | (unsigned char)((char)ax16 + 1));
                loc_10 = (char)ax6;
            }
            continue;
        }
        t15 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_28), loc_2, 16);
        ax7 = t15;
        if (ax7 != 0) {
            goto L7;
        }
        di2 = 0;
        ax8 = ((char)(ax7 >> 8) << 8 | (unsigned char)loc_f);
        t16 = (long)(int)(unsigned char)(char)ax8 * 17L;
        *(int *)((char *)&loc_14 + 0) = (int)t16;
        t17 = (long)(int)(unsigned char)(char)ax8 * 5L;
        ax9 = (int)t17;
        do {
            ax9 = ((char)(ax9 >> 8) << 8 | (unsigned char)loc_28[di2]);
            *(char *)((char *)&TBL_A633 + 0 + di2 + *(int *)((char *)&loc_14 + 0)) = (char)ax9;
            di2 = di2 + 1;
        } while (di2 < 16);
        t18 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_28), loc_2, 5);
        ax10 = t18;
        if (ax10 != 0) {
            goto L8;
        }
        di3 = 0;
        ax11 = ((char)(ax10 >> 8) << 8 | (unsigned char)loc_f);
        t19 = (long)(int)(unsigned char)(char)ax11 * 5L;
        cx2 = (int)t19;
        t20 = (long)(int)(unsigned char)(char)ax11 * 17L;
        ax6 = (int)t20;
        *(int *)((char *)&loc_14 + 0) = ax6;
        do {
            ax6 = ((char)(ax6 >> 8) << 8 | (unsigned char)loc_28[di3]);
            *(char *)((char *)&TBL_A5CF + 0 + di3 + cx2) = (char)ax6;
            di3 = di3 + 1;
        } while (di3 < 5);
        goto L5;
    }
    return t23;
L1:
    return (int)t10;
L8:
    return ax10;
L7:
    return ax7;
L6:
    return ax13;
L4:
    return t25;
L3:
    if (loc_4 <= 1) {
        far_e66a4();
    }
    return loc_6;
}
