/* differs: 308 at +3, 113 bytes; 311 at +3, 113 bytes; 312 at +3, 113 bytes */
long far far_daa07(int arg_0, int arg_2, int arg_4, unsigned int arg_6)
{
    unsigned int ax2;
    unsigned int ax3;
    unsigned int ax4;
    int cx;
    int cx2;
    int dx;
    int dx2;
    int dx3;

    dx = 0;
    cx = 4;
    do {
        arg_6 = arg_6 << 1;
        dx = dx << 1 | arg_6 >> 15 & 1;
        cx = cx - 1;
    } while (cx != 0);
    ax2 = arg_6 + arg_4;
    dx2 = dx + (ax2 < arg_6);
    ax3 = arg_2;
    dx3 = 0;
    cx2 = 4;
    do {
        ax3 = ax3 << 1;
        dx3 = dx3 << 1 | ax3 >> 15 & 1;
        cx2 = cx2 - 1;
    } while (cx2 != 0);
    ax4 = ax3 + arg_0;
    return ((long)(dx3 + (ax4 < ax3)) << 16 | (unsigned)ax4) - ((long)dx2 << 16 | (unsigned)ax2);
}
