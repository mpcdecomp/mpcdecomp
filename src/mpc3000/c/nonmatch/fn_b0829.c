/* differs: 308 absent; 311 at +4, 54 bytes; 312 at +4, 54 bytes */
extern unsigned char TBL_0F77[];

long far fn_b0829(int arg_0, int arg_2)
{
    int bx;
    int cx;
    int dx;
    int near *si;

    cx = arg_0 + (arg_2 << 8);
    dx = 0;
    si = (int near *)0xef5;
    do {
        bx = *si;
        if (bx == 0) {
            break;
        }
        if (bx == cx) {
            goto L1;
        }
        si = si + 1;
        dx = dx + 1;
    } while (si != (int near *)TBL_0F77);
    return ((long)dx << 16 | (unsigned)-1);
L1:
    return ((long)dx << 16 | (unsigned)dx);
}
