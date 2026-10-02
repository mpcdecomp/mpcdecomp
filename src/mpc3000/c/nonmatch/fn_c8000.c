/* differs: 308 at +5, 70 bytes; 311 at +5, 70 bytes; 312 at +5, 70 bytes */
extern long far far_e6cb9(int);

long far fn_c8000(int arg_0)
{
    long loc_4;
    int loc_2;
    int dx;
    long t1;

    t1 = far_e6cb9(arg_0);
    loc_2 = (int)(t1 >> 16);
    *(int *)((char *)&loc_4 + 0) = (int)t1;
    if (((int)t1 | (int)(t1 >> 16)) != 0) {
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 2;
        loc_2 = (int)(loc_4 + 2L >> 16);
    }
    dx = *(int *)((char *)&loc_4 + 0);
    return (((long)loc_2 << 16 | (unsigned)dx) + 0x3ffL) / 0x400L;
}
