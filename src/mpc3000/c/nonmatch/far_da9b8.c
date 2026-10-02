/* differs: 308 at +3, 129 bytes; 311 at +3, 129 bytes; 312 at +3, 129 bytes */
long far far_da9b8(int arg_0, unsigned int arg_2, int arg_4, int arg_6)
{
    int ax;
    int bx;
    int bx2;
    unsigned int bx3;
    int cx;
    int cx2;
    unsigned int dx2;
    unsigned int dx3;

    bx = 0;
    cx = 4;
L1:
    arg_2 = arg_2 << 1;
    bx = bx << 1 | arg_2 >> 15 & 1;
    cx = cx - 1;
    if (cx != 0) {
        goto L1;
    }
    dx2 = arg_2 + arg_0;
    bx2 = bx + (dx2 < arg_2);
    dx3 = dx2 + arg_4;
    bx3 = bx2 + arg_6 + (dx3 < dx2);
    ax = dx3 & 15;
    cx2 = ((char)(cx >> 8) << 8 | (unsigned char)4);
L2:
    bx3 = bx3 >> 1;
    dx3 = dx3 >> 1 | (bx3 & 1) << 15;
    cx2 = cx2 - 1;
    if (cx2 != 0) {
        goto L2;
    }
    return ((long)dx3 << 16 | (unsigned)ax);
}
