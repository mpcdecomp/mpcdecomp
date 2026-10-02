/* differs: 308 absent; 311 at +0, 155 bytes; 312 at +0, 155 bytes */
#define UNDEF 0
extern char B_7FD1;
extern char B_7FD3;
extern char B_7FD4;
extern char B_A5C2;
extern int TBL_7144[];
extern char TBL_7148[];
extern int W_945C;
extern int W_D5E5;
extern int far far_dac6a(void);
extern int near tgt_d651f();
int near tgt_d651f(void) { return 0; }

int near tgt_d666c(void)
{
    int ax;
    int ax2;
    int ax3;
    int si;
    int t1;

    if (B_7FD1 == 0 && B_7FD3 != 0 && B_7FD4 != 0) {
        ax = ((char)ax2 << 8 | (unsigned char)TBL_7148[si]);
        ax3 = (unsigned int)((char)(ax >> 8) << 8 | (unsigned char)((char)ax << 1)) >> 1;
        W_D5E5 = ax3;
        ax2 = ((char)(ax3 >> 8) << 8 | (unsigned char)110);
        if (B_A5C2 == 0) {
            t1 = far_dac6a();
            if (!CC("ns", UNDEF)) {
                W_945C = W_945C + 1;
            }
            ax2 = far_dac6a();
            if (!CC("ns", UNDEF)) {
                W_945C = W_945C + 1;
            }
        }
    }
    TBL_7144[si] = (int)(unsigned)tgt_d651f;
    return ax2;
}
