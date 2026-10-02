/* differs: 308 at +0, 54 bytes; 311 at +0, 54 bytes; 312 at +0, 54 bytes */
long far fn_c2aec(void)
{
    int ax;
    int bx;
    int dx;

    bx = 1;
    while (bx < 32) {
        outpw(96, bx + 0xa00);
        dx = 108;
        ax = 0;
        outpw(dx, ax);
        bx = bx + 1;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
