/* differs: 308 at +5, 128 bytes; 311 at +5, 128 bytes; 312 at +5, 128 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_735C;
extern unsigned char B_735D;
extern unsigned char TBL_A633[];
extern unsigned char TBL_A787[];
extern long far far_d7805(int, char far *, int, int);

int far far_e66a4(void)
{
    char loc_6[6];
    int loc_8;
    int ax;
    unsigned int cx;
    int cx2;
    int ds;
    int si;
    long t1;

    *(int *)((char *)&loc_6 + 4) = 1;
    loc_8 = (int)(unsigned)TBL_A633;
    ds = SEG_DATA;
L1:
    t1 = far_d7805(*(int *)((char *)&loc_6 + 4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), 2, 48);
    *(char far *)MK_FP(ds, (unsigned)&B_735C) = loc_6[0];
    *(char far *)MK_FP(ds, (unsigned)&B_735D) = loc_6[1];
    si = loc_8;
    cx = ~__repne_scas1(MK_FP(ds, 0x6b2e), 0, -1);
    cx2 = cx >> 1;
    ax = ds;
    __movs2(MK_FP(ds, si), ((long)ax << 16 | (unsigned)si), cx2 * 2);
    __movs1(MK_FP(ds, si + cx2 * 2), ((long)ax << 16 | (unsigned)(si + cx2 * 2)), cx & 1);
    ds = ds;
    *(int *)((char *)&loc_6 + 4) = *(int *)((char *)&loc_6 + 4) + 1;
    loc_8 = loc_8 + 17;
    if (loc_8 != (unsigned int)(unsigned)TBL_A787) {
        goto L1;
    }
    return ax;
}
