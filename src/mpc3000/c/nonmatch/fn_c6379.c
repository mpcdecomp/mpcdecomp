/* differs: 308 at +5, 397 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_FP_E40C {
    long f_0;
};
extern unsigned char B_7B8D;
extern char B_D5DD;
extern char B_E421;
extern struct g_FP_E40C FP_E40C;
extern int W_E40E;
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3471(void far *, char far *, int);
extern long far far_b3819(void far *, char far *, int, int, int, int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern int far far_c6547(int);

long far fn_c6379(void)
{
    char loc_14[19];
    char loc_1;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    unsigned int cx;
    int cx2;
    int cx3;
    unsigned int cx4;
    int cx5;
    int cx6;
    int di;
    int di2;
    int di3;
    int ds;
    int dx;
    int p30;
    int si;
    int si2;
    int si3;
    int si4;
    int si5;
    long t1;
    long t2;
    long t3;
    long t4;
    int t5;
    long t6;
    int t7;
    long t8;
    int t9;

    B_D5DD = (char)43;
    far_b1aac();
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x5630));
    loc_1 = (char)(B_E421 + 1);
    t2 = far_b3819(MK_FP(SEG_DATA, 0x5741), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), 2, 1, 24, 8);
    cx = ~__repne_scas1((int)FP_E40C.f_0, 0, -1);
    cx2 = cx >> 1;
    ax2 = W_E40E;
    si = *(int *)((char *)&FP_E40C + 0);
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_14), ((long)ax2 << 16 | (unsigned)si), cx2 * 2);
    si2 = si + cx2 * 2;
    di = (int)(unsigned)(loc_14 + cx2 * 2);
    cx3 = cx & 1;
    __movs1(MK_FP(SEG_STACK, di), ((long)ax2 << 16 | (unsigned)si2), cx3);
    si3 = si2 + cx3;
    di2 = di + cx3;
    ds = SEG_DATA;
    t3 = far_b3471(MK_FP(ds, 0x54ee), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_14), 16);
    far_b1ad0(6, 0);
    t4 = far_b90dd();
    far_b1ad0(7, 0);
    p30 = 0x56f9;
    ax5 = far_b1b05(MK_FP(ds, p30));
    for (;;) {
        t9 = far_b08f7(1);
        dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)t9);
        if ((char)t9 != 0) {
            break;
        }
        if (*(char far *)MK_FP(ds, (unsigned)&B_7B8D) != 0) {
            continue;
        }
        t5 = far_c6547(loc_1 - 1);
        t6 = far_b1073(0);
        p30 = (int)(unsigned)loc_14;
        t7 = __repne_scas1((int)*(long far *)MK_FP(ds, (unsigned)&FP_E40C), 0, -1);
        cx4 = ~t7;
        cx5 = cx4 >> 1;
        ax7 = *(int far *)MK_FP(ds, (unsigned)&W_E40E);
        si4 = *(int far *)MK_FP(ds, (unsigned)&FP_E40C);
        __movs2(MK_FP(SEG_STACK, p30), ((long)ax7 << 16 | (unsigned)si4), cx5 * 2);
        si5 = si4 + cx5 * 2;
        di3 = p30 + cx5 * 2;
        cx6 = cx4 & 1;
        __movs1(MK_FP(SEG_STACK, di3), ((long)ax7 << 16 | (unsigned)si5), cx6);
        si3 = si5 + cx6;
        di2 = di3 + cx6;
        ds = ds;
        t8 = far_b1073(1);
    }
    if ((char)t9 == 120) {
        ax6 = far_c6547(loc_1 - 1);
        dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)76);
    }
    return ((long)dx << 16 | (unsigned)(char)dx);
}
int far far_c6547(int p0) { return 0; }
