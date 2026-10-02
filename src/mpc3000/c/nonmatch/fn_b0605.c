/* differs: 308 at +16, 31 bytes; 311 at +16, 31 bytes; 312 at +16, 31 bytes */
#define SEG_DATA _DS
extern char B_7B8D;
extern unsigned char B_7B93[];
extern int FP_7B8F;
extern int W_7B91;
extern long far fn_b05de(void);
long far fn_b05de(void) { return 0; }

long far fn_b0605(int arg_0)
{
    int ax;
    int dx;

    if (arg_0 < 0) {
        arg_0 = 0;
    }
    B_7B8D = (char)0;
    W_7B91 = SEG_DATA;
    FP_7B8F = (int)(unsigned)B_7B93;
    FP_7B8F = FP_7B8F + 1;
    for (;;) {
        ax = arg_0;
        arg_0 = arg_0 - 1;
        if (ax == 0) {
            break;
        }
        dx = (int)(fn_b05de() >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
