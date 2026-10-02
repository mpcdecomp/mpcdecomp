/* differs: 308 at +5, 153 bytes; 311 at +5, 153 bytes; 312 at +5, 153 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[4];
    int f_4;
};
extern unsigned char B_8455;
extern char B_8800;
extern unsigned char B_8A88;
extern char B_D612;
extern unsigned char TBL_8456[];
extern unsigned char TBL_8830[];
extern int W_D610;
extern long far far_de78c(void);
extern long far far_dfeec(void);

long far far_e7073(unsigned int arg_0, int arg_2)
{
    int loc_2;
    struct s1 far *loc_4;
    int ax;
    int ax2;
    int bx;
    int cx;
    int es;
    int flags;
    int si;
    long t1;

    cx = 0x1000;
    if (B_D612 != 0) {
        if (B_8800 != 0) {
            si = B_8455;
            loc_2 = SEG_DATA;
            *(int *)((char *)&loc_4 + 0) = (int)(unsigned)TBL_8456;
        } else {
            si = B_8A88;
            loc_2 = SEG_DATA;
            *(int *)((char *)&loc_4 + 0) = (int)(unsigned)TBL_8830;
        }
        for (;;) {
            ax = si;
            si = si - 1;
            if (ax == 0) {
                break;
            }
            bx = FP_OFF(loc_4);
            es = FP_SEG(loc_4);
            ax2 = *(int far *)MK_FP(es, bx + 2);
            flags = ax2 - arg_2;
            if (!CC(">u", flags) && (CC("!=", flags) || (unsigned int)*(int far *)MK_FP(es, bx) <= arg_0)) {
                cx = loc_4->f_4;
                *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 6;
                continue;
            }
            break;
        }
    }
    W_D610 = cx;
    t1 = far_de78c();
    return far_dfeec();
}
