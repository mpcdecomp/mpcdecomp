/* differs: 308 at +3, 71 bytes; 311 at +3, 71 bytes; 312 at +3, 71 bytes */
long far far_daa3c(int arg_0, unsigned int arg_2)
{
    unsigned int ax2;
    int cx;
    int dx;
    unsigned int dx2;

    dx = 0;
    cx = 4;
    do {
        arg_2 = arg_2 << 1;
        dx = dx << 1 | arg_2 >> 15 & 1;
        cx = cx - 1;
    } while (cx != 0);
    ax2 = arg_2 + arg_0;
    dx2 = dx + (ax2 < arg_2);
    return ((long)(dx2 >> 4 | dx2 << 12) << 16 | (unsigned)ax2);
}
