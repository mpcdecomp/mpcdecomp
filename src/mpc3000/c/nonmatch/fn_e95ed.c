/* differs: 308 absent; 311 at +3, 74 bytes; 312 at +3, 74 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void far fn_e95ed(long arg_0)
{
    int bx;
    int bx2;
    int cx;
    int dx;
    int es;
    int es2;

    dx = 0;
    cx = 0;
    for (;;) {
        es = (int)(arg_0 >> 16);
        bx = (int)*(long far *)MK_FP(es, (int)arg_0 + 22);
        if (*(char far *)MK_FP((int)(*(long far *)MK_FP(es, bx + 22) >> 16), bx + 0x150) <= dx) {
            break;
        }
        es2 = (int)(arg_0 >> 16);
        bx2 = (int)*(long far *)MK_FP(es2, (int)arg_0 + 26);
        *(char far *)MK_FP((int)(*(long far *)MK_FP(es2, bx2 + 26) >> 16), bx2 + cx) = (char)-1;
        cx = cx + 24;
        dx = dx + 1;
    }
    return;
}
