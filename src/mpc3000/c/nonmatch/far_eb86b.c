/* differs: 308 at +5, 661 bytes; 311 at +5, 661 bytes; 312 at +5, 661 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_8455;
extern char B_8800;
extern unsigned char B_8A88;
extern char B_D612;
extern unsigned char TBL_8456[];
extern int TBL_882E;
extern unsigned char TBL_8830[];
extern unsigned char TBL_D62B[];
extern int W_87EE;
extern int W_87F6;
extern int W_87F8;
extern int W_87FA;
extern int W_87FC;
extern int W_9039;
extern int W_903B;
extern int W_903D;
extern int W_903F;
extern int W_D651;
extern int far far_b1fc8();
extern long far far_b2436();
extern long far far_daba8();
extern long far far_eb13c();
extern long far far_eb578();
extern long far fn_eba9d();

long far far_eb86b(long arg_0, int arg_2, long arg_4, int arg_6)
{
    char loc_10[16];
    char loc_18[8];
    char loc_20[8];
    char loc_3a[26];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int bx2;
    int bx3;
    int di;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    unsigned int dx5;
    int dx6;
    int dx7;
    int dx8;
    int dx9;
    int es;
    int es2;
    int flags;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    int t5;
    long t6;
    long t7;

    __movs2(arg_4, MK_FP(SEG_DATA, 0x7e5f), 10);
    ax = *(int *)((char *)&arg_0 + 0) | arg_2;
    if (ax != 0) {
        if (B_D612 == 0) {
            t1 = far_eb13c(W_D651);
            *(int *)((char *)&loc_10 + 2) = (int)(t1 >> 16);
            *(int *)((char *)&loc_10 + 0) = (int)t1;
            ax2 = (int)far_b2436((long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&arg_0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_10), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_3a));
            goto L1;
        }
        if (B_8800 != 0) {
            bx = B_8455;
            dx = W_87FA;
            *(int *)((char *)&loc_3a + 22) = W_87FC;
            *(int *)((char *)&loc_3a + 20) = dx;
            dx2 = W_87F6;
            *(int *)((char *)&loc_3a + 18) = W_87F8;
            *(int *)((char *)&loc_3a + 16) = dx2;
            di = W_87EE;
            *(int *)((char *)&loc_3a + 14) = SEG_DATA;
            *(int *)((char *)&loc_3a + 12) = (int)(unsigned)TBL_8456;
        } else {
            bx = B_8A88;
            dx3 = W_903D;
            *(int *)((char *)&loc_3a + 22) = W_903F;
            *(int *)((char *)&loc_3a + 20) = dx3;
            dx2 = W_9039;
            *(int *)((char *)&loc_3a + 18) = W_903B;
            *(int *)((char *)&loc_3a + 16) = dx2;
            di = TBL_882E;
            *(int *)((char *)&loc_3a + 14) = SEG_DATA;
            *(int *)((char *)&loc_3a + 12) = (int)(unsigned)TBL_8830;
        }
        ax = *(int *)((char *)&loc_3a + 20) | *(int *)((char *)&loc_3a + 22);
        if (ax != 0) {
            es = (int)(*(long *)((char *)&loc_3a + 12) >> 16);
            bx2 = (int)*(long *)((char *)&loc_3a + 12) + bx * 6;
            dx4 = *(int *)((char *)&loc_3a + 20);
            *(int far *)MK_FP(es, bx2 + 2) = *(int *)((char *)&loc_3a + 22);
            *(int far *)MK_FP(es, bx2) = dx4;
            ax3 = arg_2;
            dx5 = *(int *)((char *)&arg_0 + 0);
            *(int *)((char *)&loc_10 + 14) = ax3;
            *(int *)((char *)&loc_10 + 12) = dx5;
            flags = ax3 - *(int *)((char *)&loc_3a + 18);
            if (!CC("<u", flags) && (CC(">u", flags) || dx5 > (unsigned int)*(int *)((char *)&loc_3a + 16))) {
                dx6 = *(int *)((char *)&loc_3a + 16);
                *(int *)((char *)&loc_10 + 14) = *(int *)((char *)&loc_3a + 18);
                *(int *)((char *)&loc_10 + 12) = dx6;
            }
            *(int *)((char *)&loc_3a + 24) = (int)fn_eba9d(*(long *)((char *)&loc_10 + 12), *(int *)((char *)&loc_3a + 12), *(int *)((char *)&loc_3a + 14), 0, 0L, 0x1000, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_3a));
            ax4 = *(int *)((char *)&loc_10 + 14);
            dx7 = *(int *)((char *)&loc_10 + 12);
            *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - dx7;
            arg_2 = (int)(arg_0 - ((long)ax4 << 16 | (unsigned)dx7) >> 16);
            dx8 = *(int *)((char *)&loc_3a + 20);
            dx9 = dx8 - *(int *)((char *)&loc_3a + 16);
            ax5 = (int)(((long)*(int *)((char *)&loc_3a + 22) << 16 | (unsigned)dx8) - *(long *)((char *)&loc_3a + 16) >> 16);
            *(int *)((char *)&loc_10 + 10) = ax5;
            *(int *)((char *)&loc_10 + 8) = dx9;
            si = (unsigned)(arg_0 / ((long)ax5 << 16 | (unsigned)dx9));
            t2 = arg_0 % *(long *)((char *)&loc_10 + 8);
            *(int *)((char *)&loc_10 + 6) = (int)(t2 >> 16);
            *(int *)((char *)&loc_10 + 4) = (int)t2;
            t3 = fn_eba9d(MK_FP((int)(t2 >> 16), *(int *)((char *)&loc_10 + 4)), *(int *)((char *)&loc_3a + 12), *(int *)((char *)&loc_3a + 14), *(int *)((char *)&loc_3a + 24), *(long *)((char *)&loc_3a + 16), di, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18));
            if (si != 0) {
                t4 = fn_eba9d(*(long *)((char *)&loc_10 + 8), *(int *)((char *)&loc_3a + 12), *(int *)((char *)&loc_3a + 14), *(int *)((char *)&loc_3a + 24), *(long *)((char *)&loc_3a + 16), di, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20));
                for (;;) {
                    ax6 = si;
                    si = si - 1;
                    if (ax6 == 0) {
                        break;
                    }
                    t5 = far_b1fc8((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20));
                }
            }
            ax7 = far_b1fc8((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_3a), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18));
L1:
            *(int *)((char *)&loc_3a + 10) = 0;
            *(int *)((char *)&loc_3a + 8) = 0;
            t6 = far_daba8((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_3a), (unsigned char far *)TBL_D62B);
            bx3 = (int)arg_4;
            es2 = (int)(arg_4 >> 16);
            *(int far *)MK_FP(es2, bx3) = *(int *)((char *)&loc_3a + 6);
            *(int far *)MK_FP(es2, bx3 + 2) = *(int *)((char *)&loc_3a + 8);
            *(int far *)MK_FP(es2, bx3 + 4) = *(int *)((char *)&loc_3a + 10);
            *(int far *)MK_FP(es2, bx3 + 6) = *(int *)((char *)&loc_3a + 0);
            *(int far *)MK_FP(es2, bx3 + 8) = *(int *)((char *)&loc_3a + 2);
            t7 = far_eb578(((long)arg_6 << 16 | (unsigned)bx3), MK_FP(SEG_DATA, 0x7e5f), ((long)arg_6 << 16 | (unsigned)bx3));
            ax = (int)t7;
            dx2 = (int)(t7 >> 16);
        }
    }
    return ((long)dx2 << 16 | (unsigned)ax);
}
long far fn_eba9d(long p0, int p1, int p2, int p3, long p4, int p5, char far *p6) { return 0; }
