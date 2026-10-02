/* differs: 308 at +5, 242 bytes; 311 at +5, 244 bytes; 312 at +5, 244 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_A633[];
extern char TBL_A7B0[];

long far far_e65be(int arg_0, long arg_2, int arg_4)
{
    int loc_2;
    long loc_4;
    int ax;
    unsigned int cx2;
    int cx3;
    unsigned int cx4;
    int cx5;
    int di;
    int dx;
    int es;
    int si;
    int si2;
    long t1;

    loc_2 = SEG_DATA;
    *(int *)((char *)&loc_4 + 0) = 0x6b3f;
    t1 = (long)(int)arg_0 * 0x1f4L;
    if (TBL_A7B0[(int)t1] == 0) {
        di = (int)arg_2;
        es = (int)(arg_2 >> 16);
        cx2 = ~__repne_scas1((int)loc_4, 0, -1);
        cx3 = cx2 >> 1;
        ax = loc_2;
        si = *(int *)((char *)&loc_4 + 0);
        __movs2(MK_FP(es, di), ((long)ax << 16 | (unsigned)si), cx3 * 2);
        __movs1(MK_FP(es, di + cx3 * 2), ((long)ax << 16 | (unsigned)(si + cx3 * 2)), cx2 & 1);
        return (long)MK_FP((int)(t1 >> 16), 0);
    }
    dx = arg_4;
    si2 = *(int *)((char *)&arg_2 + 0);
    cx4 = ~__repne_scas1((unsigned char far *)(TBL_A633 + arg_0 * 17), 0, -1);
    cx5 = cx4 >> 1;
    __movs2(((long)dx << 16 | (unsigned)si2), MK_FP(SEG_DATA, si2), cx5 * 2);
    __movs1(((long)dx << 16 | (unsigned)(si2 + cx5 * 2)), MK_FP(SEG_DATA, si2 + cx5 * 2), cx4 & 1);
    return ((long)dx << 16 | (unsigned)1);
}
