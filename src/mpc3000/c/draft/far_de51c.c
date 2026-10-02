/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define UNDEF 0
struct g_W_D639 {
    long f_0;
};
struct g_W_D63D {
    long f_0;
};
struct g_W_D645 {
    long f_0;
};
extern unsigned char B_7FD1;
extern unsigned char TBL_de739[];
extern unsigned char TBL_de74c[];
extern unsigned char TBL_de76c[];
extern unsigned int W_D60E;
extern int W_D61F;
extern int W_D621;
extern int W_D623;
extern int W_D625;
extern int W_D631;
extern int W_D633;
extern int W_D635;
extern int W_D637;
extern struct g_W_D639 W_D639;
extern unsigned int W_D63B;
extern struct g_W_D63D W_D63D;
extern int W_D63F;
extern int W_D641;
extern int W_D643;
extern struct g_W_D645 W_D645;
extern int W_D655;
extern int W_D657;
extern void near fn_de745(void);

long far far_de51c(void)
{
    int ax;
    int ax10;
    unsigned int ax11;
    unsigned int ax12;
    unsigned int ax13;
    int ax14;
    unsigned int ax15;
    unsigned int ax16;
    int ax17;
    unsigned int ax18;
    int ax19;
    unsigned int ax2;
    int ax20;
    int ax3;
    unsigned int ax4;
    unsigned int ax5;
    int ax6;
    int ax7;
    unsigned int ax8;
    int ax9;
    unsigned int bx;
    int bx2;
    int cx;
    int di;
    unsigned int di2;
    unsigned int di3;
    int di4;
    unsigned int dx;
    int dx10;
    int dx11;
    unsigned int dx2;
    unsigned int dx3;
    int dx4;
    int dx5;
    unsigned int dx6;
    unsigned int dx7;
    unsigned int dx8;
    unsigned int dx9;
    int p2;
    int p22;
    unsigned int si;
    int t1;
    int t2;
    int t3;
    int t4;
    int t5;
    int t6;
    long t7;
    int t8;
    int t9;

    if (B_7FD1 == 2 || B_7FD1 == 1) {
        do {
            fn_de745();
        } while (!CC("<u", UNDEF));
        ax9 = W_D635;
        dx6 = W_D637;
        ax2 = ax9 - UNDEF;
        dx7 = (int)(((long)dx6 << 16 | (unsigned)ax9) - ((long)UNDEF << 16 | (unsigned)UNDEF) >> 16);
        dx8 = dx7 << 1 | dx6 < (unsigned int)UNDEF;
        p2 = __flags(dx8);
        dx4 = dx8 >> 1 | (dx7 >> 15 & 1) << 15;
        if (dx4 != 0 || ax2 > 1) {
            goto L1;
        }
        __insn("popf", p2);
        t4 = __insn("cmc ");
        p22 = __flags(UNDEF);
        if (CC("<u", UNDEF)) {
            ax5 = UNDEF - W_D60E;
            dx5 = (int)(((long)UNDEF << 16 | (unsigned)UNDEF) - (unsigned long)(unsigned int)W_D60E >> 16);
            if (dx5 < 0) {
                ax12 = ~ax5;
                ax5 = ax12 + 1;
                dx5 = ~dx5 + (ax5 < ax12);
                __insn("popf", p22);
                t5 = __insn("cmc ");
                p22 = __flags(UNDEF);
            }
        } else {
            ax10 = W_D631;
            ax11 = ax10 - UNDEF;
            ax5 = ax11 + W_D60E;
            dx5 = (int)(((long)W_D633 << 16 | (unsigned)ax10) - ((long)UNDEF << 16 | (unsigned)UNDEF) >> 16) + (ax5 < ax11);
        }
        goto L2;
    }
    ax = W_D635;
    dx = W_D637;
    ax2 = ax - *(int *)((char *)&W_D639 + 0);
    dx2 = (int)(((long)dx << 16 | (unsigned)ax) - W_D639.f_0 >> 16);
    dx3 = dx2 << 1 | dx < W_D63B;
    p2 = __flags(dx3);
    dx4 = dx3 >> 1 | (dx2 >> 15 & 1) << 15;
    if (dx4 != 0 || ax2 > 1) {
L1:
        __insn("popf", p2);
        p22 = __flags(UNDEF);
        if (CC(">=u", UNDEF)) {
            ax16 = ax2 - 1;
            dx10 = dx4 - (ax2 == 0);
        } else {
            ax15 = ~ax2;
            ax16 = ax15 + 1;
            dx10 = ~dx4 + (ax16 < ax15);
        }
        bx2 = 16;
        if (dx10 == 0 && (ax16 & -16) == 0) {
            bx2 = ax16 & 15;
        }
        bx = *(int far *)MK_FP(0xe6b7, (unsigned int)(unsigned)(TBL_de74c + (bx2 - 1 << 1)));
    } else {
        __insn("popf", p2);
        t1 = __insn("cmc ");
        p22 = __flags(UNDEF);
        if (CC("<u", UNDEF)) {
            ax6 = W_D641;
            ax7 = ax6 - *(int *)((char *)&W_D63D + 0);
            ax5 = ax7 - W_D60E;
            dx5 = FP_SEG(MK_FP((int)(((long)W_D643 << 16 | (unsigned)ax6) - W_D63D.f_0 >> 16), ax7) - (unsigned long)(unsigned int)W_D60E);
            if (dx5 < 0) {
                ax8 = ~ax5;
                ax5 = ax8 + 1;
                dx5 = ~dx5 + (ax5 < ax8);
                __insn("popf", p22);
                t2 = __insn("cmc ");
                p22 = __flags(UNDEF);
            }
        } else {
            ax3 = *(int *)((char *)&W_D63D + 0);
            ax4 = ax3 - *(int *)((char *)&W_D645 + 0);
            ax5 = ax4 + W_D60E;
            dx5 = (int)(((long)W_D63F << 16 | (unsigned)ax3) - W_D645.f_0 >> 16) + (ax5 < ax4);
            if (dx5 < 0) {
                ax5 = 0;
                dx5 = 0;
            }
        }
L2:
        di = W_D641;
        di2 = di - *(int *)((char *)&W_D645 + 0);
        si = (int)(((long)W_D643 << 16 | (unsigned)di) - W_D645.f_0 >> 16);
        W_D623 = ax5;
        W_D625 = dx5;
        W_D61F = di2;
        W_D621 = si;
        fn_de745();
        ax13 = UNDEF;
        dx9 = UNDEF;
        if (CC(">=u", UNDEF)) {
            goto L3;
        }
        cx = 16;
        while (si != 0) {
            dx9 = dx9 >> 1;
            ax13 = ax13 >> 1 | (dx9 & 1) << 15;
            si = si >> 1;
            di2 = di2 >> 1 | (si & 1) << 15;
            cx = cx - 1;
            if (cx != 0) {
                continue;
            }
            break;
        }
        if (di2 != 0) {
            ax14 = (unsigned)((unsigned long)((long)ax13 << 16 | (unsigned)0) / (unsigned long)(unsigned int)di2);
        } else {
L3:
            ax14 = -1;
        }
        bx = *(int far *)MK_FP(0xe6b7, (unsigned int)(unsigned)(TBL_de76c + ((unsigned char)((unsigned int)(char)(ax14 >> 8) >> 4) << 1)));
    }
    if (B_7FD1 == 2 || B_7FD1 == 1) {
        ax18 = W_D657;
    } else {
        ax17 = W_D641;
        ax18 = (unsigned)((unsigned long)MK_FP((int)(((long)W_D643 << 16 | (unsigned)ax17) - W_D645.f_0 >> 16), ax17 - *(int *)((char *)&W_D645 + 0)) / (unsigned long)(unsigned int)*(int far *)MK_FP(0xe6b7, (unsigned int)(unsigned)(TBL_de739 + (B_7FD1 << 1))));
        if (ax18 <= 0xc350) {
            if (ax18 < 0xdf3) {
                ax18 = 0xdf3;
            }
        } else {
            ax18 = -0x3cb0;
        }
        W_D657 = ax18;
    }
    di3 = ax18;
    t7 = (unsigned long)(unsigned int)ax18 * (unsigned long)(unsigned int)bx;
    ax19 = ((char)(int)(t7 >> 16) << 8 | (unsigned char)(char)((int)t7 >> 8));
    __insn("popf", p22);
    if (CC(">=u", UNDEF)) {
        di4 = di3 - ax19;
        dx11 = 0;
        ax20 = 0xdf3;
        if ((int)((unsigned long)(unsigned int)di3 - ((long)(unsigned char)(char)((int)(t7 >> 16) >> 8) << 16 | (unsigned)ax19) >> 16) < 0) {
            goto L4;
        }
        fn_de745();
        ax20 = UNDEF;
        dx11 = UNDEF;
        if (!CC("<u", UNDEF)) {
L4:
            di4 = ax20;
        }
    } else {
        di4 = di3 + ax19;
        fn_de745();
        ax20 = UNDEF;
        dx11 = UNDEF;
        if (!CC(">u", UNDEF)) {
            di4 = ax20;
        }
    }
    W_D655 = di4;
    return ((long)dx11 << 16 | (unsigned)ax20);
}
void near fn_de745(void) { }
