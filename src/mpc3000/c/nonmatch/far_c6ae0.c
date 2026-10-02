/* differs: 308 at +5, 616 bytes; 311 at +5, 618 bytes; 312 at +5, 619 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_7FCA;
extern char B_7FCB;
extern unsigned char B_7FCC[];
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_A570;
extern char B_D4C2;
extern char B_D5DD;
extern unsigned char TBL_c6d17[];
extern int W_9045;
extern int W_9047;
extern unsigned char W_D5F3[];
extern int W_D657;
extern int W_D659;
extern int far far_b08f7();
extern long far far_b1206();
extern int far far_b1ad0();
extern int far far_b1b05();
extern int far far_b1b41();
extern int far far_b1d48();
extern long far far_b3471();
extern long far far_b362e();
extern long far far_b3819();
extern long far far_b6cd3();
extern long far far_bff70();
extern void far far_bffc9();
extern void far far_dd970();
extern int far far_de88f();
extern int far far_e0031();
extern long far far_e4d15();
extern long far far_e51be();
extern long far far_e57c8();
extern long far far_e6fef();
extern long far far_e70e6();
extern int far far_ea926();
extern long far far_eb86b();

long far far_c6ae0(void)
{
    char loc_16[22];
    int ax;
    int ax10;
    unsigned int ax11;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int p30;
    int p32;
    int p34;
    int si;
    long t1;
    long t10;
    int t11;
    long t12;
    long t13;
    long t14;
    int t15;
    long t16;
    int t17;
    int t18;
    long t19;
    long t2;
    int t20;
    int t21;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    int t8;
    long t9;

    t1 = far_b6cd3(0x5e3c);
    B_A570 = (char)1;
    B_D4C2 = (char)0;
    B_D5DD = (char)3;
    far_b1d48(MK_FP(SEG_DATA, 0x5ec9));
    t2 = far_e4d15(B_8A9F, -1, loc_16);
    t3 = far_b3471(MK_FP(SEG_DATA, 0x5e58), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16));
    ax2 = ((char)((int)t3 >> 8) << 8 | (unsigned char)B_7FCA);
    *(int *)((char *)&loc_16 + 20) = (char)ax2;
    ax3 = ((char)-((char)ax2 < 0) << 8 | (unsigned char)B_7FCB);
    *(int *)((char *)&loc_16 + 18) = (char)ax3;
    t4 = (long)(signed char)(char)ax2 * (long)(int)((char)ax3 + 1);
    W_D659 = far_de88f(W_D657, *(int *)((char *)&loc_16 + 20));
    t5 = far_b362e(MK_FP(SEG_DATA, 0x5e5e), (char far *)&B_7FCA, MK_FP(SEG_DATA, 0x1fc));
    t6 = far_b3819(MK_FP(SEG_DATA, 0x5e56), (int far *)&W_D659, 5, *(int *)(0x248 + ((int)t4 << 1)), *(int *)(0x252 + ((int)t4 << 1)));
    p32 = 88;
    p34 = SEG_DATA;
    t7 = far_b362e(MK_FP(SEG_DATA, 0x5ed1), ((long)p34 << 16 | (unsigned)(unsigned int)(unsigned)B_7FCC), MK_FP(SEG_DATA, p32));
    far_b1ad0(2);
    far_b1b05(0x5ed4);
    far_b1ad0(3);
    far_b1b41(61);
    far_b1ad0(4);
    far_b1b05(0x5ef5);
    far_bffc9();
    p30 = 0x5f2e;
    ax10 = far_b1b05(p30);
    si = 0;
    while (si == 0) {
        for (;;) {
            t21 = far_b08f7();
            si = t21;
            if (t21 == 0) {
                ax11 = B_7B8D;
                if (ax11 <= 3) {
                    switch ((unsigned int)(unsigned)(TBL_c6d17 + (ax11 << 1))) {
                    case 0:
                        p30 = (int)(unsigned)loc_16;
                        p32 = -1;
                        p34 = B_8A9F;
                        t16 = far_e57c8(p34, p32, p30);
                        continue;
                    case 1:
                        t13 = (long)(signed char)B_7FCA * (long)(int)(B_7FCB + 1);
                        p30 = *(int *)(0x248 + ((int)t13 << 1));
                        p32 = 2;
                        t14 = far_b1206(p32, p30);
                        t15 = far_ea926();
                        continue;
                    case 2:
                        t12 = far_bff70();
                        continue;
                    case 3:
                        t9 = far_e70e6();
                        p30 = (int)(unsigned)W_D5F3;
                        p32 = W_9047;
                        p34 = W_9045;
                        t10 = far_eb86b(((long)p32 << 16 | (unsigned)p34), p30);
                        t11 = far_ea926();
                        continue;
                    }
                } else {
                    continue;
                }
            } else {
                break;
            }
        }
        if (t21 != 47) {
            if (t21 != 87) {
                if (t21 != 120) {
                    B_D4C2 = (char)77;
                    continue;
                }
                si = 77;
                continue;
            }
            far_dd970();
            t18 = far_ea926();
            si = 0;
            continue;
        }
        B_D4C2 = (char)1;
    }
    t19 = far_e6fef();
    B_A570 = (char)0;
    t20 = far_e0031(B_901B);
    return (long)MK_FP((int)(far_e51be((unsigned char far *)B_901B, B_8A9F) >> 16), si);
}
