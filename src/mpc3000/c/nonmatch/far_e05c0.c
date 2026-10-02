/* differs: 308 at +5, 54 bytes; 311 at +5, 54 bytes; 312 at +5, 54 bytes */
long far far_e05c0(int arg_0, int arg_2, int arg_4, int arg_6)
{
    int loc_4;
    int loc_2;
    unsigned int bx;
    unsigned int bx2;
    unsigned int bx3;
    int cx;
    int cx2;
    long t1;

    t1 = (unsigned long)(unsigned int)arg_2 << 4;
    bx = arg_0;
    bx2 = bx + (int)t1;
    bx3 = bx2 + arg_4;
    cx2 = (int)(t1 >> 16) + (bx2 < bx) + arg_6 + (bx3 < bx2);
    loc_2 = cx2;
    loc_4 = bx3;
    return ((long)(unsigned)(*(long *)((char *)&loc_4 + 0) >> 4) << 16 | (unsigned)(loc_4 & 15));
}
