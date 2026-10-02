/* differs: 308 at +5, 739 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7AD0;
extern char B_955B;
extern char B_955C;
extern char B_956A;
extern char B_D5DD;
extern char B_D5DE;
extern unsigned char TBL_b5518[];
extern unsigned char TBL_b5522[];
extern int W_E570;
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3b9f(int);
extern long far far_b60ee(void);
extern void far far_bb9e3(void);
extern long far far_bbd9c(char far *, int);
extern long far far_bd688(char far *);
extern long far far_bda63(char far *);
extern long far far_be357(char far *, int);
extern long far far_be846(char far *, int);
extern long far far_cad00(int);
extern long far far_d8b9c(char far *);
extern long far far_ebcce(char far *, int, int);
extern long far far_ec03b(void far *);
extern void far fn_b56ff(char far *);
extern long far fn_b5d64(char far *);
extern void far fn_b61d5(void);
extern void far fn_c6d1f(int);

long far far_b52de(void)
{
    char loc_16[21];
    char loc_1;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    unsigned int ax5;
    int ax6;
    int bx;
    int dx;
    int flags;
    int flags2;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    long t17;
    int t18;
    int t19;
    int t2;
    long t3;
    int t4;
    int t5;
    long t6;
    long t7;
    long t8;
    long t9;

    B_D5DD = (char)0;
    t1 = far_ec03b(MK_FP(SEG_DATA, 0x22b2));
    ax = far_b1b05(MK_FP(SEG_DATA, 0x22d4));
    if (B_7AD0 != 0) {
        t2 = far_b1ad0(4, 21);
        ax2 = far_b1b05(MK_FP(SEG_DATA, 0x237a));
    }
    far_b1ad0(7, 0);
    t3 = far_ebcce((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), 10, 0);
    dx = (int)t3;
    if (dx == 0) {
        ax4 = ((char)((int)t3 >> 8) << 8 | (unsigned char)loc_1);
        B_D5DD = (char)ax4;
        ax5 = (char)ax4 - 1;
        if (ax5 <= 9) {
            switch ((unsigned int)(unsigned)(TBL_b5522 + (ax5 << 1))) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                fn_c6d1f(loc_1);
                dx = UNDEF;
                break;
            case 6:
                W_E570 = 0;
                while (dx == 0) {
                    B_D5DD = loc_1;
                    fn_b56ff((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16));
                    dx = UNDEF;
                    bx = dx;
                    flags = bx + 4;
                    if (!CC("!=", flags)) {
                        t6 = far_bda63((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16));
                        dx = (int)t6;
                        B_955B = (char)(B_955B | 64);
                        B_955C = (char)(B_955C | -128);
                        continue;
                    }
                    if (CC(">", flags)) {
                        flags2 = bx + 1;
                        if (CC("==", flags2)) {
                            B_956A = (char)(B_956A + 1);
                            t17 = far_bbd9c((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16), 2);
                            dx = (int)t17;
                            B_956A = (char)(B_956A - 1);
                            continue;
                        }
                        if (CC(">", flags2)) {
                            if (bx != 117) {
                                continue;
                            }
                            t16 = far_b60ee();
                            dx = (int)t16;
                            W_E570 = 0;
                            continue;
                        }
                        if (bx == -3) {
                            t15 = far_bd688((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16));
                            dx = (int)t15;
                            continue;
                        }
                        if (bx != -2) {
                            continue;
                        }
                        t12 = far_cad00(0);
                        t13 = far_d8b9c((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16));
                        ax6 = (int)t13;
                        dx = ax6;
                        if (dx == 0) {
                            continue;
                        }
                        t14 = far_b3b9f(ax6);
                        dx = 0;
                        continue;
                    }
                    if ((unsigned int)(bx + 9) > 4) {
                        continue;
                    }
                    switch ((unsigned int)(unsigned)(TBL_b5518 + (bx + 9 << 1))) {
                    case 0:
                        t11 = far_be846((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16), 0);
                        dx = (int)t11;
                        continue;
                    case 1:
                        t10 = far_be357((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16), 0);
                        dx = (int)t10;
                        continue;
                    case 2:
                        t9 = far_b3b9f(-39);
                        dx = B_D5DE;
                        continue;
                    case 3:
                        B_956A = (char)(B_956A + 1);
                        t8 = far_bbd9c((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16), 5);
                        dx = (int)t8;
                        B_956A = (char)(B_956A - 1);
                        continue;
                    case 4:
                        t7 = fn_b5d64((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16));
                        dx = (int)t7;
                        continue;
                    }
                }
                break;
            case 7:
                far_bb9e3();
                dx = UNDEF;
                break;
            case 8:
                fn_b61d5();
                dx = UNDEF;
                break;
            case 9:
                dx = 0;
                if (B_7AD0 != 0) {
                    dx = (int)far_b60ee();
                }
                if (dx == 0) {
                    dx = B_D5DE;
                }
                break;
            }
        }
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b60ee(void) { return 0; }
void far fn_b56ff(char far *p0) { }
long far fn_b5d64(char far *p0) { return 0; }
void far fn_b61d5(void) { }
