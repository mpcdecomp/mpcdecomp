/* differs: 308 at +0, 106 bytes; 311 at +0, 106 bytes; 312 at +0, 106 bytes */
extern char B_7FCF;
extern char B_D5EB;
extern char B_D60A;
extern int W_D5E7;
extern int W_D5E9;
extern int W_D635;
extern int W_D637;
extern void far far_dd6dd(void);

long far far_eb799(void)
{
    unsigned int ax;
    unsigned int ax2;
    int ax3;
    int bx;
    int dx;
    int si;
    int t1;

    if ((((char)(bx >> 8) << 8 | (unsigned char)B_7FCF) & 2) == si) {
        B_D5EB = (char)0;
        if (B_D60A == 20) {
            far_dd6dd();
            ax = W_D635;
            ax2 = ax << 1;
            ax3 = ax2 << 1;
            dx = (W_D637 << 1 | ax >> 15 & 1) << 1 | ax2 >> 15 & 1;
            W_D5E7 = ax3;
            W_D5E9 = dx;
        }
    }
    return ((long)dx << 16 | (unsigned)ax3);
}
