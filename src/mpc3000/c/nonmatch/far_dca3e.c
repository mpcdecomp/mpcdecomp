/* differs: 308 at +0, 538 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
struct g_TBL_A067 {
    int f_0;
};
struct g_TBL_A069 {
    int f_0;
};
extern char B_880B;
extern char B_8A9B;
extern char B_901B;
extern char B_96F5;
extern char B_A570;
extern char TBL_90C1[];
extern char TBL_9F67[];
extern char TBL_9FE7[];
extern struct g_TBL_A067 TBL_A067;
extern struct g_TBL_A069 TBL_A069;
extern char TBL_A367[];
extern char TBL_A4E7[];
extern int W_8814;
extern int W_9031;
extern int W_9033;
extern void far far_d99e6(void);
extern long near fn_dcc08(void);

long far far_dca3e(void)
{
    int ax;
    int bx;
    int bx2;
    int bx3;
    int cx;
    int di;
    int dx;
    int es;
    int p10;
    int p8;
    int si;
    int t1;
    int t10;
    int t11;
    int t12;
    int t13;
    int t14;
    int t15;
    int t16;
    int t17;
    int t18;
    int t19;
    int t2;
    int t20;
    int t21;
    long t22;
    int t23;
    int t24;
    int t25;
    int t26;
    long t3;
    int t4;
    int t5;
    int t6;
    int t7;
    int t8;
    int t9;

    if (B_A570 != 0) {
        goto L1;
    }
    if (B_901B != 0) {
        goto L1;
    }
    if (B_880B == 0) {
        goto L1;
    }
    B_880B = (char)0;
    ax = SEG_DATA;
    es = ax;
    t1 = __insn("std ");
    di = -0x6085;
    cx = 128;
L2:
    ax = ((char)(ax >> 8) << 8 | (unsigned char)-1);
    t26 = __repe_scas1(MK_FP(es, di), (char)ax, cx);
    di = di + (cx - t26);
    cx = t26;
    if (CC("!=", UNDEF)) {
        goto L3;
    }
L1:
    return ((long)dx << 16 | (unsigned)ax);
L3:
    bx = cx;
    if (TBL_A4E7[bx] != -2) {
        goto L4;
    }
    goto L5;
L4:
    if (TBL_A4E7[bx] != -3) {
        goto L6;
    }
    TBL_A4E7[bx] = (char)-1;
    goto L7;
L6:
    TBL_9F67[bx] = (char)-1;
    if (W_8814 == 0) {
        goto L8;
    }
    far_d99e6();
    far_d99e6();
    far_d99e6();
    W_8814 = 0;
L8:
    far_d99e6();
    si = B_8A9B;
    TBL_90C1[si] = (char)(TBL_90C1[si] | 2);
    far_d99e6();
    far_d99e6();
    far_d99e6();
    if ((TBL_9FE7[UNDEF] & -128) != 0) {
        goto L9;
    }
    far_d99e6();
    TBL_A4E7[UNDEF] = (char)-1;
    TBL_A367[UNDEF] = (char)-1;
    t22 = fn_dcc08();
    cx = UNDEF;
    es = UNDEF;
    ax = (int)t22;
    dx = (int)(t22 >> 16);
    goto L2;
L9:
    TBL_A4E7[UNDEF] = (char)-2;
    bx3 = UNDEF << 2;
    *(int *)((char *)&TBL_A067 + 0 + bx3) = W_9031;
    *(int *)((char *)&TBL_A069 + 0 + bx3) = W_9033;
    far_d99e6();
    far_d99e6();
    far_d99e6();
    cx = UNDEF;
    es = UNDEF;
    ax = UNDEF;
    dx = UNDEF;
    B_96F5 = (char)1;
    goto L2;
L5:
    dx = ((char)(dx >> 8) << 8 | (unsigned char)TBL_A367[bx]);
    if ((TBL_9FE7[bx] & -128) == 0) {
        goto L10;
    }
    goto L11;
L10:
    TBL_A4E7[bx] = (char)-1;
    TBL_A367[bx] = (char)-1;
    p8 = W_9031;
    p10 = W_9033;
    bx2 = bx << 2;
    W_9031 = *(int *)((char *)&TBL_A067 + 0 + bx2);
    W_9033 = *(int *)((char *)&TBL_A069 + 0 + bx2);
    far_d99e6();
    t3 = fn_dcc08();
    cx = UNDEF;
    es = UNDEF;
    ax = (int)t3;
    dx = (int)(t3 >> 16);
    W_9033 = p10;
    W_9031 = p8;
L11:
    if (TBL_9F67[cx] != -1) {
        goto L7;
    }
    goto L2;
L7:
    if (W_8814 == 0) {
        goto L12;
    }
    B_96F5 = (char)1;
    far_d99e6();
    far_d99e6();
    far_d99e6();
    W_8814 = 0;
L12:
    far_d99e6();
    far_d99e6();
    far_d99e6();
    far_d99e6();
    far_d99e6();
    TBL_9F67[UNDEF] = (char)-1;
    far_d99e6();
    far_d99e6();
    cx = UNDEF;
    es = UNDEF;
    ax = UNDEF;
    dx = UNDEF;
    B_96F5 = (char)1;
    goto L2;
}
long near fn_dcc08(void) { return 0; }
