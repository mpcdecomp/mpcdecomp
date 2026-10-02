/* differs: 308 at +0, 123 bytes; 311 at +0, 123 bytes; 312 at +0, 123 bytes */
#define UNDEF 0
extern char B_7FD1;
extern char B_7FD4;
extern char B_A5C2;
extern char B_D4B1;
extern int TBL_7144[];
extern int W_945C;
extern int far far_dac6a(void);
extern long near tgt_d651f();
long near tgt_d651f(void) { return 0; }

long near tgt_d6693(void)
{
    int ax;
    int dx;
    int si;
    int t1;

    if (B_7FD1 == 0 && B_7FD4 != 0) {
        B_D4B1 = (char)ax;
        ax = ((char)(ax >> 8) << 8 | (unsigned char)109);
        if (B_A5C2 == 0) {
            t1 = far_dac6a();
            if (!CC("ns", UNDEF)) {
                W_945C = W_945C + 1;
            }
            ax = far_dac6a();
            dx = UNDEF;
            if (!CC("ns", UNDEF)) {
                W_945C = W_945C + 1;
            }
        }
    }
    TBL_7144[si] = (int)(unsigned)tgt_d651f;
    return ((long)dx << 16 | (unsigned)ax);
}
