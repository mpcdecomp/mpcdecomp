/* differs: 308 at +5, 56 bytes; 311 at +5, 56 bytes; 312 at +5, 56 bytes */
long far far_e0601(int arg_0, int arg_2, long arg_4)
{
    int loc_4;
    int loc_2;
    unsigned int bx;
    unsigned int bx2;
    int cx;
    int cx2;
    long t1;

    t1 = (unsigned long)(unsigned int)arg_2 << 4;
    bx = arg_0;
    bx2 = bx + (int)t1;
    cx2 = (int)(((long)((int)(t1 >> 16) + (bx2 < bx)) << 16 | (unsigned)bx2) - arg_4 >> 16);
    loc_2 = cx2;
    loc_4 = bx2 - *(int *)((char *)&arg_4 + 0);
    return ((long)(unsigned)(*(long *)((char *)&loc_4 + 0) >> 4) << 16 | (unsigned)(loc_4 & 15));
}
