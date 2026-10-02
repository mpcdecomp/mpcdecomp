/* differs: 308 at +0, 514 bytes; 311 at +0, 516 bytes; 312 at +0, 516 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_W_D641 {
    long f_0;
};
struct g_W_D635 {
    long f_0;
};
extern char B_7FD1;
extern char B_901B;
extern char B_956C;
extern char B_A5C2;
extern char B_A5C9;
extern char B_D5EB;
extern char B_D5ED;
extern int B_D604;
extern int B_D606;
extern char B_D60A;
extern char TBL_A5CA;
extern int TBL_D5EF;
extern unsigned char TBL_dc8d3[];
extern int W_8A8F;
extern int W_8A91;
extern int W_D5F1;
extern int W_D60C;
extern struct g_W_D635 W_D635;
extern int W_D637;
extern int W_D639;
extern int W_D63B;
extern struct g_W_D641 W_D641;
extern int W_D643;
extern int W_D645;
extern int W_D647;
extern long far far_d5fd0(void);
extern int far far_dac6a(void);
extern void far far_dd6e2(void);
extern void far far_dd6e7(void);
extern void far far_dd6ec(void);
extern void far far_de51c(void);
extern long far far_eb63c(void);
extern void near fn_dca1b(void);

long far far_dc8ae(void)
{
    int ax;
    unsigned int ax2;
    int bx;
    int di;
    int dx;
    int es;
    int si;
    int t1;
    int t10;
    int t11;
    int t2;
    int t3;
    int t4;
    int t5;
    int t6;
    int t7;
    int t8;
    long t9;

    es = (int)(W_D641.f_0 >> 16);
    W_D645 = (int)W_D641.f_0;
    W_D647 = es;
    dx = (int)(far_d5fd0() >> 16);
    *(int *)((char *)&W_D641 + 0) = UNDEF;
    W_D643 = UNDEF;
    bx = ((char)(UNDEF >> 8) << 8 | (unsigned char)B_D60A);
    switch ((unsigned int)(unsigned)(TBL_dc8d3 + (unsigned char)(char)bx)) {
    case 0:
        if (B_7FD1 == 1) {
            if (B_901B < 0) {
                B_D60A = (char)14;
            } else if ((B_A5C2 & 21) != 0) {
                B_D60A = (char)14;
            } else {
L1:
                W_D60C = 0;
                TBL_A5CA = (char)0;
                t5 = __insn("int 0x46", 4, (unsigned char)(char)bx, UNDEF, dx, si, di, UNDEF, SEG_DATA);
                B_A5C9 = (char)0;
                t6 = __insn("int 0x46", 3, UNDEF, UNDEF, UNDEF, si, di, UNDEF, SEG_DATA);
                dx = UNDEF;
                if (B_7FD1 == 1) {
                    fn_dca1b();
                    if (!CC(">=u", UNDEF)) {
                        B_D60A = (char)4;
                        *(int *)((char *)&W_D635 + 0) = W_8A8F;
                        W_D637 = W_8A91;
                        far_dd6e7();
                        dx = UNDEF;
                    } else {
                        t9 = far_eb63c();
                        *(int *)((char *)&W_D635 + 0) = (int)t9 + 2;
                        W_D637 = (int)(t9 + 2L >> 16);
                        B_D604 = TBL_D5EF;
                        B_D606 = W_D5F1;
                        W_D60C = 1;
                        B_D60A = (char)10;
                        B_956C = (char)-56;
                        ax = far_dac6a();
                        dx = UNDEF;
                    }
                } else {
                    W_D60C = 1;
                    if (B_D5EB == 0) {
                        B_D60A = (char)16;
                        *(int *)((char *)&W_D635 + 0) = 0;
                        W_D637 = 0;
                        W_D639 = 0;
                        W_D63B = 0;
                    } else {
                        B_D60A = (char)18;
                        if (B_D5EB != 2) {
                            far_dd6e7();
                            dx = UNDEF;
                        } else {
                            far_dd6e2();
                            dx = UNDEF;
                        }
                    }
                }
            }
        } else {
            goto L1;
        }
        break;
    case 1:
    case 4:
    case 5:
    case 7:
        break;
    case 2:
        fn_dca1b();
        dx = UNDEF;
        if (!CC("<u", UNDEF)) {
            W_D60C = 1;
        } else {
            goto L2;
        }
        break;
    case 3:
        B_D604 = TBL_D5EF;
        B_D606 = W_D5F1;
        fn_dca1b();
        dx = UNDEF;
        if (!CC("<u", UNDEF)) {
            W_D60C = 1;
            B_D60A = (char)8;
            far_dd6ec();
            dx = UNDEF;
        }
L2:
        break;
    case 6:
    case 8:
    case 10:
        if (B_D5ED == 0) {
            far_de51c();
            dx = UNDEF;
L3:
            W_D60C = 1;
        }
        break;
    case 9:
        goto L3;
    }
    ax2 = W_D60C;
    *(int *)((char *)&W_D635 + 0) = *(int *)((char *)&W_D635 + 0) + ax2;
    W_D637 = (int)(W_D635.f_0 + (unsigned long)(unsigned int)ax2 >> 16);
    return ((long)dx << 16 | (unsigned)ax2);
}
void near fn_dca1b(void) { }
