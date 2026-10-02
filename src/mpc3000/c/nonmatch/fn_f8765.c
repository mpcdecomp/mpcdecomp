/* differs: 308 at +0, 122 bytes; 311 at +0, 122 bytes; 312 at +0, 122 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[28];
    int f_1c;
    int f_1e;
    char pad_20[41];
    long f_49;
    int f_4d;
    int f_4f;
};

void near fn_f8765(void)
{
    int ax;
    int ax2;
    unsigned int cx;
    unsigned int dx;
    int dx2;
    struct s1 near *si;

    *(int *)((char near *)si + 73) = *(int *)((char near *)si + 73) + cx;
    *(int *)((char near *)si + 75) = (int)(si->f_49 + (unsigned long)(unsigned int)cx >> 16);
    ax = si->f_1c;
    dx = si->f_1e;
    ax2 = ax - *(int *)((char near *)si + 73);
    dx2 = (int)(((long)dx << 16 | (unsigned)ax) - si->f_49 >> 16);
    if (dx >= (unsigned int)*(int *)((char near *)si + 75)) {
        si->f_4d = si->f_4d - cx;
        if ((ax2 | dx2) == 0) {
            goto L1;
        }
    } else {
        cx = cx + ax2;
        *(int *)((char near *)si + 73) = si->f_1c;
        *(int *)((char near *)si + 75) = si->f_1e;
L1:
        si->f_4d = 0;
    }
    si->f_4f = si->f_4f + cx;
    return;
}
