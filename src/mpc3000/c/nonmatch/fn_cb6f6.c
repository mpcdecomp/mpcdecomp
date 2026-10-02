/* differs: 308 at +5, 101 bytes; 311 at +5, 101 bytes; 312 at +5, 101 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far fn_cb6f6(int arg_0, long arg_2, int arg_6)
{
    int loc_2;
    int bx;
    int cx;
    int di;
    int es;
    long t1;

    loc_2 = 0x7530;
    cx = arg_6;
    di = (int)arg_2;
    es = (int)(arg_2 >> 16);
    bx = 0;
    do {
        bx = bx + (int)((long)(int)loc_2 * (long)(int)arg_0 >> 16);
        *(int far *)MK_FP(es, di) = bx;
        di = di + 2;
        t1 = (long)(int)bx * (long)(int)arg_0;
        loc_2 = loc_2 - (int)(t1 >> 16);
        cx = cx - 1;
    } while (cx != 0);
    return t1;
}
