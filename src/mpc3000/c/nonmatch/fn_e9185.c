/* differs: 308 at +5, 236 bytes; 311 at +5, 236 bytes; 312 at +5, 235 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_cad90(void far *, int, int);
extern int far far_cb566(void far *, long, long, int);

int far fn_e9185(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8)
{
    int loc_2;
    long loc_4;
    int loc_6;
    unsigned long loc_8;
    int loc_a;
    int loc_c;
    int ax;
    int bx;
    unsigned int cx;
    unsigned int cx2;
    unsigned int dx;
    int flags;
    int flags2;
    unsigned int si;
    long t1;
    int t2;

    loc_2 = 0;
    *(int *)((char *)&loc_4 + 0) = 0;
    dx = arg_6;
    loc_6 = arg_8 << 1 | dx >> 15 & 1;
    *(int *)((char *)&loc_8 + 0) = dx << 1;
    si = 0x4800;
    for (;;) {
        flags = loc_6;
        if (!CC(">", flags) && (CC("!=", flags) || *(int *)((char *)&loc_8 + 0) == 0)) {
            break;
        }
        flags2 = 0 - loc_6;
        if (!CC("<", flags2) && (CC(">", flags2) || si > (unsigned int)*(int *)((char *)&loc_8 + 0))) {
            si = *(int *)((char *)&loc_8 + 0);
        }
        t1 = loc_4 / 2L;
        cx = arg_2;
        cx2 = cx + (int)t1;
        bx = arg_4 + (int)(t1 >> 16) + (cx2 < cx);
        loc_a = bx;
        loc_c = cx2;
        t2 = far_cb566(MK_FP(0xa28f /* SEG_A28F */, 0), ((long)bx << 16 | (unsigned)cx2), (unsigned long)(unsigned int)(si >> 1), 1);
        ax = far_cad90(MK_FP(0xa28f /* SEG_A28F */, 0), arg_0, si);
        if (ax != 0) {
            goto L1;
        }
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + si;
        loc_2 = (int)(loc_4 + (unsigned long)(unsigned int)si >> 16);
        *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) - si;
        loc_6 = (int)(loc_8 - (unsigned long)(unsigned int)si >> 16);
    }
    return 0;
L1:
    return ax;
}
