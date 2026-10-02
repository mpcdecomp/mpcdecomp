/* differs: 308 at +5, 228 bytes; 311 at +5, 228 bytes; 312 at +5, 228 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_1D71;
extern char B_7B87;
extern int FP_7B55;
extern char TBL_7B5E[];
extern int far far_b0e80(long);
extern int far far_b1ae0(int);

void far fn_b27ab(int arg_0)
{
    char loc_1;
    char loc_4[3];
    char far *loc_6;
    int ax;
    int ax2;
    int cx;
    int di;
    int di2;
    int es;
    int t1;
    int t2;
    int t3;

    t1 = far_b0e80(*(long *)((char *)&FP_7B55 + 0));
    ax = ((char)-(B_7B87 < 0) << 8 | (unsigned char)TBL_7B5E[B_7B87]);
    es = SEG_DATA;
    t2 = __repne_scas1(MK_FP(es, 0x1d70), 0, -1);
    cx = ~t2;
    di = -1 - t2 + 0x1d70 - cx;
    di2 = di + (cx - __repne_scas1(MK_FP(es, di), (char)ax, cx));
    if (!CC("==", UNDEF)) {
        di2 = 1;
        es = 0;
    }
    *(int *)((char *)&loc_4 + 0) = es;
    *(int *)((char *)&loc_6 + 0) = di2 - 1;
    if ((di2 - 1 | es) != 0) {
        loc_1 = loc_6[arg_0];
        if (loc_1 == 62) {
            loc_1 = B_1D71;
        }
        if (loc_1 == 60) {
            loc_1 = (char)95;
        }
    } else {
        loc_1 = B_1D71;
    }
    far_b1ae0(loc_1);
    t3 = far_b1ae0(8);
    TBL_7B5E[B_7B87] = loc_1;
    return;
}
