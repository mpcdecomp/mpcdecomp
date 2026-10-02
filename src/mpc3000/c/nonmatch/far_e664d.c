/* differs: 308 at +3, 140 bytes; 311 at +3, 141 bytes; 312 at +3, 141 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
struct s1 {
    char pad_0[16];
    char f_10;
};
extern unsigned char TBL_A633[];

int far far_e664d(int arg_0, struct s1 far *arg_2, int arg_4)
{
    int ax;
    int ax2;
    unsigned int cx;
    int cx2;
    int dx;
    int si;
    int si2;

    dx = 0;
    si = *(int *)((char *)&arg_2 + 0);
L1:
    if (*(char far *)MK_FP(arg_4, si) == 0) {
        goto L2;
    }
    arg_2->f_10 = (char)0;
    si = si + 1;
    dx = dx + 1;
    if (dx < 16) {
        goto L1;
    }
L2:
    ax = (int)(unsigned)(TBL_A633 + arg_0 * 17);
    cx = ~__repne_scas1(arg_2, 0, -1);
    cx2 = cx >> 1;
    ax2 = arg_4;
    si2 = *(int *)((char *)&arg_2 + 0);
    __movs2(MK_FP(SEG_DATA, ax), ((long)ax2 << 16 | (unsigned)si2), cx2 * 2);
    __movs1(MK_FP(SEG_DATA, ax + cx2 * 2), ((long)ax2 << 16 | (unsigned)(si2 + cx2 * 2)), cx & 1);
    return ax2;
}
