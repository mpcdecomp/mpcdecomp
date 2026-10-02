/* differs: 308 at +5, 464 bytes; 311 at +5, 463 bytes; 312 at +5, 463 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_9562;
extern int W_9053;
extern int W_9565;
extern int W_9567;
extern void far far_b05a7();
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern int far far_b1d48();
extern int far far_b1f96();
extern long far far_b3819();
extern long far far_b3b9f();
extern long far far_b90dd();
extern long far far_b9113();
extern long far far_e44c1();
extern long far far_e46a8();
extern long far far_e481e();
extern long far far_ec03b();

long far far_bf0c7(void)
{
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int p10;
    int p12;
    int p14;
    int p8;
    long t1;
    int t10;
    int t11;
    int t12;
    int t13;
    int t14;
    int t15;
    int t16;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    int t7;
    int t8;
    int t9;

    dx = (int)(far_ec03b(0x494e) >> 16);
    if (B_9562 == 0) {
        ax = W_9053;
        W_9565 = ax;
        loc_2 = ax + W_9567 - 1;
        dx2 = (int)(far_b9113((int far *)&W_9565, (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2)) >> 16);
        W_9567 = loc_2 - W_9565 + 1;
    }
    far_b1ad0(1);
    t1 = far_b3819(MK_FP(SEG_DATA, 0x4958), (int far *)&W_9567, 3, 1, 0x3e7);
    p10 = 1;
    p12 = 3;
    p14 = SEG_DATA;
    t2 = far_b3819(MK_FP(SEG_DATA, 0x4963), &W_9565, p14, p12, p10, 0x3e7);
    t3 = far_b90dd();
    if (B_9562 == 0) {
        p8 = 0x49c0;
        ax3 = far_b1b05(p8);
        for (;;) {
            ax4 = far_b08f7();
            dx3 = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)ax4);
            if ((char)ax4 != 0) {
                break;
            }
            ax6 = B_7B8D;
            if (ax6 != 0 && ax6 != 1) {
                continue;
            }
            loc_2 = W_9565 + W_9567 - 1;
            p8 = SEG_STACK;
            p10 = (int)(unsigned)&loc_2;
            p12 = SEG_DATA;
            p14 = (int)(unsigned)&W_9565;
            t4 = far_b9113(((long)p12 << 16 | (unsigned)p14), ((long)p8 << 16 | (unsigned)p10));
            W_9567 = loc_2 - W_9565 + 1;
            t5 = far_b1073();
            t6 = far_b1073();
        }
        if ((char)dx3 == 120) {
            t7 = far_b1ad0(7);
            t8 = far_b1d48(0x49ca);
            ax5 = (int)far_e44c1();
            dx4 = ax5;
            if (ax5 != 0) {
                dx4 = (int)(far_b3b9f() >> 16);
            }
            dx3 = ((char)(dx4 >> 8) << 8 | (unsigned char)77);
        }
        return ((long)dx3 << 16 | (unsigned)(char)dx3);
    }
    far_b1b05(0x4973);
    far_b05a7();
    do {
        t10 = far_b08f7();
        dx5 = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)t10);
    } while ((char)t10 == 0);
    if ((char)t10 != 120) {
        if ((char)t10 == 121) {
            t11 = far_b1ad0(7);
            t12 = far_b1b05(0x49a0);
            t13 = far_b1f96();
            dx5 = ((char)((int)(far_e481e() >> 16) >> 8) << 8 | (unsigned char)77);
        }
    } else {
        t14 = far_b1ad0(7);
        t15 = far_b1b05(0x498b);
        t16 = far_b1f96();
        ax8 = (int)far_e46a8();
        dx6 = ax8;
        if (ax8 != 0) {
            dx6 = (int)(far_b3b9f() >> 16);
        }
        dx5 = ((char)(dx6 >> 8) << 8 | (unsigned char)77);
    }
    return ((long)dx5 << 16 | (unsigned)(char)dx5);
}
