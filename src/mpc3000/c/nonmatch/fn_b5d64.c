/* differs: 308 at +5, 350 bytes; 311 at +5, 351 bytes; 312 at +5, 351 bytes */
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
extern char B_956A;
extern char B_D5DD;
extern unsigned char TBL_9408[];
extern int far far_b08f7(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern long far far_b3b9f(void);
extern long far far_b6cd3(int);
extern long far far_b90dd(void);
extern int far far_d7903(void);
extern int far far_d7f67(int);

long far fn_b5d64(struct s1 far *arg_0, int arg_2)
{
    int loc_2;
    int loc_4;
    int ax;
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
    int cx3;
    int di;
    int ds;
    int dx;
    unsigned int dx2;
    int dx3;
    int si;
    long t1;
    long t2;
    int t3;
    int t4;
    int t5;
    int t6;
    long t7;

    t1 = far_b6cd3(0x26be);
    B_D5DD = (char)104;
    far_b1ad0(1);
    far_b1b05(0x26db);
    far_b1b05(0x2702);
    far_b1b05(0x2729);
    far_b1b05(0x2752);
    t2 = far_b90dd();
    ax6 = far_b1b05(0x275b);
    do {
        t3 = far_b08f7();
        dx = t3;
    } while (t3 == 0);
    if (dx == 120) {
        t4 = far_b1ad0(7);
        t5 = far_b1b05(0x2763);
        B_956A = (char)(B_956A + 1);
        t6 = far_d7f67(*(int *)((char *)&arg_0 + 0));
        loc_2 = t6;
        if (t6 != 0) {
            t7 = far_b3b9f();
            ds = SEG_DATA;
        } else {
            if (arg_0->f_b != 0) {
                ax7 = 16;
            } else {
                ax7 = 8;
            }
            loc_4 = ax7;
            dx2 = loc_4;
            cx = ~__repne_scas1(arg_0, 0, -1);
            ax8 = arg_2;
            si = *(int *)((char *)&arg_0 + 0);
            dx3 = dx2 - cx;
            if (dx2 < cx) {
                cx = cx + dx3;
                dx3 = 0;
            }
            cx2 = cx >> 1;
            __movs2((unsigned char far *)TBL_9408, ((long)ax8 << 16 | (unsigned)si), cx2 * 2);
            di = (int)(unsigned)(TBL_9408 + cx2 * 2);
            cx3 = cx & 1;
            __movs1(MK_FP(SEG_DATA, di), ((long)ax8 << 16 | (unsigned)(si + cx2 * 2)), cx3);
            __stos1(MK_FP(SEG_DATA, di + cx3), 0, dx3);
            ds = SEG_DATA;
            *(char far *)MK_FP(ds, (unsigned)&TBL_9408 + loc_4) = (char)0;
        }
        ax9 = far_d7903();
        *(char far *)MK_FP(ds, (unsigned)&B_956A) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_956A) - 1);
        dx = 0;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b6cd3(int p0) { return 0; }
