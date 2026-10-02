/* differs: 308 at +23, 26 bytes; 311 at +23, 26 bytes; 312 at +23, 26 bytes */
extern char B_E423;
extern int FP_E40C;
extern unsigned char TBL_E44C[];
extern int W_901D;
extern int W_901F;
extern int W_E40E;

long far far_cbbd4(int arg_0)
{
    int dx;

    dx = arg_0 - 35;
    if (dx >= 0) {
        goto L1;
    }
    dx = 0;
L1:
    if (dx < 64) {
        goto L2;
    }
    dx = 63;
L2:
    if (B_E423 != 2) {
        goto L3;
    }
    return ((long)W_E40E << 16 | (unsigned)(FP_E40C + (dx << 2) + 0x63e));
L3:
    if (B_E423 != 1) {
        goto L4;
    }
    if ((W_901D | W_901F) == 0) {
        goto L4;
    }
    return ((long)W_901F << 16 | (unsigned)(W_901D + (dx << 2) + 42));
L4:
    return (long)(unsigned char far *)(TBL_E44C + (dx << 2));
}
