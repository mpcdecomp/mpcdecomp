/* differs: 308 at +5, 579 bytes; 311 at +5, 576 bytes; 312 at +5, 578 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_826F;
extern unsigned char B_8287[];
extern unsigned char B_8288[];
extern char B_8289;
extern char B_8805;
extern char B_8A9F;
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char B_A56E;
extern char B_D5DD;
extern char TBL_90C1[];
extern char TBL_9125[];
extern int W_8281;
extern int W_8283;
extern int W_8285;
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern int far far_b1b41();
extern int far far_b1f96();
extern long far far_b3471();
extern long far far_b362e();
extern long far far_b3819();
extern long far far_b6cd3();
extern long far far_b90dd();
extern long far far_c6ae0();
extern int far far_d7b8f();
extern int far far_e0031();
extern long far far_e15e2();
extern int far far_e1e11();
extern long far far_e4d15();
extern long far far_e57c8();
extern long far far_e7069();

long far far_c6894(void)
{
    int loc_2;
    char loc_1c[26];
    char loc_2e[18];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int cx;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int p56;
    int p58;
    int p60;
    int si;
    long t1;
    long t10;
    long t11;
    int t12;
    int t13;
    int t14;
    int t15;
    int t16;
    long t17;
    int t18;
    int t19;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_b6cd3(0x5e3c);
    t2 = far_e7069();
    B_D5DD = (char)2;
    loc_2 = B_8A9F;
    t3 = far_b3819(MK_FP(SEG_DATA, 0x5e53), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2, 1, 99);
    t4 = far_e4d15(loc_2, -1, loc_1c);
    t5 = far_b3471(MK_FP(SEG_DATA, 0x5e58), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c));
    far_b1ad0(2);
    t6 = far_b3819(MK_FP(SEG_DATA, 0x5e5a), (unsigned char far *)B_8287, 2, 1, 31);
    t7 = far_b362e(MK_FP(SEG_DATA, 0x5e60), (unsigned char far *)B_8288, MK_FP(SEG_DATA, 0x5c4));
    far_b1f96();
    p58 = 0x5dc8;
    p60 = SEG_DATA;
    t8 = far_b362e(MK_FP(SEG_DATA, 0x5e62), ((long)p60 << 16 | (unsigned)(unsigned int)(unsigned)&B_826F), MK_FP(SEG_DATA, p58));
    far_b1ad0(3);
    far_b1b41(61);
    far_b1ad0(4);
    far_b1b05(0x5e6f);
    t9 = far_b90dd();
    p56 = 0x5ebf;
    ax7 = far_b1b05(p56);
    for (;;) {
        t12 = far_b08f7();
        dx = t12;
        if (t12 != 0) {
            break;
        }
        if (B_7B8D == 0) {
            p56 = (int)(unsigned)loc_1c;
            p58 = -1;
            p60 = loc_2;
            t10 = far_e4d15(p60, p58, p56);
            t11 = far_b1073();
            continue;
        }
    }
    if (t12 == 120) {
        B_8805 = (char)0;
        t13 = far_d7b8f(1);
        t14 = far_e0031(B_8C41);
        t15 = far_e0031(B_901B);
        t16 = far_e1e11();
        *(int *)((char *)&loc_1c + 24) = W_8281;
        loc_1c[19] = B_8289;
        *(int *)((char *)&loc_1c + 22) = W_8283;
        *(int *)((char *)&loc_1c + 20) = W_8285;
        W_8281 = 1;
        B_8289 = (char)0;
        W_8283 = 1;
        t17 = far_e15e2();
        W_8281 = *(int *)((char *)&loc_1c + 24);
        B_8289 = loc_1c[19];
        W_8283 = *(int *)((char *)&loc_1c + 22);
        W_8285 = *(int *)((char *)&loc_1c + 20);
        dx2 = (int)(far_e4d15(0, -1, loc_2e) >> 16);
        t18 = __repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2e), 0, -1);
        cx = ~t18;
        ax8 = 0;
        t19 = __repe_cmps1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_2e + (-1 - t18) - cx)), cx);
        if (!CC("==", UNDEF)) {
            ax8 = 0 - 0 - CC("<u", UNDEF) + 1;
        }
        if (ax8 != 0) {
            dx3 = (int)(far_e57c8(B_8A9F, -1, loc_1c) >> 16);
        }
        si = 1;
        dx4 = 0;
        do {
            TBL_90C1[si] = (char)2;
            TBL_9125[si] = (char)dx4;
            dx4 = ((char)(dx4 >> 8) << 8 | (unsigned char)((char)dx4 + 1));
            si = si + 1;
        } while ((char)dx4 != 16);
        if (B_826F > 0 && B_826F <= 16) {
            TBL_90C1[B_826F] = (char)6;
        }
        B_A56E = (char)0;
        dx = (int)far_c6ae0();
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_c6ae0(void) { return 0; }
