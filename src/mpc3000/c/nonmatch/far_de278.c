/* differs: 308 at +3, 255 bytes; 311 at +3, 256 bytes; 312 at +3, 256 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_9CFD {
    int f_0;
};
extern char TBL_9C35[];
extern char TBL_9C67[];
extern char TBL_9C99[];
extern char TBL_9CCB[];
extern struct g_TBL_9CFD TBL_9CFD;
extern int W_9D61;
extern int W_9D63;
extern int W_9D65;
extern long far far_dcf84(int, int, int, int);
extern int far far_dd0fb(void);

int far far_de278(long arg_0)
{
    int ax;
    unsigned int bx;
    int bx2;
    int cx;
    int cx2;
    int near *di;
    int di2;
    int t1;

    if (W_9D65 <= 0) {
        W_9D61 = 1;
        goto L1;
    }
    bx = W_9D61;
    di = (int near *)&TBL_9CFD;
    cx = bx;
    ax = 0;
    for (;;) {
        if (*di != ax) {
            di = di + 1;
            cx = cx - 1;
            if (cx == 0) {
                goto L2;
            }
            continue;
        }
        break;
    }
    goto L1;
    goto L3;
    goto L1;
L2:
    if (bx < 50) {
        W_9D61 = W_9D61 + 1;
L1:
        di2 = (int)arg_0;
        t1 = far_dd0fb();
        TBL_9C67[UNDEF] = (char)t1;
        TBL_9C35[UNDEF] = (char)(t1 >> 8);
        TBL_9CCB[UNDEF] = *(char far *)MK_FP(UNDEF, di2 + 2);
        TBL_9C99[UNDEF] = *(char far *)MK_FP(UNDEF, di2 + 4);
        bx2 = UNDEF << 1;
        cx2 = (unsigned int)(*(char far *)MK_FP(UNDEF, di2 + 6) << 8 | (unsigned char)(*(char far *)MK_FP(UNDEF, di2 + 5) << 1)) >> 1;
        if (W_9D65 == 0) {
            W_9D65 = cx2;
            W_9D63 = cx2;
            *(int *)((char *)&TBL_9CFD + 0 + bx2) = cx2;
        } else if (cx2 >= W_9D63) {
            *(int *)((char *)&TBL_9CFD + 0 + bx2) = cx2 + W_9D65 - W_9D63;
        } else {
            W_9D65 = W_9D65 + (cx2 - W_9D63);
            W_9D63 = cx2;
            *(int *)((char *)&TBL_9CFD + 0 + bx2) = W_9D65;
        }
        *(char far *)MK_FP(UNDEF, di2) = (char)(*(char far *)MK_FP(UNDEF, di2) & -9);
        ax = (int)far_dcf84(di2, UNDEF, 5, 0);
        *(char far *)MK_FP(UNDEF, di2) = (char)(*(char far *)MK_FP(UNDEF, di2) | 8);
    }
L3:
    return ax;
}
