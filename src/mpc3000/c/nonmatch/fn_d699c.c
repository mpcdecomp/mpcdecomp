/* differs: 308 at +0, 94 bytes; 311 at +0, 94 bytes; 312 at +0, 94 bytes */
#define UNDEF 0
extern unsigned char B_83C2;
extern char B_9447;
extern char TBL_9784[];
extern int W_945C;
extern int far far_dac6a(void);

long near fn_d699c(void)
{
    int ax;
    int bx;
    int dx;
    int p2;
    int si;
    int t1;

    TBL_9784[si] = (char)(TBL_9784[si] + 1);
    if (B_9447 != 0) {
        p2 = ax;
        bx = B_83C2;
        if (si == ((char)(bx >> 8) << 8 | (unsigned char)((char)bx - 1))) {
            t1 = far_dac6a();
            dx = UNDEF;
            if (!CC("ns", UNDEF)) {
                W_945C = W_945C + 1;
            }
        }
        ax = p2;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
