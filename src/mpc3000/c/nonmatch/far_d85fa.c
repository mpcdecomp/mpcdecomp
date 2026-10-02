/* differs: 308 absent; 311 at +3, 2033 bytes; 312 at +3, 2035 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define UNDEF 0
struct s1 {
    char pad_0[25];
    char f_19;
    char f_1a;
    int f_1b;
    int f_1d;
    char pad_1f[11];
    char f_2a;
    char f_2b;
    char pad_2c[290];
    char f_14e;
    char f_14f;
    char f_150;
};
struct s2 {
    char f_0;
    char pad_1[22];
    char f_17;
    int f_18;
    int f_1a;
    char pad_1c[4];
    int f_20;
    char pad_22[165];
    char f_c7;
    char f_c8;
    char f_c9;
};
extern unsigned char B_8802;
extern unsigned char B_8AA0;
extern unsigned char B_8C42;
extern unsigned char B_901C;
extern unsigned char TBL_83D1;
extern unsigned char TBL_F294[];
extern char TBL_F779;
extern unsigned char TBL_F77A[];
extern unsigned char W_8C31;
extern unsigned char W_8C33;
extern char W_8C35;
extern unsigned char W_8C37;
extern int far far_cad6d(char far *, int, int);
extern long far far_cadb4(int, int, int);
extern void far far_cb3de(long);
extern long far far_da25f(long, long, long);
extern long far far_da9e4(int, int, int, int);
extern long far far_daa07(int, int, int, int);
extern long far far_daa59(int, int);
extern long far far_e2ce3(void);
extern long far fn_d8b37(int);

long far far_d85fa(int arg_0, int arg_2, int arg_4, long arg_6, int far *arg_10, long arg_14)
{
    int loc_22;
    long loc_20;
    int loc_1e;
    struct s1 far *loc_1c;
    int loc_1a;
    struct s2 far *loc_18;
    int loc_16;
    int loc_14;
    int loc_12;
    int loc_10;
    int loc_e;
    int loc_c;
    int loc_a;
    long loc_8;
    int loc_6;
    unsigned int loc_4;
    int loc_2;
    unsigned int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx10;
    int bx11;
    int bx12;
    int bx13;
    int bx14;
    int bx15;
    int bx2;
    unsigned int bx3;
    unsigned int bx4;
    int bx5;
    int bx6;
    int bx7;
    int bx8;
    int bx9;
    unsigned int cx;
    unsigned int cx2;
    unsigned int cx3;
    int cx4;
    int cx5;
    int cx6;
    unsigned int cx7;
    int cx8;
    int cx9;
    int di;
    int di2;
    int di3;
    int di4;
    int di5;
    int di6;
    int di7;
    int di8;
    int ds;
    int ds2;
    int dx;
    int dx10;
    int dx11;
    int dx12;
    unsigned int dx13;
    int dx14;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int dx7;
    int dx8;
    int dx9;
    int es;
    int es10;
    int es11;
    int es12;
    int es13;
    int es14;
    int es15;
    int es16;
    int es17;
    int es18;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int es9;
    int flags;
    int p42;
    int si;
    int si2;
    int si3;
    int si4;
    int si5;
    int si6;
    int si7;
    int t1;
    int t10;
    long t11;
    long t12;
    long t13;
    int t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    int t9;

    *arg_10 = 0;
    if (arg_2 != 3) {
        goto L1;
    }
    si = 0x151;
    goto L2;
L1:
    si = 202;
L2:
    t1 = far_cad6d((char far *)&TBL_F779, arg_0, 1);
    if (t1 == 0) {
        goto L3;
    }
    return ((long)UNDEF << 16 | (unsigned)t1);
L3:
    if (TBL_F779 != -1) {
        goto L4;
    }
    return ((long)UNDEF << 16 | (unsigned)-22);
L4:
    t2 = far_cad6d((unsigned char far *)TBL_F77A, arg_0, si - 1);
    if (t2 == 0) {
        goto L5;
    }
    return ((long)UNDEF << 16 | (unsigned)t2);
L5:
    if (arg_2 != 3) {
        goto L6;
    }
    loc_1a = SEG_DATA;
    *(int *)((char *)&loc_1c + 0) = (int)(unsigned)&TBL_F779;
    bx = FP_OFF(loc_1c);
    es = FP_SEG(loc_1c);
    dx = *(int far *)MK_FP(es, bx + 1);
    loc_e = *(int far *)MK_FP(es, bx + 3);
    loc_10 = dx;
    loc_12 = *(char far *)MK_FP(es, bx + 0x150);
    loc_14 = *(char far *)MK_FP(es, bx + 0x14f);
    *arg_10 = *(char far *)MK_FP(es, bx);
    ds = SEG_DATA;
    goto L7;
L6:
    loc_16 = SEG_DATA;
    *(int *)((char *)&loc_18 + 0) = (int)(unsigned)&TBL_F779;
    bx2 = FP_OFF(loc_18);
    es2 = FP_SEG(loc_18);
    dx2 = *(int far *)MK_FP(es2, bx2 + 1);
    loc_e = *(int far *)MK_FP(es2, bx2 + 3) & 255;
    loc_10 = dx2;
    loc_12 = *(char far *)MK_FP(es2, bx2 + 201);
    loc_14 = *(char far *)MK_FP(es2, bx2 + 200);
    *arg_10 = *(char far *)MK_FP(es2, bx2);
    __movs2(arg_14, ((long)loc_16 << 16 | (unsigned)(*(int *)((char *)&loc_18 + 0) + 135)), 64);
    ds = SEG_DATA;
L7:
    if (arg_2 != 1) {
        goto L8;
    }
    t3 = (long)(int)loc_12 * 21L;
    cx = loc_10;
    cx2 = cx + (int)t3;
    loc_6 = loc_e + -((int)t3 < 0) + (cx2 < cx);
    *(int *)((char *)&loc_8 + 0) = cx2;
    goto L9;
L8:
    bx3 = loc_10;
    bx4 = bx3 + loc_12 * 24;
    loc_6 = loc_e + (bx4 < bx3);
    *(int *)((char *)&loc_8 + 0) = bx4;
L9:
    t4 = (long)(int)loc_14 * 6L;
    loc_22 = (int)t4;
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + (int)t4;
    loc_6 = (int)(loc_8 + (unsigned long)(unsigned int)(int)t4 >> 16);
    dx3 = loc_10;
    bx5 = (int)arg_6;
    es3 = (int)(arg_6 >> 16);
    *(int far *)MK_FP(es3, bx5 + 2) = (int)(((long)loc_e << 16 | (unsigned)dx3) + 0x151L >> 16);
    *(int far *)MK_FP(es3, bx5) = dx3 + 0x151;
    ax = loc_12 * 24 + loc_22;
    *(int far *)MK_FP(es3, bx5) = *(int far *)MK_FP(es3, bx5) + ax;
    *(int far *)MK_FP(es3, bx5 + 2) = (int)(*(long far *)MK_FP(es3, bx5) + (unsigned long)(unsigned int)ax >> 16);
    *(char far *)MK_FP(ds, (unsigned)&B_901C) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_901C) & -3);
    *(char far *)MK_FP(ds, (unsigned)&B_8C42) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_8C42) & -3);
    *(char far *)MK_FP(ds, (unsigned)&B_8802) = (char)0;
    *(char far *)MK_FP(ds, (unsigned)&B_8AA0) = (char)0;
    t5 = far_e2ce3();
    loc_2 = (int)(t5 >> 16);
    loc_4 = (int)t5;
    bx6 = (int)arg_6;
    es4 = (int)(arg_6 >> 16);
    dx4 = *(int far *)MK_FP(es4, bx6);
    ax2 = (int)(((long)*(int far *)MK_FP(es4, bx6 + 2) << 16 | (unsigned)dx4) + 100L >> 16);
    flags = ax2 - loc_2;
    if (CC("<", flags)) {
        goto L10;
    }
    if (CC(">", flags)) {
        goto L11;
    }
    if ((unsigned int)(dx4 + 100) <= loc_4) {
        goto L10;
    }
L11:
    return ((long)(dx4 + 100) << 16 | (unsigned)-3);
L10:
    bx7 = (int)arg_6;
    es5 = (int)(arg_6 >> 16);
    t6 = far_da9e4(*(int far *)MK_FP(ds, (unsigned)&W_8C31), *(int far *)MK_FP(ds, (unsigned)&W_8C33), *(int far *)MK_FP(es5, bx7), *(int far *)MK_FP(es5, bx7 + 2));
    loc_a = (int)(t6 >> 16);
    loc_c = (int)t6;
    t7 = far_daa07(*(int far *)MK_FP(ds, (unsigned)&W_8C31), *(int far *)MK_FP(ds, (unsigned)&W_8C33), *(int far *)MK_FP(ds, (unsigned)&W_8C35), *(int far *)MK_FP(ds, (unsigned)&W_8C37));
    dx5 = (int)(t7 + 1L >> 16);
    loc_e = dx5;
    loc_10 = (int)t7 + 1;
    t8 = far_da25f(*(long far *)MK_FP(ds, (unsigned)&W_8C31), *(long *)((char *)&loc_c + 0), ((long)dx5 << 16 | (unsigned)((int)t7 + 1)));
    *(int far *)MK_FP(ds, (unsigned)&W_8C33) = loc_a;
    *(int far *)MK_FP(ds, (unsigned)&W_8C31) = loc_c;
    if (arg_2 != 3) {
        goto L12;
    }
    di = (int)*(long far *)MK_FP(ds, (unsigned)&W_8C35);
    es6 = (int)(*(long far *)MK_FP(ds, (unsigned)&W_8C35) >> 16);
    ax3 = loc_1a;
    si2 = *(int *)((char *)&loc_1c + 0);
    __movs2(MK_FP(es6, di), ((long)ax3 << 16 | (unsigned)si2), 0x150);
    *(char far *)MK_FP(es6, di + 0x150) = *(char far *)MK_FP(ax3, si2 + 0x150);
    ds2 = ds;
    goto L13;
L12:
    dx6 = *(int far *)MK_FP(ds, (unsigned)&W_8C35);
    loc_1a = *(int far *)MK_FP(ds, (unsigned)&W_8C37);
    *(int *)((char *)&loc_1c + 0) = dx6;
    *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&W_8C35)) = loc_18->f_0;
    bx8 = FP_OFF(loc_18);
    es7 = FP_SEG(loc_18);
    dx7 = *(int far *)MK_FP(es7, bx8 + 1);
    bx9 = FP_OFF(loc_1c);
    es8 = FP_SEG(loc_1c);
    *(int far *)MK_FP(es8, bx9 + 3) = *(int far *)MK_FP(es7, bx8 + 3) & 255;
    *(int far *)MK_FP(es8, bx9 + 1) = dx7;
    bx10 = FP_OFF(loc_18);
    es9 = FP_SEG(loc_18);
    dx8 = *(int far *)MK_FP(es9, bx10 + 4);
    bx11 = FP_OFF(loc_1c);
    es10 = FP_SEG(loc_1c);
    *(int far *)MK_FP(es10, bx11 + 7) = *(int far *)MK_FP(es9, bx10 + 6) & 255;
    *(int far *)MK_FP(es10, bx11 + 5) = dx8;
    ax4 = loc_1a;
    si3 = *(int *)((char *)&loc_1c + 0);
    es11 = FP_SEG(loc_18);
    cx3 = ~__repne_scas1(MK_FP(es11, FP_OFF(loc_18) + 7), 0, -1);
    ax5 = ds;
    dx9 = 16 - cx3;
    if (cx3 <= 16) {
        goto L14;
    }
    cx3 = cx3 + dx9;
    dx9 = 0;
L14:
    cx4 = cx3 >> 1;
    __movs2(((long)ax4 << 16 | (unsigned)(si3 + 9)), MK_FP(es11, si3 + 9), cx4 * 2);
    di2 = si3 + 9 + cx4 * 2;
    cx5 = cx3 & 1;
    __movs1(((long)ax4 << 16 | (unsigned)di2), MK_FP(es11, si3 + 9 + cx4 * 2), cx5);
    __stos1(((long)ax4 << 16 | (unsigned)(di2 + cx5)), 0, dx9);
    loc_1c->f_19 = (char)0;
    loc_1c->f_1a = loc_18->f_17;
    loc_1c->f_1b = loc_18->f_18;
    loc_1c->f_1d = loc_18->f_1a;
    bx12 = FP_OFF(loc_18);
    es12 = FP_SEG(loc_18);
    dx10 = *(int far *)MK_FP(es12, bx12 + 28);
    bx13 = FP_OFF(loc_1c);
    es13 = FP_SEG(loc_1c);
    *(int far *)MK_FP(es13, bx13 + 33) = *(int far *)MK_FP(es12, bx12 + 30);
    *(int far *)MK_FP(es13, bx13 + 31) = dx10;
    es14 = FP_SEG(loc_1c);
    *(int far *)MK_FP(es14, FP_OFF(loc_1c) + 35) = loc_18->f_20;
    di3 = *(int *)((char *)&loc_1c + 0);
    ax6 = loc_16;
    si4 = *(int *)((char *)&loc_18 + 0);
    __movs2(MK_FP(es14, di3 + 37), ((long)ax6 << 16 | (unsigned)(si4 + 34)), 4);
    *(char far *)MK_FP(es14, di3 + 41) = *(char far *)MK_FP(ax6, si4 + 38);
    ds2 = ax5;
    loc_1c->f_14e = loc_18->f_c7;
    loc_1c->f_14f = loc_18->f_c8;
    loc_1c->f_150 = loc_18->f_c9;
    si5 = 0;
    di4 = *(int *)((char *)&loc_1c + 0) + 42;
L15:
    far_cb3de(((long)loc_1a << 16 | (unsigned)di4));
    di4 = di4 + 4;
    si5 = si5 + 1;
    if (si5 < 64) {
        goto L15;
    }
    si6 = 0;
    cx6 = *(int *)((char *)&loc_18 + 0);
L16:
    di5 = 0;
    if (si6 == 0) {
        goto L17;
    }
    di5 = si6 + 2;
L17:
    di6 = *(char far *)MK_FP(ds2, (unsigned)&TBL_83D1 + di5) - 35;
    *(char far *)((char far *)loc_1c + 42 + (di6 << 2)) = (char)(*(char far *)MK_FP(loc_16, cx6 + 39) * 25 / 32);
    *(char far *)((char far *)loc_1c + 43 + (di6 << 2)) = (char)(*(char far *)MK_FP(loc_16, cx6 + 71) * 25 / 32);
    cx6 = cx6 + 1;
    si6 = si6 + 1;
    if (si6 < 32) {
        goto L16;
    }
L13:
    if (arg_4 != 1) {
        goto L18;
    }
    ax7 = *(int far *)MK_FP(ds2, (unsigned)&W_8C37);
    dx11 = *(int far *)MK_FP(ds2, (unsigned)&W_8C35);
    loc_1a = ax7;
    *(int *)((char *)&loc_1c + 0) = dx11;
    si7 = *(int far *)MK_FP(ds2, (unsigned)&W_8C35);
    es15 = ds2;
    cx7 = ~__repne_scas1((unsigned char far *)MK_FP(es15, (unsigned int)(unsigned)TBL_F294), 0, -1);
    p42 = ds2;
    dx12 = 16 - cx7;
    if (cx7 <= 16) {
        goto L19;
    }
    cx7 = cx7 + dx12;
    dx12 = 0;
L19:
    cx8 = cx7 >> 1;
    __movs2(((long)ax7 << 16 | (unsigned)(si7 + 9)), MK_FP(es15, si7 + 9), cx8 * 2);
    di7 = si7 + 9 + cx8 * 2;
    cx9 = cx7 & 1;
    __movs1(((long)ax7 << 16 | (unsigned)di7), MK_FP(es15, si7 + 9 + cx8 * 2), cx9);
    __stos1(((long)ax7 << 16 | (unsigned)(di7 + cx9)), 0, dx12);
    ds2 = p42;
    loc_1c->f_19 = (char)0;
L18:
    dx13 = *(int far *)MK_FP(ds2, (unsigned)&W_8C35);
    loc_1e = *(int far *)MK_FP(ds2, (unsigned)&W_8C37) + (dx13 + 0x151 < dx13);
    *(int *)((char *)&loc_20 + 0) = dx13 + 0x151;
    if (arg_2 != 1) {
        goto L20;
    }
    goto L21;
L22:
    t10 = far_cad6d((char far *)MK_FP(ds2, (unsigned int)(unsigned)&TBL_F779), arg_0, 21);
    if (t10 == 0) {
        goto L23;
    }
    return ((long)UNDEF << 16 | (unsigned)t10);
L23:
    di8 = (int)loc_20;
    es16 = (int)(loc_20 >> 16);
    __movs2(MK_FP(es16, di8), (char far *)MK_FP(ds2, (unsigned int)(unsigned)&TBL_F779), 20);
    *(char far *)MK_FP(es16, di8 + 20) = *(char far *)MK_FP(ds2, (unsigned)&TBL_F779 + 20);
    t11 = fn_d8b37(*(int far *)MK_FP(es16, *(int *)((char *)&loc_20 + 0) + 3));
    bx14 = (int)loc_20;
    es17 = (int)(loc_20 >> 16);
    *(int far *)MK_FP(es17, bx14 + 3) = (int)t11;
    *(char far *)MK_FP(es17, bx14 + 21) = (char)100;
    *(char far *)MK_FP(es17, bx14 + 22) = (char)0;
    *(char far *)MK_FP(es17, bx14 + 23) = (char)0;
    *(int *)((char *)&loc_20 + 0) = *(int *)((char *)&loc_20 + 0) + 24;
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) - 21;
    loc_6 = (int)(loc_8 - 21L >> 16);
L21:
    ax8 = loc_12;
    loc_12 = loc_12 - 1;
    if (ax8 != 0) {
        goto L22;
    }
L20:
    t12 = far_daa59(*(int *)((char *)&loc_20 + 0), loc_1e);
    t13 = far_cadb4(4, (int)t12, (int)(t12 >> 16));
    dx14 = *(int far *)MK_FP(ds2, (unsigned)&W_8C35);
    loc_1a = *(int far *)MK_FP(ds2, (unsigned)&W_8C37);
    *(int *)((char *)&loc_1c + 0) = dx14;
    loc_12 = loc_1c->f_150;
    loc_1e = (int)(((long)*(int far *)MK_FP(ds2, (unsigned)&W_8C37) << 16 | (unsigned)dx14) + 0x151L >> 16);
    *(int *)((char *)&loc_20 + 0) = dx14 + 0x151;
    if (arg_2 > 2) {
        goto L24;
    }
    goto L25;
L26:
    bx15 = (int)loc_20;
    es18 = (int)(loc_20 >> 16);
    if ((*(char far *)MK_FP(es18, bx15 + 2) & 4) == 0) {
        goto L27;
    }
    *(char far *)MK_FP(es18, bx15 + 3) = (char)-1;
    *(char far *)MK_FP(es18, bx15 + 4) = (char)-1;
L27:
    *(int *)((char *)&loc_20 + 0) = *(int *)((char *)&loc_20 + 0) + 24;
L25:
    ax9 = loc_12;
    loc_12 = loc_12 - 1;
    if (ax9 != 0) {
        goto L26;
    }
L24:
    return ((long)(dx14 + 0x151) << 16 | (unsigned)(int)t13);
}
long far fn_d8b37(int p0) { return 0; }
