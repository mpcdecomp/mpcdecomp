/* differs: 308 at +5, 946 bytes; 311 at +5, 951 bytes; 312 at +5, 950 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_8456 {
    int f_0;
};
struct g_TBL_8458 {
    int f_0;
};
struct g_TBL_845A {
    int f_0;
};
struct g_TBL_8832 {
    int f_0;
};
struct g_TBL_8830 {
    int f_0;
};
struct g_TBL_8834 {
    int f_0;
};
extern unsigned char B_8455;
extern char B_8A88;
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char B_901C;
extern char B_956A;
extern struct g_TBL_8456 TBL_8456;
extern struct g_TBL_8458 TBL_8458;
extern struct g_TBL_845A TBL_845A;
extern int TBL_882E;
extern struct g_TBL_8830 TBL_8830;
extern struct g_TBL_8832 TBL_8832;
extern struct g_TBL_8834 TBL_8834;
extern char TBL_A787[];
extern char TBL_A79B[];
extern char TBL_A7AF[];
extern char TBL_A7B0[];
extern char TBL_F779;
extern int W_87EE;
extern int W_87F6;
extern int W_87F8;
extern int W_8C63;
extern int W_8C65;
extern int W_9039;
extern int W_903B;
extern int W_903D;
extern int W_903F;
extern int W_904B;
extern int W_904D;
extern long far far_d9b6e();
extern long far far_deeab();
extern int far far_deee8();
extern int far far_e0031();
extern long far far_e1a2c();
extern int far far_e1e11();
extern long far far_e2ce3();
extern long far far_e51be();
extern long far far_e57c8();
extern long far far_e598e();
extern int far far_e59bd();
extern int far far_e5a2b();
extern int far far_e5a58();
extern long far far_e5a99();
extern long far far_e603d();
extern long far far_e64fc();
extern long far far_e65be();
extern long far far_e68c8();
extern int far fn_e63ef();
extern int far fn_e6472();
extern int far fn_e64c6();

long far far_e611c(int arg_0, int arg_2)
{
    char loc_28[40];
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    unsigned int dx;
    int dx2;
    unsigned int dx3;
    unsigned int dx4;
    int dx5;
    int dx6;
    int dx7;
    int es;
    int flags;
    int p48;
    int p50;
    int p52;
    int p54;
    int si;
    long t1;
    int t10;
    int t11;
    long t12;
    int t13;
    long t14;
    long t15;
    long t16;
    long t17;
    long t18;
    long t19;
    int t2;
    long t20;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_e603d(arg_0);
    if ((int)t1 > 0x3e7) {
        return (long)MK_FP((int)(t1 >> 16), -13);
    }
    t2 = fn_e6472(arg_0, arg_2);
    *(int *)((char *)&loc_28 + 38) = t2;
    if (t2 != 0) {
        return ((long)UNDEF << 16 | (unsigned)t2);
    }
    t3 = far_e2ce3();
    *(int *)((char *)&loc_28 + 30) = (int)(t3 >> 16);
    *(int *)((char *)&loc_28 + 28) = (int)t3;
    t4 = far_e64fc(arg_0);
    *(int *)((char *)&loc_28 + 34) = (int)(t4 >> 16);
    *(int *)((char *)&loc_28 + 32) = (int)t4;
    if (((int)t4 | *(int *)((char *)&loc_28 + 34)) == 0) {
        return (long)MK_FP((int)(t4 >> 16), -14);
    }
    ax = *(int *)((char *)&loc_28 + 30);
    dx = *(int *)((char *)&loc_28 + 28);
    flags = ax - *(int *)((char *)&loc_28 + 34);
    if (!CC(">", flags) && (CC("<", flags) || dx < (unsigned int)*(int *)((char *)&loc_28 + 32))) {
        return ((long)dx << 16 | (unsigned)-3);
    }
    *(int *)((char *)&loc_28 + 36) = 1;
    t5 = far_e598e();
    B_956A = (char)(B_956A + 1);
    t6 = far_e68c8(arg_0, arg_2);
    *(int *)((char *)&loc_28 + 38) = (int)t6;
    if ((int)t6 != 0) {
        far_e1e11(arg_2);
        far_e59bd();
        B_956A = (char)(B_956A - 1);
        return ((long)UNDEF << 16 | (unsigned)*(int *)((char *)&loc_28 + 38));
    }
    t7 = (long)(int)arg_0 * 0x1f4L;
    ax4 = ((char)((int)t7 >> 8) << 8 | (unsigned char)TBL_A7AF[(int)t7]);
    loc_28[23] = (char)ax4;
    t8 = far_e51be((unsigned char far *)B_901B, (unsigned char)(char)ax4, 1);
    far_e5a2b();
    far_e0031((unsigned char far *)B_901B);
    p50 = arg_2;
    p52 = SEG_DATA;
    p54 = (int)(unsigned)B_901B;
    es = UNDEF;
    ax7 = (int)far_e51be(((long)p52 << 16 | (unsigned)p54), p50, 0);
    si = 1;
    loc_28[22] = (char)0;
    *(int *)((char *)&loc_28 + 26) = 0;
    *(int *)((char *)&loc_28 + 24) = 0;
    for (;;) {
        ax8 = ((char)(ax7 >> 8) << 8 | (unsigned char)loc_28[22]);
        p48 = (unsigned char)(char)ax8 << 1;
        ax9 = arg_0 * 0x1f4 + p48;
        *(int *)((char *)&loc_28 + 18) = ax9;
        dx2 = ((char)(p48 >> 8) << 8 | (unsigned char)TBL_A7B0[ax9]);
        if ((char)dx2 != 0) {
            loc_28[23] = TBL_A7AF[*(int *)((char *)&loc_28 + 18)];
            ax10 = (unsigned char)TBL_A787[arg_0] - 1;
            if (ax10 == (unsigned char)(char)ax8) {
                *(int *)((char *)&loc_28 + 36) = si;
            }
            loc_28[21] = (char)dx2;
            while (loc_28[21] != 0) {
                p54 = (int)(unsigned)B_8C41;
                t9 = far_e51be(MK_FP(SEG_DATA, p54), (unsigned char)loc_28[23], 1);
                p52 = (int)(unsigned)B_8C41;
                t10 = far_deee8(MK_FP(SEG_DATA, p52), 1);
                p50 = 0xe611;
                t11 = fn_e63ef(si);
                es = UNDEF;
                si = t11;
                dx3 = *(int *)((char *)&loc_28 + 24);
                dx4 = dx3 + W_8C63;
                ax10 = *(int *)((char *)&loc_28 + 26) + W_8C65 + (dx4 < dx3);
                *(int *)((char *)&loc_28 + 26) = ax10;
                *(int *)((char *)&loc_28 + 24) = dx4;
                loc_28[21] = (char)(loc_28[21] - 1);
            }
            ax11 = ((char)(ax10 >> 8) << 8 | (unsigned char)loc_28[22]);
            ax7 = ((char)(ax11 >> 8) << 8 | (unsigned char)((char)ax11 + 1));
            loc_28[22] = (char)ax7;
            continue;
        }
        break;
    }
    TBL_F779 = (char)-1;
    t12 = far_d9b6e(1, (char far *)&TBL_F779, 1);
    W_904B = si - 1;
    dx5 = *(int *)((char *)&loc_28 + 24);
    W_903F = *(int *)((char *)&loc_28 + 26);
    W_903D = dx5;
    t13 = far_e5a58();
    B_901C = (char)(B_901C & -2);
    B_901C = (char)(B_901C | TBL_A79B[arg_0]);
    if (TBL_A79B[arg_0] != 0) {
        W_904D = *(int *)((char *)&loc_28 + 36);
    } else {
        W_904D = 1;
    }
    *(int *)((char *)&loc_28 + 38) = (int)far_e1a2c(arg_0);
    loc_28[21] = (char)0;
    if ((unsigned char)loc_28[21] < B_8455) {
        do {
            t14 = (long)(int)(unsigned char)loc_28[21] * 6L;
            dx6 = *(int *)((char *)&TBL_8456 + 0 + (int)t14);
            *(int *)((char *)&TBL_8832 + 0 + (int)t14) = *(int *)((char *)&TBL_8458 + 0 + (int)t14);
            *(int *)((char *)&TBL_8830 + 0 + (int)t14) = dx6;
            *(int *)((char *)&TBL_8834 + 0 + (int)t14) = *(int *)((char *)&TBL_845A + 0 + (int)t14);
            loc_28[21] = (char)(loc_28[21] + 1);
        } while ((unsigned char)loc_28[21] < B_8455);
    }
    t15 = (long)(int)B_8455 * 6L;
    *(int *)((char *)&TBL_8832 + 0 + (int)t15) = 0;
    *(int *)((char *)&TBL_8830 + 0 + (int)t15) = 0;
    *(int *)((char *)&TBL_8834 + 0 + (int)t15) = 0;
    dx7 = W_87F6;
    W_903B = W_87F8;
    W_9039 = dx7;
    TBL_882E = W_87EE;
    B_8A88 = B_8455;
    fn_e64c6(arg_0);
    far_e0031((unsigned char far *)B_901B);
    t16 = far_e65be(arg_0, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_28));
    t17 = far_e57c8(arg_2, -1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_28));
    t18 = far_e51be((unsigned char far *)B_901B, arg_2, 1);
    t19 = far_e5a99((unsigned char far *)B_901B);
    t20 = far_deeab();
    B_956A = (char)(B_956A - 1);
    return (long)MK_FP((int)(t20 >> 16), *(int *)((char *)&loc_28 + 38));
}
int far fn_e63ef(int p0) { return 0; }
int far fn_e6472(int p0, int p1) { return 0; }
int far fn_e64c6(int p0) { return 0; }
