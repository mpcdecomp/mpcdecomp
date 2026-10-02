/* differs: 308 absent; 311 at +5, 580 bytes; 312 at +5, 581 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char B_9468;
extern char B_9469;
extern char B_946A;
extern char B_946B;
extern int W_903D;
extern int W_903F;
extern int W_904B;
extern int W_943F;
extern int W_9441;
extern int W_9466;
extern int W_9472;
extern int W_9474;
extern int W_9476;
extern int W_9478;
extern int W_947E;
extern int W_9480;
extern long far far_dfc02(int, int, int);
extern long far far_dfd13(int, int);
extern long far far_e0031(unsigned char far *);
extern long far far_e1e11(int);
extern long far far_e259f(char);
extern long far far_e2ce3(int);
extern void far far_e598e(void);
extern long far far_e59bd(void);
extern void far far_e5a21(void);
extern long far far_e726e(int, int);
extern long far far_fa0c8(int, int, int);
extern int far fn_ff5b0(int, int, int);
extern int far fn_ff8d7(int far *);

long far far_ff332(int arg_0, int arg_2, int arg_4)
{
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
    int loc_18;
    int loc_16;
    int loc_14;
    int loc_12;
    int loc_10;
    int loc_e;
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int dx7;
    int dx8;
    int dx9;
    int flags;
    int si;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    int t17;
    long t18;
    long t19;
    long t2;
    long t20;
    int t21;
    int t3;
    long t4;
    int t5;
    long t6;
    long t7;
    long t8;
    int t9;

    si = 0;
    if (B_946A == 0) {
        goto L1;
    }
    t1 = far_e726e(B_946B, B_946A);
    si = (int)t1;
    if (si < 0) {
        return (long)MK_FP((int)(t1 >> 16), 0);
    }
L1:
    t2 = far_e259f(B_9469);
    if ((int)t2 != 0) {
        return (long)MK_FP((int)(t2 >> 16), -12);
    }
    far_e598e();
    if ((arg_0 & 2) == 0) {
        ax = 0;
    } else {
        ax = 1;
    }
    loc_e = ax;
    ax2 = arg_4;
    dx = arg_2;
    loc_10 = ax2;
    loc_12 = dx;
    loc_c = 1;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_946B);
    if ((char)ax3 == B_9469) {
        t5 = fn_ff5b0((char)ax3, W_9472, W_9474);
        if (t5 != 0) {
            t6 = far_e0031((unsigned char far *)B_8C41);
            t7 = far_e0031((unsigned char far *)B_901B);
            t8 = far_e1e11(0);
            return (long)MK_FP((int)(far_e59bd() >> 16), t5);
        }
        loc_2e = B_946B;
        loc_2c = 0;
        loc_2a = 0;
        ax5 = W_9480;
        dx3 = W_947E;
        loc_26 = ax5;
        loc_28 = dx3;
        ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)B_946A);
        loc_8 = (char)ax6;
        loc_24 = (char)ax6;
        loc_20 = 1;
        loc_22 = 0x100;
        loc_1e = (char)ax6;
        loc_1c = 1;
        dx4 = W_9472;
        loc_18 = W_9474;
        loc_1a = dx4;
        dx5 = W_903D;
        loc_14 = W_903F;
        loc_16 = dx5;
        loc_2 = W_904B;
        t9 = fn_ff8d7((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2e));
        if (t9 != 0) {
            t10 = far_e0031((unsigned char far *)B_901B);
            t11 = far_e1e11(0);
            return (long)MK_FP((int)(far_e59bd() >> 16), t9);
        }
        loc_2e = 0;
        loc_26 = 1;
        loc_28 = 0x100;
        t12 = far_dfc02(0, 1, loc_2);
        loc_4 = (int)(t12 >> 16);
        loc_6 = (int)t12;
        goto L2;
    }
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)B_946B);
    loc_a = (char)ax4;
    loc_2e = (char)ax4;
    dx2 = W_947E;
    loc_26 = W_9480;
    loc_28 = dx2;
    t4 = far_dfd13(loc_a, si);
    loc_4 = (int)(t4 >> 16);
    loc_6 = (int)t4;
L2:
    loc_2a = arg_0 & 1;
    loc_2c = B_9469;
    loc_24 = B_946A;
    dx6 = W_9476;
    loc_20 = W_9478;
    loc_22 = dx6;
    loc_1e = B_9468;
    loc_1c = W_9466;
    dx7 = W_9472;
    loc_18 = W_9474;
    loc_1a = dx7;
    dx8 = W_943F;
    loc_14 = W_9441;
    loc_16 = dx8;
    ax7 = W_9466;
    t13 = far_fa0c8(loc_6, ax7, -(ax7 < 0));
    dx9 = (int)(t13 + 0x5dcL >> 16);
    t14 = far_e2ce3(dx9);
    flags = dx9 - (int)(t14 >> 16);
    if (!CC("<", flags) && (CC(">", flags) || (unsigned int)((int)t13 + 0x5dc) > (unsigned int)(int)t14)) {
        t15 = far_e0031(B_901B);
        t16 = far_e1e11(0);
        return (long)MK_FP((int)(far_e59bd() >> 16), -3);
    }
    t17 = fn_ff8d7(&loc_2e);
    if (t17 == 0) {
        t20 = far_e1e11(0);
        far_e5a21();
        return ((long)UNDEF << 16 | (unsigned)0);
    }
    t18 = far_e0031((unsigned char far *)B_901B);
    t19 = far_e1e11(0);
    return (long)MK_FP((int)(far_e59bd() >> 16), t17);
}
int far fn_ff5b0(int p0, int p1, int p2) { return 0; }
int far fn_ff8d7(int far *p0) { return 0; }
