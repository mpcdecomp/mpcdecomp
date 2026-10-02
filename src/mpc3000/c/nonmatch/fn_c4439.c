/* differs: 308 at +5, 454 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
struct g_W_F000 {
    long f_0;
};
extern char B_D5DD;
extern unsigned char B_D5DE;
extern struct g_W_F000 W_F000;
extern int W_F002;
extern int far far_b08f7(int);
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3471(void far *, char far *, int);
extern long far far_b3b9f(int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern int far far_cd551(char far *);

long far fn_c4439(int arg_0)
{
    char loc_12[18];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    unsigned int cx;
    int cx2;
    unsigned int cx3;
    int cx4;
    unsigned int cx5;
    int cx6;
    int ds;
    int dx;
    int dx2;
    int si;
    int si2;
    int si3;
    int t1;
    long t2;
    int t3;
    long t4;
    int t5;
    int t6;
    long t7;
    int t8;
    int t9;

    B_D5DD = (char)51;
    cx = ~__repne_scas1((int)W_F000.f_0, 0, -1);
    cx2 = cx >> 1;
    ax = W_F002;
    si = *(int *)((char *)&W_F000 + 0);
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_12), ((long)ax << 16 | (unsigned)si), cx2 * 2);
    __movs1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_12 + cx2 * 2)), ((long)ax << 16 | (unsigned)(si + cx2 * 2)), cx & 1);
    ds = SEG_DATA;
    for (;;) {
        t1 = far_b1aac();
        t2 = far_b6cd3(MK_FP(ds, 0x4f84));
        t3 = far_b1ad0(1, 0);
        t4 = far_b3471(MK_FP(ds, 0x4f93), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_12), 16);
        t5 = far_b1ad0(2, 0);
        t6 = far_b1b05(MK_FP(ds, 0x4fa7));
        t7 = far_b90dd();
        t8 = far_b1ad0(7, 0);
        ax2 = far_b1b05(MK_FP(ds, 0x5046));
        do {
            t9 = far_b08f7(1);
            dx = t9;
        } while (t9 == 0);
        if (dx != 120) {
            break;
        }
        if (far_cd551((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_12)) == -4 || far_cd551((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_12)) == arg_0) {
            goto L1;
        }
        dx2 = (int)(far_b3b9f(1) >> 16);
        cx3 = ~__repne_scas1((int)*(long far *)MK_FP(ds, (unsigned)&W_F000), 0, -1);
        cx4 = cx3 >> 1;
        ax3 = *(int far *)MK_FP(ds, (unsigned)&W_F002);
        si2 = *(int far *)MK_FP(ds, (unsigned)&W_F000);
        __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_12), ((long)ax3 << 16 | (unsigned)si2), cx4 * 2);
        __movs1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_12 + cx4 * 2)), ((long)ax3 << 16 | (unsigned)(si2 + cx4 * 2)), cx3 & 1);
        ds = ds;
    }
    goto L2;
L1:
    ax4 = *(int far *)MK_FP(ds, (unsigned)&W_F002);
    si3 = *(int far *)MK_FP(ds, (unsigned)&W_F000);
    cx5 = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_12), 0, -1);
    cx6 = cx5 >> 1;
    __movs2(((long)ax4 << 16 | (unsigned)si3), MK_FP(SEG_STACK, si3), cx6 * 2);
    __movs1(((long)ax4 << 16 | (unsigned)(si3 + cx6 * 2)), MK_FP(SEG_STACK, si3 + cx6 * 2), cx5 & 1);
    dx = *(char far *)MK_FP(ds, (unsigned)&B_D5DE);
L2:
    return ((long)dx << 16 | (unsigned)dx);
}
