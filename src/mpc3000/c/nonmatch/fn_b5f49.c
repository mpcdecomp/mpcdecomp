/* differs: 308 at +5, 427 bytes; 311 at +5, 429 bytes; 312 at +5, 429 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[11];
    char f_b;
};
extern char B_D5DD;
extern int far far_b08f7();
extern long far far_b0fe4();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern long far far_b3471();
extern long far far_b3b9f();
extern long far far_b6beb();
extern long far far_b6cd3();
extern long far far_b90dd();
extern void far far_cab9e();
extern long far far_cad00();
extern long far far_fa274();

long far fn_b5f49(struct s1 far *arg_0, int arg_2)
{
    char loc_18[24];
    char loc_2e[22];
    int ax;
    int ax10;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    unsigned int cx;
    int cx2;
    int di;
    int dx;
    int dx2;
    int si;
    int si2;
    int si3;
    long t1;
    int t10;
    long t11;
    long t12;
    long t2;
    int t3;
    long t4;
    long t5;
    int t6;
    int t7;
    long t8;
    long t9;

    t1 = far_b6cd3(0x27b0);
    B_D5DD = (char)72;
    far_b1ad0(2);
    far_b1b05(0x27be);
    t2 = far_b6beb(arg_0, loc_2e);
    t3 = far_b1b05(loc_2e);
    cx = ~__repne_scas1(arg_0, 0, -1);
    cx2 = cx >> 1;
    ax3 = arg_2;
    si = *(int *)((char *)&arg_0 + 0);
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18), ((long)ax3 << 16 | (unsigned)si), cx2 * 2);
    __movs1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_18 + cx2 * 2)), ((long)ax3 << 16 | (unsigned)(si + cx2 * 2)), cx & 1);
    if (arg_0->f_b != 0) {
        ax4 = 16;
    } else {
        ax4 = 8;
    }
    *(int *)((char *)&loc_18 + 20) = ax4;
    loc_18[*(int *)((char *)&loc_18 + 20)] = (char)0;
    far_b1ad0(4);
    t4 = far_b3471(MK_FP(SEG_DATA, 0x27d0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18));
    t5 = far_b90dd();
    ax6 = far_b1b05(0x27e2);
    for (;;) {
        ax7 = far_b08f7();
        dx = ax7;
        if (ax7 != 0) {
            break;
        }
        si3 = 0;
        for (;;) {
            ax10 = (int)far_fa274();
            loc_18[si3] = (char)ax10;
            if ((char)ax10 == 0) {
                break;
            }
            si3 = si3 + 1;
        }
        loc_18[si3] = (char)0;
        t12 = far_b1073();
    }
    if (dx == 120) {
        t6 = far_b1ad0(7);
        t7 = far_b1b05(0x27ee);
        if ((unsigned int)(~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18), 0, -1) - 1) > 8) {
            ax8 = 16;
        } else {
            ax8 = 8;
        }
        *(int *)((char *)&loc_18 + 22) = ax8;
        t8 = far_b0fe4((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18));
        si2 = 0;
        di = *(int *)((char *)&loc_18 + 20) + *(int *)((char *)&arg_0 + 0);
        ax9 = (int)(unsigned)loc_18;
        dx2 = *(int *)((char *)&loc_18 + 22) + ax9;
        do {
            ax9 = ((char)(ax9 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(arg_2, di));
            *(char far *)MK_FP(SEG_STACK, dx2) = (char)ax9;
            di = di + 1;
            dx2 = dx2 + 1;
            si2 = si2 + 1;
        } while (si2 < 4);
        t9 = far_cad00();
        far_cab9e(arg_0, loc_18);
        t11 = far_b3b9f();
        dx = 0;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b6beb(struct s1 far *p0, char near *p1) { return 0; }
long far far_b6cd3(int p0) { return 0; }
