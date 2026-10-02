/* differs: 308 at +0, 51 bytes; 311 at +0, 51 bytes; 312 at +0, 51 bytes */
#define UNDEF 0
extern char B_713F;
extern int W_713C;
extern int W_945C;
extern int far far_dac6a(void);
extern void near tgt_d612d();
void near tgt_d612d(void) { }

long near tgt_d649d(void)
{
    int ax;
    int dx;

L1:
    ax = far_dac6a();
    dx = UNDEF;
    if (CC("ns", UNDEF)) {
        goto L2;
    }
    W_945C = W_945C + 1;
L2:
    goto L3;
    if ((char)ax != B_713F) {
        goto L2;
    }
    if ((char)ax == 0) {
        goto L1;
    }
    if ((char)ax != 127) {
        goto L2;
    }
    goto L1;
L3:
    W_713C = (int)(unsigned)tgt_d612d;
    return ((long)dx << 16 | (unsigned)ax);
}
