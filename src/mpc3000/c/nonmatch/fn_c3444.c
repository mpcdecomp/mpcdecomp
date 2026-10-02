/* differs: 308 at +6, 30 bytes; 311 at +6, 30 bytes; 312 at +6, 30 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void far fn_c3444(int arg_0, int arg_2, long arg_4)
{
    char loc_1;
    int bx;
    int es;

    bx = (int)arg_4;
    es = (int)(arg_4 >> 16);
    loc_1 = (char)(1 << (char)((int)(*(long *)((char *)&arg_0 + 0) / *(long far *)MK_FP(es, bx + 24)) % 8));
    return;
}
