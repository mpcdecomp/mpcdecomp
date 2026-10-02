/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define SEG_STACK _SS
struct g_W_EFE8 {
    long f_0;
};
extern char B_537B;
extern char B_537C;
extern char B_83BD;
extern int W_D4B2;
extern struct g_W_EFE8 W_EFE8;
extern int W_EFEA;
extern int W_EFF0;
extern int W_EFF2;
extern int W_EFF4;
extern int W_EFF6;
extern int W_EFFC;
extern int W_EFFE;
extern int far far_b1ad0(int, int);
extern int far far_b1b2b(char far *, char far *);
extern long far far_fa0c8(int, int, int);

long far fn_c3b74(unsigned int arg_0, unsigned int arg_2, int arg_4, int arg_6)
{
    char loc_e;
    char loc_d;
    int loc_c;
    int loc_a;
    unsigned int loc_8;
    int loc_6;
    long loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int cx;
    int cx2;
    int dx;
    int dx2;
    int dx3;
    unsigned int dx4;
    unsigned int dx5;
    int flags;
    long t1;
    long t2;
    long t3;

    B_537C = (char)2;
    W_D4B2 = 0;
    far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_d), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_e));
    far_b1ad0(7, 0);
    far_b1ad0(loc_d, loc_e);
    if (arg_0 >= arg_2) {
        loc_2 = 0;
        *(int *)((char *)&loc_4 + 0) = arg_2 + 0x2400 - arg_0;
    } else {
        loc_2 = 0;
        *(int *)((char *)&loc_4 + 0) = arg_2 - arg_0;
    }
    if (B_537B == 0) {
        dx3 = W_EFF4;
        loc_6 = W_EFF6;
        loc_8 = dx3;
        dx4 = W_EFF0;
        ax4 = W_EFF2 << 1 | dx4 >> 15 & 1;
        loc_a = ax4;
        loc_c = dx4 << 1;
    } else {
        t1 = loc_4 / 2L;
        loc_2 = (int)(t1 >> 16);
        *(int *)((char *)&loc_4 + 0) = (int)t1;
        dx = W_EFFC;
        loc_6 = W_EFFE;
        loc_8 = dx;
        ax4 = W_EFF2;
        dx2 = W_EFF0;
        loc_a = ax4;
        loc_c = dx2;
    }
    ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)B_83BD);
    t2 = far_fa0c8(0x1b9, (char)ax5, -((char)ax5 < 0));
    t3 = t2 / 10L;
    cx = arg_4;
    cx2 = cx - *(int *)((char *)&loc_4 + 0);
    W_EFEA = FP_SEG(MK_FP((int)(((long)arg_6 << 16 | (unsigned)cx) - loc_4 >> 16), cx2) - t3);
    *(int *)((char *)&W_EFE8 + 0) = cx2 - (int)t3;
    ax6 = W_EFEA;
    dx5 = *(int *)((char *)&W_EFE8 + 0);
    flags = ax6 - loc_6;
    if (!CC(">", flags) && (CC("<", flags) || dx5 < loc_8)) {
        ax6 = loc_a;
        dx5 = loc_c;
        *(int *)((char *)&W_EFE8 + 0) = *(int *)((char *)&W_EFE8 + 0) + dx5;
        W_EFEA = (int)(W_EFE8.f_0 + ((long)ax6 << 16 | (unsigned)dx5) >> 16);
    }
    return ((long)dx5 << 16 | (unsigned)ax6);
}
