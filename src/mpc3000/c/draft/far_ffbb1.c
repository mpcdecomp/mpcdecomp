/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9F;
extern unsigned char B_8C41[];
extern char B_901B;
extern int W_903D;
extern int W_903F;
extern int W_947A;
extern int W_947E;
extern int W_9480;
extern long far L_d2667(int, int);
extern long far L_ecd9c(int, int, int);
extern long far L_ece95(int far *);
extern int far far_e0031(unsigned char far *);
extern int far far_e1e11(int);
extern long far far_e51be(char far *, int, int);
extern long far far_e598e(void);
extern int far far_e59bd(void);
extern void far far_e5a21(void);
extern long far far_e5a99(char far *);
extern long far far_e7341(int, int, int, int, int);
extern int far far_eadf4(char far *, int, int, int far *);
extern long far far_eb007(char far *, long, unsigned long far *);
long far L_ecd9c(int p0, int p1, int p2) { return 0; }
long far L_ece95(int far *p0) { return 0; }

long far far_ffbb1(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8)
{
    int loc_38;
    int loc_36;
    int loc_34;
    int loc_32;
    int loc_30;
    int loc_2e;
    int loc_2c;
    int loc_2a;
    int loc_28;
    int loc_26;
    int loc_24;
    int loc_22;
    int loc_20;
    int loc_1e;
    int loc_1c;
    int loc_1a;
    char loc_18[4];
    int loc_14;
    int loc_12;
    unsigned int loc_10;
    int loc_e;
    unsigned long loc_c;
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
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int cx;
    unsigned int cx2;
    unsigned int cx3;
    unsigned int cx4;
    unsigned int cx5;
    int cx6;
    int cx7;
    int cx8;
    int cx9;
    int dx;
    int dx10;
    int dx11;
    int dx12;
    int dx13;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int dx7;
    int dx8;
    int dx9;
    int flags;
    int flags2;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    int t15;
    long t2;
    long t3;
    long t4;
    int t5;
    int t6;
    int t7;
    int t8;
    long t9;

    if (B_901B < 0) {
        return ((long)dx << 16 | (unsigned)0);
    }
    if (arg_4 <= 0) {
        return ((long)dx << 16 | (unsigned)0);
    }
    t1 = far_e51be((char far *)&B_901B, B_8A9F, 1);
    t2 = far_e5a99((char far *)&B_901B);
    t3 = far_eb007((char far *)&B_901B, *(long *)((char *)&W_947E + 0), (unsigned long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_c));
    t4 = far_eb007((char far *)&B_901B, *(long *)((char *)&W_947A + 0), (unsigned int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_10));
    if (arg_2 == 0) {
        flags2 = -(arg_4 < 0) - loc_a;
        if (CC(">", flags2) || !CC("!=", flags2) && (unsigned int)arg_4 > (unsigned int)*(int *)((char *)&loc_c + 0)) {
            t8 = far_eadf4((char far *)&B_901B, arg_4, -(arg_4 < 0), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4));
            loc_6 = 1;
            loc_8 = 0x100;
            ax = arg_4;
            cx9 = loc_10;
            loc_12 = (int)(((long)loc_e << 16 | (unsigned)cx9) - (long)(int)ax >> 16);
            loc_14 = cx9 - ax;
        } else {
            dx6 = W_947E;
            loc_2 = W_9480;
            loc_4 = dx6;
            cx8 = *(int *)((char *)&loc_c + 0);
            t7 = far_eadf4((char far *)&B_901B, cx8 - arg_4, (int)(((long)loc_a << 16 | (unsigned)cx8) - (long)(int)arg_4 >> 16), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8));
            dx7 = loc_10;
            dx8 = dx7 - *(int *)((char *)&loc_c + 0);
            ax = (int)(((long)loc_e << 16 | (unsigned)dx7) - loc_c >> 16);
            loc_12 = ax;
            loc_14 = dx8;
        }
    } else {
        cx = W_903D;
        bx = (int)(((long)W_903F << 16 | (unsigned)cx) - (long)(int)arg_4 >> 16);
        flags = bx - loc_e;
        if (CC("<u", flags) || !CC("!=", flags) && (unsigned int)(cx - arg_4) < loc_10) {
            dx5 = W_947E;
            loc_2 = W_9480;
            loc_4 = dx5;
            cx4 = *(int *)((char *)&loc_c + 0);
            cx5 = cx4 + arg_4;
            t6 = far_eadf4((char far *)&B_901B, cx5, loc_a + -(arg_4 < 0) + (cx5 < cx4), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8));
            ax = arg_4;
            cx6 = W_903D;
            cx7 = cx6 - *(int *)((char *)&loc_c + 0);
            loc_12 = FP_SEG(MK_FP((int)(((long)W_903F << 16 | (unsigned)cx6) - loc_c >> 16), cx7) - (long)(int)ax);
            loc_14 = cx7 - ax;
        } else {
            dx2 = W_947E;
            loc_2 = W_9480;
            loc_4 = dx2;
            cx2 = *(int *)((char *)&loc_c + 0);
            cx3 = cx2 + arg_4;
            t5 = far_eadf4((char far *)&B_901B, cx3, loc_a + -(arg_4 < 0) + (cx3 < cx2), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8));
            dx3 = loc_10;
            dx4 = dx3 - *(int *)((char *)&loc_c + 0);
            ax = (int)(((long)loc_e << 16 | (unsigned)dx3) - loc_c >> 16);
            loc_12 = ax;
            loc_14 = dx4;
        }
    }
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)B_8A9F);
    t9 = far_e598e();
    t10 = L_ecd9c((char)ax2, loc_14, loc_12);
    if ((int)t10 != 0) {
        far_e0031((unsigned char far *)B_8C41);
        far_e0031((char far *)&B_901B);
        far_e1e11(0);
        far_e59bd();
        return ((long)UNDEF << 16 | (unsigned)(int)t10);
    }
    loc_34 = 0;
    *(int *)((char *)&loc_18 + 0) = 0;
    dx9 = arg_6;
    loc_1a = arg_8;
    loc_1c = dx9;
    loc_38 = (char)ax2;
    loc_36 = 0;
    ax7 = arg_0;
    loc_2e = ax7;
    loc_28 = ax7;
    loc_26 = 1;
    dx10 = W_903D;
    loc_1e = W_903F;
    loc_20 = dx10;
    dx11 = loc_4;
    loc_30 = loc_2;
    loc_32 = dx11;
    loc_2a = 1;
    loc_2c = 0x100;
    dx12 = loc_14;
    loc_22 = loc_12;
    loc_24 = dx12;
    t11 = L_ece95((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_38));
    if ((int)t11 != 0) {
        far_e0031((char far *)&B_901B);
        far_e1e11(0);
        far_e59bd();
        return ((long)UNDEF << 16 | (unsigned)(int)t11);
    }
    t12 = far_e51be((char far *)&B_901B, (char)ax2, 1);
    t13 = far_e7341(arg_0, arg_6, arg_8, 0, 0);
    loc_38 = 0;
    loc_34 = 1;
    loc_36 = (char)ax2;
    loc_30 = 1;
    loc_32 = 0x100;
    dx13 = loc_8;
    loc_2a = loc_6;
    loc_2c = dx13;
    t14 = L_ece95((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_38));
    if ((int)t14 == 0) {
        far_e1e11(0);
        far_e5a21();
        return (long)MK_FP((int)(L_d2667((char)ax2, 1) >> 16), 0);
    }
    far_e0031((char far *)&B_901B);
    far_e1e11(0);
    far_e59bd();
    return ((long)UNDEF << 16 | (unsigned)(int)t14);
}
