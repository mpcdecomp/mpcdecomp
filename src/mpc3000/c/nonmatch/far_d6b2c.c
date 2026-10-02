/* differs: 308 at +0, 949 bytes; 311 at +0, 948 bytes; 312 at +0, 947 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_7FCB;
extern unsigned char B_7FD1;
extern unsigned char B_7FD3;
extern unsigned char B_901B;
extern unsigned char B_9457;
extern unsigned char B_9569;
extern unsigned char B_956C;
extern unsigned char B_A573;
extern unsigned char B_A5C2;
extern unsigned char B_A5C9;
extern unsigned char B_D4BE;
extern unsigned char B_D60A;
extern unsigned char TBL_A5CA;
extern unsigned char TBL_d6b52[];
extern unsigned char W_8A8F;
extern unsigned char W_8A91;
extern unsigned char W_D60C;
extern unsigned char W_D627;
extern unsigned char W_D635;
extern unsigned char W_D637;
extern unsigned char W_D641;
extern unsigned char W_D643;
extern unsigned char W_D645;
extern unsigned char W_D647;
extern long far far_d5fd0(void);
extern int far far_dac6a(void);
extern void far far_dd6dd(void);
extern void far far_dd6e7(void);
extern void far far_dd6ec(void);
extern void far far_de51c(void);
extern long far far_eb63c(void);
extern int far far_eb837(void);
extern int far far_fb14d(void);
extern int far far_fb18a(void);
extern long far far_fb38c(void);
extern void near fn_d6d3b(void);

long interrupt far far_d6b2c(void)
{
    unsigned int ax;
    int ax2;
    unsigned int ax3;
    int ax4;
    int bx;
    int bx2;
    unsigned int cx;
    int di;
    int ds;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int es;
    int si;
    long t1;
    int t10;
    int t11;
    int t12;
    int t13;
    int t14;
    long t15;
    int t2;
    int t3;
    int t4;
    int t5;
    int t6;
    int t7;
    int t8;
    long t9;

    dx = (int)(far_fb14d() >> 16);
    ax = -0x7ff0;
    ds = ax;
    if (*(char far *)MK_FP(ds, (unsigned)&B_9569) != 0) {
        _enable();
        dx2 = (int)(far_fb38c() >> 16);
        if (!CC("==", UNDEF)) {
            *(char far *)MK_FP(ds, (unsigned)&B_9457) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_9457) | 2);
            outpw(-0x3fef, inpw(-0x3fef) | 64);
            *(char far *)MK_FP(ds, (unsigned)&B_D4BE) = (char)80;
        }
        goto L1;
    }
    if (*(char far *)MK_FP(ds, (unsigned)&B_7FD3) != 0 && *(char far *)MK_FP(ds, (unsigned)&B_7FD1) >= 2) {
        es = (int)(*(long far *)MK_FP(ds, (unsigned)&W_D641) >> 16);
        *(int far *)MK_FP(ds, (unsigned)&W_D645) = (int)*(long far *)MK_FP(ds, (unsigned)&W_D641);
        *(int far *)MK_FP(ds, (unsigned)&W_D647) = es;
        t1 = far_d5fd0();
        *(int far *)MK_FP(ds, (unsigned)&W_D641) = (int)t1;
        *(int far *)MK_FP(ds, (unsigned)&W_D643) = (int)(t1 >> 16);
        bx = ((char)(UNDEF >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_D60A));
        switch ((unsigned int)(unsigned)(TBL_d6b52 + (unsigned char)(char)bx)) {
        case 0:
            if (*(char far *)MK_FP(ds, (unsigned)&B_901B) < 0) {
                *(char far *)MK_FP(ds, (unsigned)&B_D60A) = (char)14;
            } else if ((*(char far *)MK_FP(ds, (unsigned)&B_A5C2) & 21) != 0) {
                *(char far *)MK_FP(ds, (unsigned)&B_D60A) = (char)14;
            } else {
                *(int far *)MK_FP(ds, (unsigned)&W_D635) = 0;
                *(int far *)MK_FP(ds, (unsigned)&W_D637) = 0;
                *(int far *)MK_FP(ds, (unsigned)&W_D60C) = 0;
                *(char far *)MK_FP(ds, (unsigned)&TBL_A5CA) = (char)0;
                t11 = __insn("int 0x46", 4, (unsigned char)(char)bx, UNDEF, (int)(t1 >> 16), si, di, UNDEF, ds);
                *(char far *)MK_FP(ds, (unsigned)&B_A5C9) = (char)0;
                t12 = __insn("int 0x46", 3, UNDEF, UNDEF, UNDEF, si, di, UNDEF, ds);
                if (*(char far *)MK_FP(ds, (unsigned)&B_7FD1) == 2) {
                    *(char far *)MK_FP(ds, (unsigned)&B_A573) = (char)15;
                    *(char far *)MK_FP(ds, (unsigned)&B_D60A) = (char)2;
                } else {
                    *(int far *)MK_FP(ds, (unsigned)&W_D60C) = 1;
                    *(char far *)MK_FP(ds, (unsigned)&B_D60A) = (char)10;
                    far_dd6e7();
                }
            }
            break;
        case 1:
            *(char far *)MK_FP(ds, (unsigned)&B_A573) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_A573) - 1);
            if ((char)(*(char far *)MK_FP(ds, (unsigned)&B_A573) - 1) <= 0) {
                *(char far *)MK_FP(ds, (unsigned)&B_A573) = (char)0;
                if (*(int far *)MK_FP(ds, (unsigned)&W_D643) == *(int far *)MK_FP(ds, (unsigned)&W_D647) && (unsigned int)(*(int far *)MK_FP(ds, (unsigned)&W_D641) - *(int far *)MK_FP(ds, (unsigned)&W_D645)) <= 0x9c40) {
                    *(char far *)MK_FP(ds, (unsigned)&B_D60A) = (char)14;
                } else {
                    fn_d6d3b();
                    if (!CC(">=u", UNDEF)) {
                        *(char far *)MK_FP(ds, (unsigned)&B_D60A) = (char)4;
                        *(int far *)MK_FP(ds, (unsigned)&W_D635) = *(int far *)MK_FP(ds, (unsigned)&W_8A8F);
                        *(int far *)MK_FP(ds, (unsigned)&W_D637) = *(int far *)MK_FP(ds, (unsigned)&W_8A91);
                        *(int far *)MK_FP(ds, (unsigned)&W_D635) = *(int far *)MK_FP(ds, (unsigned)&W_D635) + 1;
                        *(int far *)MK_FP(ds, (unsigned)&W_D637) = (int)(*(long far *)MK_FP(ds, (unsigned)&W_D635) + 1L >> 16);
                        far_dd6e7();
                    } else {
                        t9 = far_eb63c();
                        *(int far *)MK_FP(ds, (unsigned)&W_D635) = (int)t9 + 1;
                        *(int far *)MK_FP(ds, (unsigned)&W_D637) = (int)(t9 + 1L >> 16);
                        *(int far *)MK_FP(ds, (unsigned)&W_D60C) = 1;
                        *(char far *)MK_FP(ds, (unsigned)&B_D60A) = (char)10;
                        *(char far *)MK_FP(ds, (unsigned)&B_956C) = (char)-56;
                        t10 = far_dac6a();
                    }
                }
            }
            break;
        case 2:
            fn_d6d3b();
            if (!CC("<u", UNDEF)) {
                *(int far *)MK_FP(ds, (unsigned)&W_D60C) = 1;
            } else {
                goto L2;
            }
            break;
        case 3:
            fn_d6d3b();
            if (!CC("<u", UNDEF)) {
                *(int far *)MK_FP(ds, (unsigned)&W_D60C) = 1;
                *(char far *)MK_FP(ds, (unsigned)&B_D60A) = (char)8;
                far_dd6ec();
            }
L2:
            if ((*(int far *)MK_FP(ds, (unsigned)&W_D627) & 54) == 0) {
                *(char far *)MK_FP(ds, (unsigned)&B_D4BE) = (char)80;
            }
            break;
        case 4:
        case 5:
        case 7:
        case 8:
        case 9:
        case 10:
            break;
        case 6:
            if (*(char far *)MK_FP(ds, (unsigned)&B_7FD1) == 2) {
                ax2 = *(int far *)MK_FP(ds, (unsigned)&W_D641);
                dx3 = *(int far *)MK_FP(ds, (unsigned)&W_D643);
                ax3 = ax2 - *(int far *)MK_FP(ds, (unsigned)&W_D645);
                dx4 = (int)(((long)dx3 << 16 | (unsigned)ax2) - *(long far *)MK_FP(ds, (unsigned)&W_D645) >> 16);
                if (dx3 == *(int far *)MK_FP(ds, (unsigned)&W_D647) && ax3 <= 0x9c40) {
                    *(char far *)MK_FP(ds, (unsigned)&B_D60A) = (char)14;
                    far_dd6dd();
                } else {
                    cx = 0;
                    bx2 = (unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_7FCB) << 2;
                    for (;;) {
                        ax3 = ax3 - *(int far *)MK_FP(ds, bx2 + 0x5e4);
                        dx4 = (int)(((long)dx4 << 16 | (unsigned)ax3) - *(long far *)MK_FP(ds, bx2 + 0x5e4) >> 16);
                        if (dx4 > *(int far *)MK_FP(ds, bx2 + 0x5e6)) {
                            cx = cx + 1;
                            continue;
                        }
                        break;
                    }
                    if (cx != 0) {
                        *(int far *)MK_FP(ds, (unsigned)&W_D635) = *(int far *)MK_FP(ds, (unsigned)&W_D635) + cx;
                        *(int far *)MK_FP(ds, (unsigned)&W_D637) = (int)(*(long far *)MK_FP(ds, (unsigned)&W_D635) + (unsigned long)(unsigned int)cx >> 16);
                    }
L3:
                    far_de51c();
                }
            } else {
                goto L3;
            }
            break;
        }
L1:
        ax = *(int far *)MK_FP(ds, (unsigned)&W_D60C);
        *(int far *)MK_FP(ds, (unsigned)&W_D635) = *(int far *)MK_FP(ds, (unsigned)&W_D635) + ax;
        *(int far *)MK_FP(ds, (unsigned)&W_D637) = (int)(*(long far *)MK_FP(ds, (unsigned)&W_D635) + (unsigned long)(unsigned int)ax >> 16);
    }
    ((char)(ax >> 8) << 8 | (unsigned char)inp(80));
    t14 = far_eb837();
    _disable();
    outp(-0x3ff0, (char)102);
    t15 = far_fb18a();
    return 0L;
}
void near fn_d6d3b(void) { }
