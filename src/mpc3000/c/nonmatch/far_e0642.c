/* differs: 308 at +3, 114 bytes; 311 at +3, 114 bytes; 312 at +3, 114 bytes */
long far far_e0642(int arg_0, int arg_2, int arg_4, int arg_6)
{
    unsigned int ax;
    unsigned int ax2;
    unsigned int bx;
    unsigned int bx2;
    int cx;
    long t1;
    long t2;

    t1 = (unsigned long)(unsigned int)arg_2 << 4;
    ax = arg_0;
    ax2 = ax + (int)t1;
    t2 = (unsigned long)(unsigned int)arg_6 << 4;
    bx = arg_4;
    bx2 = bx + (int)t2;
    return ((long)((int)(t1 >> 16) + (ax2 < ax)) << 16 | (unsigned)ax2) - ((long)((int)(t2 >> 16) + (bx2 < bx)) << 16 | (unsigned)bx2);
}
