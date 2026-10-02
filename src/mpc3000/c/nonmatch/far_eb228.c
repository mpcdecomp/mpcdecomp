/* differs: 308 at +8, 1142 bytes; 311 at +8, 1144 bytes; 312 at +8, 1144 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_8455;
extern char B_8800;
extern unsigned char B_8804;
extern unsigned char B_8A88;
extern char B_901C;
extern char B_D612;
extern unsigned char TBL_8456[];
extern int TBL_882E;
extern unsigned char TBL_8830[];
extern char TBL_A79A[];
extern int W_87EE;
extern int W_87F6;
extern int W_87F8;
extern int W_87FA;
extern int W_87FC;
extern int W_8A8F;
extern int W_8A91;
extern int W_9039;
extern int W_903B;
extern int W_903D;
extern int W_903F;
extern int W_D631;
extern int W_D633;
extern int W_D653;
extern int far far_b1fc8();
extern long far far_b1ff2();
extern long far far_b2436();

long far far_eb228(long arg_0, int arg_2, long arg_4)
{
    char loc_4[4];
    char loc_8[4];
    long loc_1c;
    unsigned long loc_24;
    char loc_2c[8];
    int loc_2e;
    int loc_30;
    int loc_32;
    int loc_34;
    int loc_36;
    int loc_38;
    unsigned int loc_3a;
    int loc_3c;
    unsigned int loc_3e;
    int loc_40;
    long loc_42;
    int ax;
    int ax10;
    int ax11;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int cx;
    int di;
    int dx;
    int dx10;
    int dx11;
    int dx12;
    int dx13;
    int dx14;
    int dx15;
    int dx16;
    int dx17;
    unsigned int dx18;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int dx7;
    int dx8;
    int dx9;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int flags5;
    int flags6;
    int p74;
    int p76;
    int p78;
    int p80;
    int p82;
    int p84;
    int si;
    long t1;
    long t10;
    long t2;
    long t3;
    long t4;
    long t5;
    int t6;
    long t7;
    long t8;
    long t9;

    ax = W_8A91;
    dx = W_8A8F;
    *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - dx;
    arg_2 = (int)(arg_0 - ((long)ax << 16 | (unsigned)dx) >> 16);
    if (B_D612 == 0) {
        ax2 = W_D653;
        *(int *)((char *)&loc_8 + 2) = 0;
        *(int *)((char *)&loc_8 + 0) = ax2;
        t1 = far_b2436((long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&arg_0), (int far *)&W_D631, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2c));
        t2 = far_b1ff2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2c), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), (long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1c));
        bx = (int)arg_4;
        es = (int)(arg_4 >> 16);
        dx2 = *(int *)((char *)&loc_1c + 0);
        *(int far *)MK_FP(es, bx + 2) = *(int *)((char *)&loc_1c + 2);
        *(int far *)MK_FP(es, bx) = dx2;
    } else {
        if (B_8800 != 0) {
            loc_32 = B_8455;
            loc_34 = (unsigned char)TBL_A79A[B_8804];
            dx3 = W_87FA;
            loc_38 = W_87FC;
            loc_3a = dx3;
            dx4 = W_87F6;
            loc_3c = W_87F8;
            loc_3e = dx4;
            loc_36 = W_87EE;
            loc_40 = SEG_DATA;
            *(int *)((char *)&loc_42 + 0) = (int)(unsigned)TBL_8456;
        } else {
            loc_32 = B_8A88;
            loc_34 = B_901C & 1;
            dx5 = W_903D;
            loc_38 = W_903F;
            loc_3a = dx5;
            dx6 = W_9039;
            loc_3c = W_903B;
            loc_3e = dx6;
            loc_36 = TBL_882E;
            loc_40 = SEG_DATA;
            *(int *)((char *)&loc_42 + 0) = (int)(unsigned)TBL_8830;
        }
        *(int *)((char *)&loc_24 + 2) = 0;
        *(int *)((char *)&loc_24 + 0) = 0;
        *(int *)((char *)&loc_24 + 6) = 0;
        *(int *)((char *)&loc_24 + 4) = 0;
        loc_2e = 0x1000;
        bx2 = (int)arg_4;
        es2 = (int)(arg_4 >> 16);
        *(int far *)MK_FP(es2, bx2 + 2) = 0;
        *(int far *)MK_FP(es2, bx2) = 0;
        es3 = (int)(loc_42 >> 16);
        bx3 = (int)loc_42 + loc_32 * 6;
        dx2 = loc_3a;
        *(int far *)MK_FP(es3, bx3 + 2) = loc_38;
        *(int far *)MK_FP(es3, bx3) = dx2;
        di = loc_34;
        loc_30 = 0;
        *(int *)((char *)&loc_1c + 14) = 0;
        *(int *)((char *)&loc_1c + 12) = 0;
L1:
        if (di >= 0) {
            si = loc_30;
            for (;;) {
                if (si <= loc_32) {
                    t3 = (unsigned long)(unsigned int)W_D653 << 12;
                    t4 = t3 / (unsigned long)(unsigned int)loc_2e;
                    *(int *)((char *)&loc_8 + 2) = (int)(t4 >> 16);
                    *(int *)((char *)&loc_8 + 0) = (int)t4;
                    t5 = far_b2436((long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&arg_0), (int far *)&W_D631, (long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1c));
                    t6 = far_b1fc8((long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1c), (unsigned long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_24));
                    t7 = far_b1ff2((long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1c), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), (long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1c));
                    dx7 = *(int *)((char *)&loc_1c + 0);
                    *(int *)((char *)&loc_4 + 2) = (int)(((long)*(int *)((char *)&loc_1c + 2) << 16 | (unsigned)dx7) + 1L >> 16);
                    *(int *)((char *)&loc_4 + 0) = dx7 + 1;
                    dx8 = *(int *)((char *)&loc_1c + 12);
                    *(int *)((char *)&loc_1c + 18) = *(int *)((char *)&loc_1c + 14);
                    *(int *)((char *)&loc_1c + 16) = dx8;
                    t8 = (long)(int)si * 6L;
                    es4 = (int)(loc_42 >> 16);
                    bx4 = (int)loc_42 + (int)t8;
                    dx9 = *(int far *)MK_FP(es4, bx4);
                    *(int *)((char *)&loc_1c + 14) = *(int far *)MK_FP(es4, bx4 + 2);
                    *(int *)((char *)&loc_1c + 12) = dx9;
                    loc_2e = *(int far *)MK_FP(es4, bx4 + 4);
                    if (di == 0) {
                        ax3 = loc_38;
                        flags = ax3 - *(int *)((char *)&loc_1c + 14);
                        if (!CC(">u", flags) && (CC("!=", flags) || loc_3a <= (unsigned int)*(int *)((char *)&loc_1c + 12))) {
                            *(int *)((char *)&loc_1c + 14) = loc_38;
                            *(int *)((char *)&loc_1c + 12) = loc_3a;
                            loc_2e = loc_36;
                            if (loc_34 == 0) {
                                di = -1;
                            }
                        }
                    }
                    if (di == 1) {
                        ax4 = loc_3c;
                        flags2 = ax4 - *(int *)((char *)&loc_1c + 14);
                        if (!CC(">u", flags2) && (CC("<u", flags2) || loc_3e < (unsigned int)*(int *)((char *)&loc_1c + 12))) {
                            *(int *)((char *)&loc_1c + 14) = loc_3c;
                            *(int *)((char *)&loc_1c + 12) = loc_3e;
                            loc_2e = loc_36;
                            loc_30 = si;
                            si = si - 1;
                            di = 0;
                        }
                    }
                    dx10 = *(int *)((char *)&loc_1c + 12);
                    dx11 = dx10 - *(int *)((char *)&loc_1c + 16);
                    *(int *)((char *)&loc_1c + 10) = (int)(((long)*(int *)((char *)&loc_1c + 14) << 16 | (unsigned)dx10) - *(long *)((char *)&loc_1c + 16) >> 16);
                    *(int *)((char *)&loc_1c + 8) = dx11;
                    ax5 = *(int *)((char *)&loc_4 + 2);
                    flags3 = ax5 - *(int *)((char *)&loc_1c + 10);
                    if (!CC("<u", flags3) && (CC("!=", flags3) || (unsigned int)*(int *)((char *)&loc_4 + 0) >= (unsigned int)*(int *)((char *)&loc_1c + 8))) {
                        dx12 = *(int *)((char *)&loc_1c + 8);
                        *(int *)((char *)&loc_4 + 2) = *(int *)((char *)&loc_1c + 10);
                        *(int *)((char *)&loc_4 + 0) = dx12;
                    }
                    bx5 = (int)arg_4;
                    es5 = (int)(arg_4 >> 16);
                    ax6 = *(int *)((char *)&loc_4 + 2);
                    dx13 = *(int *)((char *)&loc_4 + 0);
                    *(int far *)MK_FP(es5, bx5) = *(int far *)MK_FP(es5, bx5) + dx13;
                    *(int far *)MK_FP(es5, bx5 + 2) = (int)(*(long far *)MK_FP(es5, bx5) + ((long)ax6 << 16 | (unsigned)dx13) >> 16);
                    t9 = far_b2436((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), (long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1c));
                    p74 = SEG_STACK;
                    p76 = (int)(unsigned)&loc_1c;
                    p78 = SEG_DATA;
                    p80 = (int)(unsigned)&W_D631;
                    p82 = SEG_STACK;
                    p84 = (int)(unsigned)&loc_1c;
                    t10 = far_b1ff2(((long)p82 << 16 | (unsigned)p84), ((long)p78 << 16 | (unsigned)p80), ((long)p74 << 16 | (unsigned)p76));
                    bx3 = UNDEF;
                    cx = UNDEF;
                    es3 = UNDEF;
                    ax7 = *(int *)((char *)&loc_24 + 2);
                    flags4 = ax7 - *(int *)((char *)&loc_1c + 6);
                    if (!CC(">u", flags4) && (CC("<u", flags4) || (unsigned int)*(int *)((char *)&loc_24 + 0) < (unsigned int)*(int *)((char *)&loc_1c + 4))) {
                        ax8 = W_D633;
                        dx14 = W_D631;
                        *(int *)((char *)&loc_24 + 0) = *(int *)((char *)&loc_24 + 0) + dx14;
                        *(int *)((char *)&loc_24 + 2) = (int)(loc_24 + ((long)ax8 << 16 | (unsigned)dx14) >> 16);
                        *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - 1;
                        arg_2 = arg_2 - (*(int *)((char *)&arg_0 + 0) == 0);
                    }
                    dx15 = *(int *)((char *)&arg_0 + 0);
                    dx16 = dx15 - *(int *)((char *)&loc_1c + 0);
                    arg_2 = (int)(((long)arg_2 << 16 | (unsigned)dx15) - loc_1c >> 16);
                    *(int *)((char *)&arg_0 + 0) = dx16;
                    ax9 = *(int *)((char *)&loc_1c + 6);
                    dx17 = *(int *)((char *)&loc_1c + 4);
                    *(int *)((char *)&loc_24 + 0) = *(int *)((char *)&loc_24 + 0) - dx17;
                    *(int *)((char *)&loc_24 + 2) = (int)(loc_24 - ((long)ax9 << 16 | (unsigned)dx17) >> 16);
                    flags5 = arg_2;
                    if (!CC(">", flags5) && (CC("!=", flags5) || *(int *)((char *)&arg_0 + 0) == 0)) {
                        goto L2;
                    }
                    si = si + 1;
                    continue;
                }
                break;
            }
            goto L3;
        }
    }
    if (loc_34 != 0) {
        return ((long)dx2 << 16 | (unsigned)0);
    }
    bx6 = (int)arg_4;
    es6 = (int)(arg_4 >> 16);
    ax10 = *(int far *)MK_FP(es6, bx6 + 2);
    dx18 = *(int far *)MK_FP(es6, bx6);
    flags6 = ax10 - loc_38;
    if (!CC("<u", flags6) && (CC("!=", flags6) || dx18 >= loc_3a)) {
        ax11 = 1;
    } else {
        ax11 = 0;
    }
    return ((long)dx18 << 16 | (unsigned)ax11);
L2:
    di = -1;
L3:
    dx2 = loc_3e;
    *(int *)((char *)&loc_1c + 14) = loc_3c;
    *(int *)((char *)&loc_1c + 12) = dx2;
    goto L1;
}
