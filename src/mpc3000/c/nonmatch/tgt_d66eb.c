/* differs: 308 at +0, 139 bytes; 311 at +0, 139 bytes; 312 at +0, 138 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_B_D613 {
    char f_0;
    char f_1;
};
extern char B_817F;
extern char B_8180;
extern char B_A5C1;
extern struct g_B_D613 B_D613;
extern int TBL_7144[];
extern char TBL_7148[];
extern char TBL_714C[];
extern char TBL_714E[];
extern int far far_fb3a9(void);
extern int far far_fb4a2(void);
extern void near fn_d693e(void);
extern long near fn_d699c(void);

long near tgt_d66eb(void)
{
    int ax;
    int ax2;
    int bx;
    int dx;
    int si;
    int t1;
    long t2;
    int t3;

    if ((char)ax != 0) {
        if (B_817F != 0) {
            ax = ((char)(ax >> 8) << 8 | (unsigned char)B_8180);
        }
        TBL_714C[si] = (char)ax;
        TBL_714E[si] = (char)64;
    } else {
        TBL_7148[si] = (char)(TBL_7148[si] & -17);
        TBL_714C[si] = (char)64;
    }
    fn_d693e();
    t2 = fn_d699c();
    bx = UNDEF;
    ax2 = (int)t2;
    dx = (int)(t2 >> 16);
    if (B_A5C1 == 0) {
        t3 = far_fb4a2();
        B_D613.f_0 = B_A5C1;
        B_D613.f_1 = (char)0;
        ax2 = far_fb3a9();
        dx = UNDEF;
        bx = bx;
        si = si;
    }
    TBL_7144[si] = bx;
    return ((long)dx << 16 | (unsigned)ax2);
}
