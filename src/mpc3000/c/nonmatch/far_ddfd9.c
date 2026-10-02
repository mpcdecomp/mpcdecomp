/* differs: 308 absent; 311 at +5, 815 bytes; 312 at +5, 813 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char f_0;
    char pad_1[2];
    char f_3;
};
struct g_TBL_A069 {
    int f_0;
};
struct g_TBL_A067 {
    int f_0;
};
extern char B_880B;
extern unsigned char B_901B[];
extern char B_96EE;
extern char B_96F5;
extern unsigned char B_A56F;
extern char B_A570;
extern char B_A5C0;
extern char B_A5C1;
extern char TBL_9F67[];
extern char TBL_9FE7[];
extern struct g_TBL_A067 TBL_A067;
extern struct g_TBL_A069 TBL_A069;
extern int TBL_A267[];
extern char TBL_A367[];
extern int TBL_A3E7[];
extern char TBL_A4E7[];
extern int W_8820;
extern int W_9031;
extern int W_9033;
extern int W_93F5;
extern long far far_d9b6e(int, char far *, int);
extern long far far_dad54(int);
extern long far far_dafb0(int, int, int);
extern int far far_dc15f(struct s1 far *, int);
extern long far far_dcc2e(unsigned char far *, struct s1 far *, int);

long far far_ddfd9(struct s1 far *arg_0, int arg_2, int arg_4)
{
    char loc_8;
    char loc_7;
    char loc_6;
    char loc_5;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int di;
    int di2;
    int dx2;
    int es;
    int es2;
    int es3;
    int es4;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    if (B_A5C0 == 0) {
        goto L1;
    }
    if (W_93F5 != 1) {
        goto L2;
    }
    goto L3;
L2:
    return ((long)UNDEF << 16 | (unsigned)far_dc15f(arg_0, arg_4));
L1:
    ax = (unsigned char)arg_0->f_0 & 248;
    bx = ax;
    if (B_A5C1 >= 8) {
        goto L4;
    }
    goto L3;
L4:
    if (B_A570 != 0) {
        goto L5;
    }
    goto L6;
L5:
    if (ax != 128) {
        goto L7;
    }
    goto L8;
L7:
    if (ax == 144) {
        goto L9;
    }
    goto L10;
L9:
    loc_2 = 0;
L11:
    ax = B_A56F;
    if (TBL_A4E7[ax] == -1) {
        goto L12;
    }
    ax5 = ((char)(ax >> 8) << 8 | (unsigned char)B_A56F);
    ax = ((char)(ax5 >> 8) << 8 | (unsigned char)((char)ax5 + 1));
    B_A56F = (char)ax;
    if ((unsigned char)(char)ax < 30) {
        goto L13;
    }
    B_A56F = (unsigned char)0;
L13:
    loc_2 = loc_2 + 1;
    if (loc_2 < 30) {
        goto L11;
    }
L12:
    if (loc_2 < 30) {
        goto L14;
    }
    goto L3;
L14:
    ax6 = ((char)(ax >> 8) << 8 | (unsigned char)B_A56F);
    TBL_A3E7[(unsigned char)(char)ax6] = W_8820;
    bx3 = FP_OFF(arg_0);
    es4 = FP_SEG(arg_0);
    TBL_A4E7[(unsigned char)(char)ax6] = *(char far *)MK_FP(es4, bx3 + 2);
    TBL_A367[(unsigned char)(char)ax6] = *(char far *)MK_FP(es4, bx3 + 1);
    loc_8 = (char)(*(char far *)MK_FP(es4, bx3) | -104);
    loc_7 = *(char far *)MK_FP(es4, bx3 + 1);
    loc_6 = *(char far *)MK_FP(es4, bx3 + 2);
    loc_5 = *(char far *)MK_FP(es4, bx3 + 3);
    t4 = far_dad54(1);
    ax7 = B_A56F << 2;
    bx4 = W_9031;
    *(int *)((char *)&TBL_A069 + 0 + ax7) = W_9033;
    *(int *)((char *)&TBL_A067 + 0 + ax7) = bx4;
    loc_8 = (char)64;
    loc_7 = (char)20;
    loc_6 = (char)0;
    t5 = far_d9b6e(1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), 3);
    B_96F5 = (char)1;
    return t5;
L8:
    loc_2 = 0;
L15:
    ax = ((char)(ax >> 8) << 8 | (unsigned char)TBL_A4E7[loc_2]);
    es3 = FP_SEG(arg_0);
    if ((char)ax != *(char far *)MK_FP(es3, FP_OFF(arg_0) + 2)) {
        goto L16;
    }
    ax = ((char)(ax >> 8) << 8 | (unsigned char)TBL_A367[loc_2]);
    if ((char)ax == *(char far *)MK_FP(es3, *(int *)((char *)&arg_0 + 0) + 1)) {
        goto L17;
    }
L16:
    loc_2 = loc_2 + 1;
    if (loc_2 < 30) {
        goto L15;
    }
L17:
    if (loc_2 < 30) {
        goto L18;
    }
    goto L3;
L18:
    t2 = far_dafb0(loc_2, 64, W_8820 - TBL_A3E7[loc_2]);
    TBL_A4E7[loc_2] = (char)-1;
    ax4 = ((char)((int)t2 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_2 + 0));
    B_A56F = (char)ax4;
    return (long)MK_FP((int)(t2 >> 16), ax4);
L6:
    if (bx == 128) {
        goto L19;
    }
    if (bx == 144) {
        goto L20;
    }
    goto L10;
L20:
    bx2 = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    ax = (unsigned char)*(char far *)MK_FP(es, bx2 + 2);
    di = ax;
    if (TBL_A4E7[di] != -2) {
        goto L21;
    }
    goto L3;
L21:
    B_880B = (char)1;
    TBL_9FE7[di] = (char)(*(char far *)MK_FP(es, bx2) & 7 | -128);
    TBL_A4E7[di] = *(char far *)MK_FP(es, bx2 + 3);
    TBL_A367[di] = *(char far *)MK_FP(es, bx2 + 4);
    ax2 = W_8820;
    TBL_A3E7[di] = ax2;
    return ((long)arg_4 << 16 | (unsigned)ax2);
L19:
    es2 = FP_SEG(arg_0);
    ax = (unsigned char)*(char far *)MK_FP(es2, FP_OFF(arg_0) + 2);
    di2 = ax;
    if (TBL_A4E7[di2] != -2) {
        goto L22;
    }
    loc_4 = W_8820 - TBL_A3E7[di2];
    dx2 = -1;
    if (B_96EE != 0) {
        goto L23;
    }
    dx2 = (unsigned char)*(char far *)MK_FP(es2, *(int *)((char *)&arg_0 + 0) + 3);
L23:
    t1 = far_dafb0(di2, dx2, loc_4);
    if (TBL_9F67[di2] != -1) {
        goto L24;
    }
    TBL_A4E7[di2] = (char)-1;
    return t1;
L24:
    TBL_A4E7[di2] = (char)-3;
    return t1;
L22:
    if (TBL_A4E7[di2] == -1) {
        goto L3;
    }
    if ((TBL_9FE7[di2] & -128) == 0) {
        goto L3;
    }
    B_880B = (char)1;
    TBL_9FE7[di2] = (char)(TBL_9FE7[di2] & 127);
    if (B_96EE != 0) {
        goto L25;
    }
    TBL_A367[di2] = arg_0->f_3;
L25:
    ax3 = W_8820;
    TBL_A267[di2] = ax3;
    return ((long)arg_4 << 16 | (unsigned)ax3);
L10:
    t3 = far_dcc2e((unsigned char far *)B_901B, arg_0, arg_4);
    ax = (int)t3;
    arg_4 = (int)(t3 >> 16);
    B_96F5 = (char)1;
L3:
    return ((long)arg_4 << 16 | (unsigned)ax);
}
