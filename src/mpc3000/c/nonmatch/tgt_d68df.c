/* differs: 308 at +0, 164 bytes; 311 absent; 312 absent */
#define UNDEF 0
struct g_B_D613 {
    char f_0;
    char f_1;
};
extern char B_8077;
extern char B_977B;
extern char B_A5C1;
extern struct g_B_D613 B_D613;
extern int TBL_7144[];
extern char TBL_714C[];
extern int far far_fb3a9(void);
extern int far far_fb4a2(void);
extern void near fn_d693e(void);
extern long near fn_d699c(void);
extern void near tgt_d68d5();
void near tgt_d68d5(void) { }

long near tgt_d68df(void)
{
    int ax;
    int bx;
    int cx;
    int cx2;
    int cx3;
    int dx;
    int si;
    int t1;
    long t2;
    int t3;

    bx = (int)(unsigned)tgt_d68d5;
    TBL_714C[si] = (char)ax;
    if ((char)ax == 64) {
        goto L1;
    }
    cx = ((char)(cx2 >> 8) << 8 | (unsigned char)B_977B);
    cx3 = ((char)(cx >> 8) << 8 | (unsigned char)((char)cx - (char)ax));
    if ((char)cx3 < 0) {
        cx3 = ((char)(cx3 >> 8) << 8 | (unsigned char)-(char)cx3);
    }
    if ((char)cx3 >= B_8077) {
L1:
        B_977B = (char)ax;
        fn_d693e();
        t2 = fn_d699c();
        bx = UNDEF;
        ax = (int)t2;
        dx = (int)(t2 >> 16);
        if (B_A5C1 == 0) {
            t3 = far_fb4a2();
            B_D613.f_0 = B_A5C1;
            B_D613.f_1 = (char)0;
            ax = far_fb3a9();
            dx = UNDEF;
            bx = bx;
            si = si;
        }
    }
    TBL_7144[si] = bx;
    return ((long)dx << 16 | (unsigned)ax);
}
