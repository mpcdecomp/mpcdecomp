/* differs: 308 at +5, 817 bytes; 311 at +5, 818 bytes; 312 at +5, 819 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_86AE {
    int f_0;
};
extern char B_8800;
extern char B_8802;
extern char B_8804;
extern unsigned char B_901B[];
extern char B_9456;
extern char B_956A;
extern char B_F77C;
extern char B_F77D;
extern struct g_TBL_86AE TBL_86AE;
extern char TBL_86B0;
extern char TBL_86B1[];
extern char TBL_A787[];
extern char TBL_A7AF[];
extern char TBL_A7B0[];
extern unsigned char TBL_F779;
extern int TBL_F77A;
extern int W_87F2;
extern int W_87F4;
extern int W_87F6;
extern int W_87F8;
extern int W_87FA;
extern int W_87FC;
extern int W_87FE;
extern int W_902D;
extern int W_902F;
extern int W_9051;
extern int W_9053;
extern int W_A5CB;
extern long far far_d97ca(int, long, int);
extern int far far_daa82(int);
extern int far far_dccc4(int);
extern int far far_e0031(void far *);
extern long far far_e1a2c(int);
extern long far far_e3d12(unsigned char far *, long);
extern long far far_e56a0(int, int, long, int, int);
extern int far far_e5ff8(void);
extern long far far_e603d(int);
extern int far fn_e5fbc(void);

int far far_e5d7c(void)
{
    int loc_2;
    int loc_4;
    int loc_6;
    long loc_8;
    int loc_a;
    int loc_c;
    int loc_e;
    int loc_10;
    int loc_12;
    int loc_14;
    int loc_16;
    int loc_18;
    int ax;
    int ax10;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx2;
    int cx;
    char near *di;
    int dx;
    int dx2;
    int dx3;
    int es;
    int p32;
    int p34;
    int p36;
    int p38;
    int p40;
    int p42;
    int si;
    int t1;
    int t2;
    long t3;
    long t4;
    int t5;
    long t6;
    long t7;
    long t8;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)B_8804);
    if ((char)ax != B_8802) {
        goto L1;
    }
    goto L2;
L1:
    if (B_8800 != 0) {
        goto L3;
    }
    goto L2;
L3:
    t1 = fn_e5fbc();
    dx = W_9051;
    W_87F4 = W_9053;
    W_87F2 = dx;
    p34 = (int)(unsigned)B_901B;
    t2 = far_e0031(MK_FP(SEG_DATA, p34));
    ax3 = ((char)(t2 >> 8) << 8 | (unsigned char)B_8804);
    B_8802 = (char)ax3;
    loc_c = 0;
    loc_6 = 0;
    *(int *)((char *)&loc_8 + 0) = 0;
    loc_a = 0;
    TBL_86B0 = (char)0;
    B_956A = (char)(B_956A + 1);
    ax4 = (unsigned char)(char)ax3 - 1;
    loc_e = ax4;
    W_87FE = (int)far_e603d(ax4);
    loc_10 = 0;
    ax5 = loc_e * 0x1f4;
    loc_16 = ax5;
    loc_18 = 0;
L4:
    bx = loc_16;
    ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)TBL_A7AF[bx]);
    loc_12 = (unsigned char)TBL_A7B0[bx];
    if (loc_12 != 0) {
        goto L5;
    }
    goto L6;
L5:
    if ((unsigned char)TBL_A787[loc_e] - 1 != loc_10) {
        goto L7;
    }
    W_A5CB = loc_c + 1;
    W_87F8 = loc_6;
    W_87F6 = *(int *)((char *)&loc_8 + 0);
L7:
    p32 = (unsigned char)(char)ax6;
    bx2 = UNDEF;
    cx = UNDEF;
    es = UNDEF;
    ax5 = far_dccc4(p32);
    dx2 = UNDEF;
    if (ax5 == 0) {
        goto L8;
    }
    goto L9;
L8:
    ax5 = loc_18;
    loc_14 = ax5;
    goto L10;
L11:
    TBL_F779 = (unsigned char)0;
    si = loc_14;
    di = &TBL_86B0 + loc_14;
    goto L12;
L13:
    dx3 = W_902D;
    loc_2 = W_902F;
    loc_4 = dx3;
    p32 = 0x640;
    p34 = SEG_DATA;
    p36 = (int)(unsigned)&TBL_F779;
    p38 = 1;
    t3 = far_d97ca(p38, ((long)p34 << 16 | (unsigned)p36), p32);
    bx2 = UNDEF;
    cx = UNDEF;
    es = UNDEF;
    dx2 = (int)(t3 >> 16);
    ax5 = TBL_F779 & 248;
    if (ax5 == 136) {
        goto L14;
    }
    if (ax5 == 168) {
        goto L15;
    }
    goto L12;
L14:
    p32 = TBL_F77A;
    t5 = far_daa82(p32);
    bx2 = UNDEF;
    cx = UNDEF;
    es = UNDEF;
    ax5 = t5;
    dx2 = -(ax5 < 0);
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + ax5;
    loc_6 = (int)(loc_8 + ((long)dx2 << 16 | (unsigned)ax5) >> 16);
    goto L12;
L15:
    ax7 = ((char)(ax5 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_12 + 0));
    p32 = ax7;
    p34 = ((char)(ax7 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_10 + 0));
    p36 = loc_2;
    p38 = loc_4;
    loc_c = loc_c + 1;
    p40 = loc_c;
    p42 = 0;
    t4 = far_e56a0(p42, p40, ((long)p36 << 16 | (unsigned)p38), p34, p32);
    bx2 = UNDEF;
    cx = UNDEF;
    es = UNDEF;
    dx2 = (int)(t4 >> 16);
    ax8 = ((char)((int)t4 >> 8) << 8 | (unsigned char)*di);
    if ((char)ax8 != B_F77C) {
        goto L16;
    }
    ax5 = ((char)(ax8 >> 8) << 8 | (unsigned char)TBL_86B1[si]);
    if ((char)ax5 == B_F77D) {
        goto L12;
    }
L16:
    if (*di == 0) {
        goto L17;
    }
    si = si + 4;
    di = di + 4;
    loc_14 = loc_14 + 4;
    loc_18 = loc_18 + 4;
    loc_a = loc_a + 1;
L17:
    ax9 = loc_c;
    *(int *)((char *)&TBL_86AE + 0 + si) = ax9;
    ax10 = ((char)(ax9 >> 8) << 8 | (unsigned char)B_F77C);
    *di = (char)ax10;
    ax5 = ((char)(ax10 >> 8) << 8 | (unsigned char)B_F77D);
    TBL_86B1[si] = (char)ax5;
L12:
    if (TBL_F779 == -1) {
        goto L18;
    }
    goto L13;
L18:
    loc_12 = loc_12 - 1;
L10:
    if (loc_12 == 0) {
        goto L9;
    }
    goto L11;
L9:
    loc_16 = loc_16 + 2;
    loc_10 = loc_10 + 1;
    if (loc_10 >= 250) {
        goto L6;
    }
    goto L4;
L6:
    t6 = far_e56a0(0, 0, *(long *)((char *)&loc_4 + 0), (char)(*(char *)((char *)&loc_10 + 0) - 1), 0);
    if (TBL_86B0 != 0) {
        goto L19;
    }
    TBL_86AE.f_0 = 1;
    TBL_86B0 = (char)4;
    TBL_86B1[0] = (char)4;
L19:
    loc_a = loc_a + 1;
    *(int *)((char *)&TBL_86AE + 0 + (loc_a << 2)) = -1;
    W_87FC = loc_6;
    W_87FA = *(int *)((char *)&loc_8 + 0);
    B_956A = (char)(B_956A - 1);
    t7 = far_e1a2c(loc_e);
    B_9456 = (char)(int)t7;
    if ((char)(int)t7 != 0) {
        goto L20;
    }
    t8 = far_e3d12((unsigned char far *)B_901B, *(long *)((char *)&W_87F2 + 0));
L20:
    ax = far_e5ff8();
L2:
    return ax;
}
int far far_e5ff8(void) { return 0; }
int far fn_e5fbc(void) { return 0; }
