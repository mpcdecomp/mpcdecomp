/* differs: 308 at +5, 149 bytes; 311 at +5, 151 bytes; 312 at +5, 151 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_1D84 {
    long f_0;
};
extern char B_E561;
extern char B_E564;
extern char B_E565;
extern char B_E566;
extern char B_E567;
extern struct g_TBL_1D84 TBL_1D84;
extern long far far_d7805(int, void far *, int, int);

long far far_b2da1(int arg_0)
{
    int loc_2;
    int ax;
    int bx;
    unsigned int cx;
    int cx2;
    int es;
    long t1;

    t1 = far_d7805(arg_0, MK_FP(SEG_DATA, -0x208e), 3, 32);
    loc_2 = arg_0 % 12;
    ax = arg_0 / 12;
    B_E561 = (char)40;
    bx = loc_2 << 2;
    es = (int)(*(long *)((char *)&TBL_1D84 + 0 + bx) >> 16);
    cx = ~__repne_scas1(MK_FP(es, (int)*(long *)((char *)&TBL_1D84 + 0 + bx)), 0, -1);
    cx2 = cx >> 1;
    __movs2(MK_FP(SEG_DATA, -0x208a), MK_FP(es, -0x208a), cx2 * 2);
    __movs1(MK_FP(SEG_DATA, cx2 * 2 - 0x208a), MK_FP(es, cx2 * 2 - 0x208a), cx & 1);
    if (ax - 2 < 0) {
        B_E564 = (char)45;
        B_E565 = (char)(48 - ((char)ax - 2));
    } else {
        B_E564 = (char)((char)ax + 46);
        B_E565 = (char)32;
    }
    B_E566 = (char)41;
    B_E567 = (char)0;
    return (long)MK_FP(SEG_DATA, -0x208e);
}
