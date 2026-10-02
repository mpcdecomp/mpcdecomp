/* differs: 308 at +0, 178 bytes; 311 at +0, 177 bytes; 312 at +0, 177 bytes */
#define UNDEF 0
struct g_B_D613 {
    char f_0;
    char f_1;
};
extern char B_7FEE;
extern char B_8078;
extern char B_956B;
extern char B_977A;
extern char B_A5C1;
extern struct g_B_D613 B_D613;
extern int TBL_7144[];
extern char TBL_714A[];
extern int far far_fb3a9(void);
extern int far far_fb4a2(void);
extern void near fn_d693e(void);
extern long near fn_d699c(void);

long near tgt_d67ae(void)
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

    B_956B = (char)ax;
    if ((B_7FEE & 1) == 0) {
        goto L1;
    }
    if ((char)ax == 0 || (char)ax == 127) {
        goto L2;
    }
    cx = ((char)(cx2 >> 8) << 8 | (unsigned char)B_977A);
    cx3 = ((char)(cx >> 8) << 8 | (unsigned char)((char)cx - (char)ax));
    if ((char)cx3 < 0) {
        cx3 = ((char)(cx3 >> 8) << 8 | (unsigned char)-(char)cx3);
    }
    if ((char)cx3 < B_8078) {
L1:
    } else {
L2:
        B_977A = (char)ax;
        TBL_714A[si] = (char)ax;
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
void near fn_d693e(void) { }
long near fn_d699c(void) { return 0; }
