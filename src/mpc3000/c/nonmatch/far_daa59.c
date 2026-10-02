/* differs: 308 at +3, 99 bytes; 311 at +3, 99 bytes; 312 at +3, 99 bytes */
long far far_daa59(int arg_0, unsigned int arg_2)
{
    int ax;
    int bx;
    unsigned int bx2;
    int cx;
    int cx2;
    unsigned int dx2;

    bx = 0;
    cx = 4;
    do {
        arg_2 = arg_2 << 1;
        bx = bx << 1 | arg_2 >> 15 & 1;
        cx = cx - 1;
    } while (cx != 0);
    dx2 = arg_2 + arg_0;
    bx2 = bx + (dx2 < arg_2);
    ax = dx2 & 15;
    cx2 = ((char)(cx >> 8) << 8 | (unsigned char)4);
    do {
        bx2 = bx2 >> 1;
        dx2 = dx2 >> 1 | (bx2 & 1) << 15;
        cx2 = cx2 - 1;
    } while (cx2 != 0);
    return ((long)dx2 << 16 | (unsigned)ax);
}
