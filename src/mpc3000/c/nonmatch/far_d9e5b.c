/* differs: 308 at +0, 103 bytes; 311 at +0, 103 bytes; 312 at +0, 103 bytes */
long far far_d9e5b(void)
{
    unsigned int ax;
    int cx;
    unsigned int dx;
    int t1;

    outpw(96, 0);
    dx = inpw(100);
    t1 = inpw(102);
    ax = inpw(98);
    cx = 12;
    do {
        dx = dx >> 1;
        ax = ax >> 1 | (dx & 1) << 15;
        cx = cx - 1;
    } while (cx != 0);
    return ((long)((char)(dx >> 8) << 8 | (unsigned char)((char)dx | (char)t1 << 4)) << 16 | (unsigned)ax);
}
