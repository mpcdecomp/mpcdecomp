/* differs: 308 at +6, 714 bytes; 311 at +6, 717 bytes; 312 at +6, 717 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern unsigned char B_8270[];
extern char B_901B;
extern char B_9560;
extern unsigned int W_8271;
extern int W_8273;
extern unsigned int W_8275;
extern int W_8277;
extern unsigned int W_8279;
extern int W_827B;
extern unsigned int W_827D;
extern int W_827F;
extern unsigned int W_903D;
extern int W_903F;
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern long far far_b362e();
extern long far far_b39a2();
extern long far far_b6cd3();
extern long far far_b90dd();
extern long far far_d7b8f();
extern long far far_e15e2();
extern long far far_e5a99();
extern void far far_eab36();
extern int far far_eadf4();
extern long far far_eb007();
extern long far fn_c6867();

long far far_c65cd(void)
{
    char loc_4[4];
    char loc_8[4];
    char loc_c[4];
    char loc_10[4];
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
    int bx;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int p22;
    int p24;
    int p26;
    int p28;
    int p30;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    int t16;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    int t7;
    int t8;
    long t9;

    t1 = far_b6cd3(0x57cc);
    if (B_901B < 0) {
        t2 = far_e15e2();
    }
    t3 = far_e5a99(&B_901B);
    bx = 0;
    ax = W_8273;
    flags = ax - W_903F;
    if (!CC("<u", flags) && (CC(">u", flags) || W_8271 > W_903D)) {
        bx = 1;
    }
    ax2 = W_8277;
    flags2 = ax2 - W_903F;
    if (!CC("<u", flags2) && (CC(">u", flags2) || W_8275 > W_903D)) {
        bx = 1;
    }
    ax3 = W_827B;
    flags3 = ax3 - W_903F;
    if (!CC("<u", flags3) && (CC(">u", flags3) || W_8279 > W_903D)) {
        bx = 1;
    }
    ax4 = W_827F;
    flags4 = ax4 - W_903F;
    if (!CC("<u", flags4) && (CC(">u", flags4) || W_827D > W_903D)) {
        bx = 1;
    }
    if (bx != 0) {
        W_827F = 0;
        W_827D = 0;
        W_827B = 0;
        W_8279 = 0;
        W_8277 = 0;
        W_8275 = 0;
        W_8273 = 0;
        W_8271 = 0;
    }
    far_b1ad0(1);
    t4 = far_b362e(MK_FP(SEG_DATA, 0x57d7), (unsigned char far *)B_8270, MK_FP(SEG_DATA, 0x5798));
    far_b1ad0(2);
    far_eadf4((char far *)&B_901B, W_8271, W_8273, loc_4);
    far_eadf4((char far *)&B_901B, W_8275, W_8277, loc_8);
    t5 = far_b39a2(MK_FP(SEG_DATA, 0x57dd), loc_4);
    t6 = far_b39a2(MK_FP(SEG_DATA, 0x57ed), loc_8);
    far_b1ad0(3);
    far_eadf4((char far *)&B_901B, W_8279, W_827B, loc_c);
    p26 = W_827D;
    p28 = SEG_DATA;
    p30 = (int)(unsigned)&B_901B;
    far_eadf4(((long)p28 << 16 | (unsigned)p30), p26, W_827F, loc_10);
    far_b1b05(0x57f3);
    far_eab36((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_c));
    far_b1b05(0x57ed);
    p24 = (int)(unsigned)loc_10;
    far_eab36(MK_FP(SEG_STACK, p24));
    t9 = far_b90dd();
    p22 = 0x5803;
    far_b1b05(p22);
    ax15 = (int)fn_c6867();
    dx = 0;
    for (;;) {
        if (dx == 0) {
            for (;;) {
                t16 = far_b08f7();
                dx = t16;
                if (t16 != 0) {
                    break;
                }
                ax16 = B_7B8D;
                if (ax16 != 1) {
                    if (ax16 != 2) {
                        continue;
                    }
                    p22 = (int)(unsigned)&W_8275;
                    p24 = *(int *)((char *)&loc_8 + 2);
                    p26 = *(int *)((char *)&loc_8 + 0);
                    p28 = SEG_DATA;
                    p30 = (int)(unsigned)&B_901B;
                    t14 = far_eb007(((long)p28 << 16 | (unsigned)p30), ((long)p24 << 16 | (unsigned)p26), p22);
                    continue;
                }
                p22 = (int)(unsigned)&W_8271;
                p24 = *(int *)((char *)&loc_4 + 2);
                p26 = *(int *)((char *)&loc_4 + 0);
                p28 = SEG_DATA;
                p30 = (int)(unsigned)&B_901B;
                t15 = far_eb007(((long)p28 << 16 | (unsigned)p30), ((long)p24 << 16 | (unsigned)p26), p22);
            }
            if (t16 != 120) {
                if (t16 != 121) {
                    continue;
                }
                dx2 = W_8279;
                W_8273 = W_827B;
                W_8271 = dx2;
                dx3 = W_827D;
                W_8277 = W_827F;
                W_8275 = dx3;
                dx4 = *(int *)((char *)&loc_c + 0);
                *(int *)((char *)&loc_4 + 2) = *(int *)((char *)&loc_c + 2);
                *(int *)((char *)&loc_4 + 0) = dx4;
                dx5 = *(int *)((char *)&loc_10 + 0);
                *(int *)((char *)&loc_8 + 2) = *(int *)((char *)&loc_10 + 2);
                *(int *)((char *)&loc_8 + 0) = dx5;
                t10 = far_b1073();
                t11 = far_b1073();
                dx = 0;
                continue;
            }
            B_9560 = (char)((char)(0 - (B_9560 != 0)) + 1);
            p22 = 5;
            t12 = far_d7b8f(p22);
            t13 = fn_c6867();
            dx = 77;
            continue;
        }
        break;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far fn_c6867(void) { return 0; }
