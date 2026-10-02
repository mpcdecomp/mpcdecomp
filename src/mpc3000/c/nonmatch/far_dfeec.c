/* differs: 308 at +5, 458 bytes; 311 at +5, 457 bytes; 312 at +5, 459 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
};
struct g_TBL_8456 {
    int f_0;
};
struct g_TBL_8458 {
    int f_0;
};
struct g_TBL_8830 {
    int f_0;
};
struct g_TBL_8832 {
    int f_0;
};
struct g_TBL_845A {
    int f_0;
};
struct g_TBL_8834 {
    int f_0;
};
extern unsigned char B_8455;
extern char B_8800;
extern unsigned char B_8A88;
extern char B_8A9E;
extern struct g_TBL_8456 TBL_8456;
extern struct g_TBL_8458 TBL_8458;
extern struct g_TBL_845A TBL_845A;
extern int TBL_882A;
extern int TBL_882C;
extern struct g_TBL_8830 TBL_8830;
extern struct g_TBL_8832 TBL_8832;
extern struct g_TBL_8834 TBL_8834;
extern int W_87F6;
extern int W_87F8;
extern int W_87FA;
extern int W_87FC;
extern int W_8822;
extern int W_8824;
extern int W_8826;
extern int W_8828;
extern int W_9039;
extern int W_903B;
extern int W_903D;
extern int W_903F;
extern int W_9045;
extern int W_9047;

long far far_dfeec(void)
{
    int loc_2;
    unsigned long loc_4;
    int loc_6;
    int loc_8;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx2;
    int cx;
    int cx2;
    int di;
    int dx;
    int dx2;
    unsigned int dx3;
    int dx4;
    int dx5;
    int dx6;
    unsigned int dx7;
    int dx8;
    int flags;
    int flags2;
    struct s1 near *si;
    struct s1 near *si2;
    long t1;
    long t2;

    if (B_8800 != 0) {
        dx = W_87F8;
        ax = W_87F6;
    } else {
        dx = W_903B;
        ax = W_9039;
    }
    loc_2 = dx;
    *(int *)((char *)&loc_4 + 0) = ax;
    di = 0;
    loc_6 = B_8455 * 6;
    loc_8 = B_8A88 * 6;
    do {
        if (B_8800 != 0) {
            bx = loc_6;
            dx2 = W_87FA;
            *(int *)((char *)&TBL_8458 + 0 + bx) = W_87FC;
            *(int *)((char *)&TBL_8456 + 0 + bx) = dx2;
            *(int *)((char *)&TBL_845A + 0 + bx) = 0;
            cx = 0;
            si = (struct s1 near *)&TBL_8456;
            for (;;) {
                ax2 = si->f_2;
                dx3 = si->f_0;
                flags = ax2 - loc_2;
                if (!CC("<u", flags) && (CC(">u", flags) || dx3 > (unsigned int)*(int *)((char *)&loc_4 + 0))) {
                    break;
                }
                si = (struct s1 near *)((char near *)si + 6);
                cx = cx + 1;
            }
            t1 = (long)(int)cx * 6L;
            W_8828 = SEG_DATA;
            W_8826 = (int)(unsigned)(struct g_TBL_8456 near *)((char near *)&TBL_8456 + (int)t1);
            dx4 = *(int *)((char *)&TBL_8456 + 0 + (int)t1);
            dx5 = dx4 - *(int *)((char *)&loc_4 + 0);
            ax3 = (int)(((long)*(int *)((char *)&TBL_8458 + 0 + (int)t1) << 16 | (unsigned)dx4) - loc_4 >> 16);
            TBL_882C = ax3;
            TBL_882A = dx5;
        } else {
            bx2 = loc_8;
            dx6 = W_903D;
            *(int *)((char *)&TBL_8832 + 0 + bx2) = W_903F;
            *(int *)((char *)&TBL_8830 + 0 + bx2) = dx6;
            *(int *)((char *)&TBL_8834 + 0 + bx2) = 0;
            cx2 = 0;
            si2 = (struct s1 near *)&TBL_8830;
            for (;;) {
                ax4 = si2->f_2;
                dx7 = si2->f_0;
                flags2 = ax4 - loc_2;
                if (!CC("<u", flags2) && (CC(">u", flags2) || dx7 > (unsigned int)*(int *)((char *)&loc_4 + 0))) {
                    break;
                }
                si2 = (struct s1 near *)((char near *)si2 + 6);
                cx2 = cx2 + 1;
            }
            t2 = (long)(int)cx2 * 6L;
            W_8828 = SEG_DATA;
            W_8826 = (int)(unsigned)(struct g_TBL_8830 near *)((char near *)&TBL_8830 + (int)t2);
            dx8 = *(int *)((char *)&TBL_8830 + 0 + (int)t2);
            dx5 = dx8 - *(int *)((char *)&loc_4 + 0);
            ax3 = (int)(((long)*(int *)((char *)&TBL_8832 + 0 + (int)t2) << 16 | (unsigned)dx8) - loc_4 >> 16);
            TBL_882C = ax3;
            TBL_882A = dx5;
        }
        if (di == 0) {
            ax3 = W_8828;
            dx5 = W_8826;
            W_8824 = ax3;
            W_8822 = dx5;
            if (B_8A9E <= 0) {
                ax3 = W_9047;
                dx5 = W_9045;
                loc_2 = ax3;
                *(int *)((char *)&loc_4 + 0) = dx5;
            } else {
                loc_2 = 0;
                *(int *)((char *)&loc_4 + 0) = 0;
            }
        }
        di = di + 1;
    } while (di < 2);
    return ((long)dx5 << 16 | (unsigned)ax3);
}
