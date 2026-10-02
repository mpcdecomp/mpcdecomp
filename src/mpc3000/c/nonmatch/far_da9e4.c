/* differs: 308 at +3, 100 bytes; 311 at +3, 100 bytes; 312 at +3, 100 bytes */
long far far_da9e4(int arg_0, unsigned int arg_2, int arg_4, int arg_6)
{
    unsigned int ax2;
    unsigned int ax3;
    int cx;
    int dx;
    int dx2;
    unsigned int dx3;

    dx = 0;
    cx = 4;
    do {
        arg_2 = arg_2 << 1;
        dx = dx << 1 | arg_2 >> 15 & 1;
        cx = cx - 1;
    } while (cx != 0);
    ax2 = arg_2 + arg_0;
    dx2 = dx + (ax2 < arg_2);
    ax3 = ax2 + arg_4;
    dx3 = dx2 + arg_6 + (ax3 < ax2);
    return ((long)(dx3 >> 4 | dx3 << 12) << 16 | (unsigned)ax3);
}
