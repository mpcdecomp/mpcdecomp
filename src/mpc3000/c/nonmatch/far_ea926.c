/* differs: 308 at +12, 499 bytes; 311 at +12, 499 bytes; 312 at +12, 499 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B88;
extern char B_7FCA;
extern char B_7FCB;
extern char B_7FD1;
extern char B_8A9C;
extern char B_8A9F;
extern unsigned char B_9057;
extern unsigned char B_9058;
extern char B_A570;
extern char B_D4BB;
extern char B_D5DD;
extern char B_D5DE;
extern char B_D60A;
extern int W_904B;
extern unsigned char W_9051[];
extern unsigned char W_D5F3[];
extern int W_D657;
extern int W_D659;
extern int far far_b1ad0();
extern int far far_b1b05();
extern int far far_b1b2b();
extern int far far_b1d48();
extern int far far_de88f();
extern long far far_e4d15();
extern void far far_eab36();
extern void far far_eac51();
extern long far far_eb17e();
extern void far fn_eac16();

int far far_ea926(int arg_0)
{
    char loc_1;
    char loc_2;
    char loc_8[6];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int dx;
    int t1;
    int t10;
    int t11;
    long t12;
    int t13;
    int t14;
    int t15;
    int t16;
    int t17;
    int t2;
    int t3;
    int t4;
    long t5;
    int t6;
    int t7;
    long t8;
    int t9;

    if (B_D4BB == 0) {
        if (B_D5DD != 0) {
            ax = B_A570;
            if (ax != 0) {
L1:
                if (B_D5DE == 77 || B_D5DE == 71 || (B_D5DE == 83 || B_D5DE == 47) || B_A570 != 0) {
                    t1 = far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2));
                    t2 = far_b1ad0(6, 10);
                    if (arg_0 != 0) {
                        dx = SEG_DATA;
                        ax2 = -0x78a2;
                    } else {
                        dx = SEG_DATA;
                        ax2 = (int)(unsigned)W_9051;
                    }
                    far_eab36(((long)dx << 16 | (unsigned)ax2), arg_0);
                    t4 = far_b1ad0(6, 21);
                    if (B_7FD1 != 1 && B_7FD1 != 2) {
                        if (B_D60A != 0) {
                            ax3 = far_b1b05(MK_FP(SEG_DATA, 0x748e));
                        } else {
                            t5 = far_eb17e((unsigned char far *)W_D5F3, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8));
                            fn_eac16((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), arg_0);
                        }
                    } else if (B_D60A == 6) {
                        fn_eac16(MK_FP(SEG_DATA, -0x2ab5), arg_0);
                    } else {
                        t8 = far_eb17e((unsigned char far *)W_D5F3, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8));
                        fn_eac16((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), arg_0);
                    }
                    if (B_D5DE == 77 || B_A570 != 0) {
                        if (B_7B88 != 0) {
                            t10 = far_b1ad0(2, 4);
                            t11 = far_b1d48(MK_FP(SEG_DATA, 0x749a), B_9057, B_9058, W_904B);
                            if (B_A570 == 0) {
                                t12 = far_e4d15(B_8A9F, B_8A9C, MK_FP(SEG_DATA, -0x6cc1));
                                t13 = far_b1ad0(4, 7);
                                t14 = far_b1b05(MK_FP(SEG_DATA, -0x6cc1));
                            }
                            t15 = far_b1ad0(1, 28);
                            if (B_D60A != 0 && B_7FD1 != 1 && B_7FD1 != 2) {
                                ax4 = far_b1b05(MK_FP(SEG_DATA, 0x74ad));
                            } else {
                                t16 = far_de88f(W_D657, B_7FCA, B_7FCB);
                                W_D659 = t16;
                                ax5 = far_b1d48(MK_FP(SEG_DATA, 0x74b3), W_D659 / 10, t16 % 10);
                            }
                        }
                    }
                    if (B_D5DE == 71 && B_7B88 != 0 && arg_0 != 0) {
                        far_eac51();
                    }
                    ax = far_b1ad0(loc_1, loc_2);
                }
            }
        } else {
            goto L1;
        }
    }
    return ax;
}
void far far_eab36(long p0, int p1) { }
void far far_eac51(void) { }
void far fn_eac16(char far *p0, int p1) { }
