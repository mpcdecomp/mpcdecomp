/* differs: 308 at +5, 295 bytes; 311 at +5, 297 bytes; 312 at +5, 297 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_D663 {
    int f_0;
};
struct g_TBL_D661 {
    int f_0;
};
struct g_TBL_D65D {
    int f_0;
};
struct g_TBL_D65F {
    int f_0;
};
extern char TBL_D65B[];
extern char TBL_D65C[];
extern struct g_TBL_D65D TBL_D65D;
extern struct g_TBL_D65F TBL_D65F;
extern struct g_TBL_D661 TBL_D661;
extern struct g_TBL_D663 TBL_D663;

int far fn_ccaf6(unsigned long arg_0, int arg_2, char arg_4)
{
    int loc_2;
    int loc_4;
    int ax;
    int cx;
    int di;
    unsigned int dx;
    int dx2;
    unsigned int dx3;
    unsigned int dx4;
    int flags;
    char near *si;
    int si2;
    long t1;
    long t2;

    di = 0;
    si = TBL_D65B;
    for (;;) {
        if (*si != 0) {
            si = si + 10;
            di = di + 1;
            if ((unsigned int)(unsigned)si == -0x23d8) {
                break;
            }
            continue;
        }
        break;
    }
    if (di == 0x12c) {
        return -2;
    }
    cx = 0;
    si2 = 0;
    for (;;) {
        if (TBL_D65B[si2] != -1) {
            goto L1;
        }
        ax = *(int *)((char *)&TBL_D663 + 0 + si2);
        dx = *(int *)((char *)&TBL_D661 + 0 + si2);
        flags = ax - arg_2;
        if (!CC(">=u", flags)) {
            goto L1;
        }
        if (!CC("!=", flags) && dx < (unsigned int)*(int *)((char *)&arg_0 + 0)) {
L1:
            si2 = si2 + 10;
            cx = cx + 1;
            if (si2 != 0xbb8) {
                continue;
            }
            break;
        }
        goto L2;
    }
    return -2;
L2:
    t1 = (long)(int)cx * 10L;
    TBL_D65B[(int)t1] = (char)1;
    TBL_D65C[(int)t1] = arg_4;
    dx2 = *(int *)((char *)&TBL_D661 + 0 + (int)t1);
    loc_2 = (int)(((long)*(int *)((char *)&TBL_D663 + 0 + (int)t1) << 16 | (unsigned)dx2) - arg_0 >> 16);
    loc_4 = dx2 - *(int *)((char *)&arg_0 + 0);
    *(int *)((char *)&TBL_D663 + 0 + (int)t1) = arg_2;
    *(int *)((char *)&TBL_D661 + 0 + (int)t1) = *(int *)((char *)&arg_0 + 0);
    if ((loc_4 | loc_2) != 0) {
        t2 = (long)(int)di * 10L;
        TBL_D65B[(int)t2] = (char)-1;
        TBL_D65C[(int)t2] = (char)-1;
        dx3 = *(int *)((char *)&TBL_D65D + 0 + (int)t1);
        dx4 = dx3 + *(int *)((char *)&TBL_D661 + 0 + (int)t1);
        *(int *)((char *)&TBL_D65F + 0 + (int)t2) = *(int *)((char *)&TBL_D65F + 0 + (int)t1) + *(int *)((char *)&TBL_D663 + 0 + (int)t1) + (dx4 < dx3);
        *(int *)((char *)&TBL_D65D + 0 + (int)t2) = dx4;
        *(int *)((char *)&TBL_D663 + 0 + (int)t2) = loc_2;
        *(int *)((char *)&TBL_D661 + 0 + (int)t2) = loc_4;
    }
    return cx;
}
