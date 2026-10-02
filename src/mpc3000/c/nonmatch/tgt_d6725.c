/* differs: 308 at +0, 88 bytes; 311 at +0, 90 bytes; 312 absent */
#define UNDEF 0
struct g_B_D613 {
    char f_0;
    char f_1;
};
extern char B_A5C1;
extern struct g_B_D613 B_D613;
extern int TBL_7144[];
extern char TBL_714C[];
extern int far far_fb3a9(void);
extern int far far_fb4a2(void);
extern void near fn_d693e(void);
extern long near fn_d699c(void);

long near tgt_d6725(void)
{
    int ax;
    int ax2;
    int bx;
    int dx;
    int si;
    int t1;
    long t2;
    int t3;

    TBL_714C[si] = (char)ax;
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
